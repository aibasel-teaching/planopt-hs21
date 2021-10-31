#include "h_pdb.h"

#include "../pdbs/pattern_generator.h"

#include "../option_parser.h"
#include "../plugin.h"

using namespace pdbs;
using namespace std;

namespace planopt_heuristics {
PDBHeuristic::PDBHeuristic(const options::Options &options)
    : Heuristic(options),
      pdb(create_tnf_task(task_proxy),
          options.get<shared_ptr<PatternGenerator>>("pattern")->generate(
              task).get_pattern()) {
}

int PDBHeuristic::compute_heuristic(const State &state) {
    state.unpack();
    const TNFState &tnf_state = state.get_unpacked_values();

    int h = pdb.lookup_distance(tnf_state);
    if (h == numeric_limits<int>::max()) {
        return DEAD_END;
    } else {
        return h;
    }
}

static shared_ptr<Heuristic> _parse(OptionParser &parser) {
    Heuristic::add_options_to_parser(parser);
    parser.add_option<shared_ptr<PatternGenerator>>(
        "pattern", "pattern generation method", "greedy()");
    Options opts = parser.parse();
    if (parser.dry_run())
        return nullptr;
    else
        return make_shared<PDBHeuristic>(opts);
}

static Plugin<Evaluator> _plugin("planopt_pdb", _parse);
}
