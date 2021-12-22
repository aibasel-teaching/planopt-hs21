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
    # TODO: add your code here.
    # Return a float (even though heuristic values are integers).


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
    # TODO: add your code here.
    # Return a state - either s or the successor if applying best_a
    # succeeded.

    # Note: get_successors of Instance either returns a single successor
    # in which case we have to pick it (its probability is 1), or it
    # returns exactly two successors and the first one is the same state
    # as the given one. We can therefore, with probability of
    # transitioning to the second state, sample this second state, and
    # otherewise just return the given state.


"""
Perform an RTDP trial: starting from the initial state, repeatedly
compute the best available action, update the value of the current
state according to this action, and sample a successor from applying
this action. Set the state to the successor and repeat until reaching
a goal state.
"""
def perform_trial(inst, values):
    # TODO: add your code here.
    # Make use of compute_greedy_action_and_q_value and sample_successor
    # Return updated value function values.


"""
Run the RTDP algorithm for most num_iterations iterations (also called
trials). In each iteration, perform a trial. Return the final
state-values.
"""
def rtdp(inst, num_iterations):
    # TODO: add your code here.
    # Initialize state-values to be an empty dictionary. (We took care
    # that the above method compute_q_value checks whether the
    # dictionary contains a value for the queried state and if not, to
    # initialize it with the method heuristic called for that state.)
    # In each iteration, make use of perform_trial(). Return the
    # final state-values.


"""
Compute the change (also called residual) of state s under the given
state-values: it is 0 if s is a goal state and it is the difference to
the Q-value of the greedy action in a otherwise.
"""
def change(inst, s, values):
    # TODO: add your code here.
    # Make use of compute_greedy_action_and_value.
    # Return a float.


"""
CheckSolved function of LRTP: Compute the change in state-values of all
states reachable under the greedy policy. If the change is smaller than
some epsilon for all reachable states, then mark them as solved.
Otherwise, update their state-values in reverse order of visit.
"""
def check_solved(inst, given_s, solved, values, epsilon):
    assert given_s != inst.goal

    # TODO: add your code here.
    # Make use of compute_greedy_action_and_value.
    # Return updated labeling solved and updated value function values.


"""
Compute the best available action, update the state-value of the
current state according to this action, and sample a successor from
applying this action (this mimics a trial of RTDP). Recursively visit
the sampled successor and after returning from recursion, call
check_solved on the originally given state s.
"""
def visit(inst, s, solved, values, epsilon):
    # TODO: add your code here.
    # Make use of compute_greedy_action_and_q_value, sample_successor, and
    # check_solved.
    # Return updated labeling solved and updated value function values.


"""
Run the LRTDP algorithm. In each iteration, call visit for the initial
state. Return the final state-values.
"""
def lrtdp(inst, epsilon):
    solved = defaultdict(lambda: False)
    # TODO: add your code here.
    # Initialize state-values to be an empty dictionary. The same
    # comment as for rtdp applies. Use the given solved dictionary
    # which will be automatically initialized with False for any unseen
    # state. In each iteration, update state-values and solved through
    # calling visit. Return the final state-values.


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
        help="epsilon value for convergence of LRTDP", default=0.0001)
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
