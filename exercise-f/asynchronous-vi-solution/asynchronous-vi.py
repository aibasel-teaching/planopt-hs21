#! /usr/bin/env python3

import argparse
import random
import sys

import instance
from utils import print_values, print_policy, wait_for_input


"""
Initialize state-values to 0 for all states for simplicity. (State-
values for non-goal states could be initialized arbitrarily.)
"""
def get_initial_values(inst):
    values = { s: 0.0 for s in inst.states }
    return values


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
Update (in-place) the state-value of a random state according to the
Bellman equation for the given state-values.
"""
def bellman_update_in_place(values):
    s = random.choice(inst.states)
    while s == inst.goal:
        s = random.choice(inst.states)
    _, min_q = compute_greedy_action_and_q_value(inst, s, values)
    values[s] = min_q


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


"""
Run asynchronous value iteration for num_iterations many iterations.
In each iteration, perform a Bellman update for a single random state.
Return the final state-values and the greedy policy.
"""
def asynchronous_value_iteration(inst, num_iterations):
    values = get_initial_values(inst)
    iteration = 1
    while iteration <= num_iterations:
        wait_for_input("Press enter for another iteration of asynchronous value iteration...")
        bellman_update_in_place(values)

        print(f"State-values after iteration {iteration}:")
        print_values(inst, values)

        iteration += 1
    return values, get_greedy_policy(inst, values)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--num-iterations', type=int,
        help="number of iterations that asynchronous value iteration should run", default=300)
    args = parser.parse_args()

    inst = instance.get_example_instance()
    print(inst)

    values, policy = asynchronous_value_iteration(inst, args.num_iterations)
    print("")

    print("Final state-values:")
    print_values(inst, values)

    print("Final policy:")
    print_policy(inst, policy)
