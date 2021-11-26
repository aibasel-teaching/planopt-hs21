#include "pdb.h"

#include "../utils/logging.h"

#include <queue>

using namespace std;

namespace planopt_heuristics {

/*
  An entry in the queue is a tuple (h, i) where h is the goal distance of
  state i. See comments below for details.
*/
using QueueEntry = pair<int, int>;

PatternDatabase::PatternDatabase(const TNFTask &task, const Pattern &pattern)
    : projection(task, pattern) {
    /*
      We want to compute goal distances for all abstract states in the
      projected task. To do so, we start by assuming every abstract state has
      an infinite goal distance and then do a backwards uniform cost search
      updating the goal distances of all encountered states.

      Instead of searching on the actual states, we use perfect hashing to
      run the search on the hash indices of states. To go from a state s to its
      index use rank(s) and to go from an index i to its state use unrank(i).
    */
    const TNFTask &projected_task = projection.get_projected_task();
    distances.resize(projected_task.get_num_states(),
                     numeric_limits<int>::max());

    /*
      Priority queues usually order entries so the largest entry is the first.
      By using the comparator greater<T> instead of the default less<T>, we
      change the ordering to sort the smallest element first.
    */
    priority_queue<QueueEntry, vector<QueueEntry>, greater<QueueEntry>> queue;
    /*
      Note that we start with the goal state to turn the search into a
      regression. We also have to switch the role of precondition and effect in
      operators later on. This is sufficient to turn the search into a
      regression since the task is in TNF.
    */
    int goal_index = projection.rank_state(projected_task.goal_state);
    queue.push({0, goal_index});
    distances[goal_index] = 0;

    while (!queue.empty()) {
        QueueEntry entry = queue.top();
        queue.pop();
        int cost = entry.first;
        int index = entry.second;
        if (distances[index] < cost) {
            continue;
        }

        TNFState state = projection.unrank_state(index);
        for (const TNFOperator &op : projected_task.operators) {
            bool is_applicable = true;
            for (TNFOperatorEntry entry : op.entries) {
                /*
                  Note that we switch the role of precondition and effect here
                  to turn the search into a regression.
                */
                if (state[entry.variable_id] != entry.effect_value) {
                    is_applicable = false;
                    break;
                }
            }
            if (is_applicable) {
                TNFState succ_state(state);
                for (TNFOperatorEntry entry : op.entries) {
                    succ_state[entry.variable_id] = entry.precondition_value;
                }
                int succ_index = projection.rank_state(succ_state);
                int succ_cost = cost + op.cost;
                if (succ_cost < distances[succ_index]) {
                    distances[succ_index] = succ_cost;
                    queue.push({succ_cost, succ_index});
                }
            }
        }
    }
}

int PatternDatabase::lookup_distance(const TNFState &original_state) const {
    TNFState abstract_state = projection.project_state(original_state);
    int index = projection.rank_state(abstract_state);
    return distances[index];

}

}
