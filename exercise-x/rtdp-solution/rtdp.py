#! /usr/bin/env python3

import argparse
from collections import defaultdict
import random
import sys

import instance
from utils import print_values, print_solved, print_policy, wait_for_input


"""
Compute a the Manhattan distance for a state of the example instance,
except for state (2, 3), which is hard-coded to have heuristic value 4.
"""
def heuristic(inst, s):
    # This is a cheat that only works for the specific instance, not for
    # arbitrary cost structure
    if s.x == 2 and s.y == 3:
        return 4.0
    return (inst.width-1-s.x) + (inst.height-1-s.y)


"""
Compute the Q-value for state s and action under the given state-values.
"""
def compute_q_value(inst, s, action, values):
    if s == inst.goal:
        return 0.0

    assert inst.action_is_applicable(s, action)
    res = inst.costs[s]
    succs = inst.get_successors(s, action)
    for (succ, prob) in succs:
        if succ not in values:
            values[succ] = heuristic(inst, succ)
        res += values[succ] * prob
    return res


"""
Compute the greedy action in state s under the given state-values (None
if s is a goal state) and also return the resulting Q-value of that best
action in s.
"""
def compute_greedy_action_and_q_value(inst, s, values):
    if s == inst.goal:
        return None, 0.0

    min_q = float('inf')
    best_a = None
    for a in inst.get_applicable_actions(s):
        q_val = compute_q_value(inst, s, a, values)
        if q_val < min_q:
            best_a = a
            min_q = q_val
    assert best_a is not None
    return best_a, min_q


"""
Sample a successor state of state s applying action best_a.
"""
def sample_successor(inst, s, best_a):
    succs = inst.get_successors(s, best_a)
    if len(succs) == 1:
        succ, prob = succs[0]
        assert prob == 1.0
        return succ
    else:
        assert len(succs) == 2
        assert succs[0][0] == s
        # There are two successors and we know that the first one is the same
        # state as the current one. We can therefore, with probability of
        # transitioning to the second state, sample this second state, and
        # otherwise just return the previous state.
        succ, prob = succs[1]
        if random.random() <= prob:
            return succ
        else:
            return s


"""
Perform an RTDP trial: starting from the initial state, repeatedly
compute the best available action, update the value of the current
state according to this action, and sample a successor from applying
this action. Set the state to the successor and repeat until reaching
a goal state.
"""
def perform_trial(inst, values):
    s = inst.init
    while s != inst.goal:
        best_a, min_q = compute_greedy_action_and_q_value(inst, s, values)
        values[s] = min_q
        s = sample_successor(inst, s, best_a)
    return values


"""
Run the RTDP algorithm for most num_iterations iterations (also called
trials). In each iteration, perform a trial. Return the final
state-values.
"""
def rtdp(inst, num_iterations):
    values = {}
    iteration = 1
    while iteration <= num_iterations:
        wait_for_input("Press enter for another iteration of RTDP...")
        values = perform_trial(inst, values)

        print(f"State-values after iteration {iteration}:")
        print_values(inst, values)

        iteration += 1
    return values


"""
Compute the change (also called residual) of state s under the given
state-values: it is 0 if s is a goal state and it is the difference to
the Q-value of the greedy action in a otherwise.
"""
def change(inst, s, values):
    if s == inst.goal:
        return 0.0

    best_a, min_q = compute_greedy_action_and_q_value(inst, s, values)
    return abs(values[s] - min_q)


"""
CheckSolved function of LRTP: Compute the change in state-values of all
states reachable under the greedy policy. If the change is smaller than
some epsilon for all reachable states, then mark them as solved.
Otherwise, update their state-values in reverse order of visit.
"""
def check_solved(inst, given_s, solved, values, epsilon):
    assert given_s != inst.goal

    all_solved = True
    open_list = []
    closed = []

    if not solved[given_s]:
        open_list.append(given_s)
    while open_list:
        s = open_list.pop()
        closed.append(s)
        if change(inst, s, values) > epsilon:
            all_solved = False
        else:
            assert s != inst.goal
            best_a, min_q = compute_greedy_action_and_q_value(inst, s, values)

            succs = inst.get_successors(s, best_a)
            for succ, prob in succs:
                if succ != inst.goal and not solved[succ] and succ not in open_list and succ not in closed:
                    open_list.append(succ)

    if all_solved:
        for s in closed:
            solved[s] = True
    else:
        while closed:
            s = closed.pop()
            best_a, min_q = compute_greedy_action_and_q_value(inst, s, values)
            values[s] = min_q
    return solved, values


"""
Compute the best available action, update the state-value of the
current state according to this action, and sample a successor from
applying this action (this mimics a trial of RTDP). Recursively visit
the sampled successor and after returning from recursion, call
check_solved on the originally given state s.
"""
def visit(inst, s, solved, values, epsilon):
    if solved[s] or s == inst.goal:
        return (solved, values)

    best_a, min_q = compute_greedy_action_and_q_value(inst, s, values)
    values[s] = min_q
    sprime = sample_successor(inst, s, best_a)
    solved, values = visit(inst, sprime, solved, values, epsilon)
    solved, values = check_solved(inst, s, solved, values, epsilon)
    return solved, values


"""
Run the LRTDP algorithm. In each iteration, call visit for the initial
state. Return the final state-values.
"""
def lrtdp(inst, epsilon):
    solved = defaultdict(lambda: False)
    values = {}
    iteration = 1
    while not solved[inst.init]:
        wait_for_input("Press enter for another iteration of LRTDP...")
        solved, values = visit(inst, inst.init, solved, values, epsilon)
        print(f"State-values after iteration {iteration}:")
        print_values(inst, values)
        print(f"Solved states after iteration {iteration}:")
        print_solved(inst, solved)
        iteration += 1
    return values


"""
Compute a mapping from states to actions that represents the greedy
policy.
"""
def get_greedy_policy(inst, values):
    greedy_policy = {}
    for s in inst.states:
        best_a, _ = compute_greedy_action_and_q_value(inst, s, values)
        if best_a is None:
            assert s == inst.goal
            greedy_policy[s] = ' '
        else:
            assert inst.action_is_applicable(s, best_a)
            greedy_policy[s] = best_a
    return greedy_policy


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'algorithm', choices=['rtdp', 'lrtdp'],
        help="choose among the available algorithms"
    )
    parser.add_argument(
        '--num-iterations', type=int,
        help="number of iterations that RTDP should run at most", default=30)
    parser.add_argument(
        '--epsilon', type=float,
        help="epsilon value for check_solved of LRTDP", default=0.0001)
    args = parser.parse_args()

    inst = instance.get_example_instance()
    print(inst)

    if args.algorithm == 'rtdp':
        values = rtdp(inst, args.num_iterations)
    elif args.algorithm == 'lrtdp':
        values = lrtdp(inst, args.epsilon)
    else:
        sys.exit("Unknown algorithm")
    print("")

    print("Final values:")
    print_values(inst, values)

    policy = get_greedy_policy(inst, values)
    print("Corresponding final policy:")
    print_policy(inst, policy)
