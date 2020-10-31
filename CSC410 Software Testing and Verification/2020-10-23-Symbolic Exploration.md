# 2020-10-23 Symbolic Exploration

* Reachability
  * given some bad states, can a program reach a bad state during execution?
  * Decision problem, answer is Yes/No
  * Start at an initial state, take a step, go from state to state, building a graph of possible states.
    * Can you start from a particular state and get to another known state?
    * DFS over this graph to see if we can reach any bad states!
  * When the graph is huge, DFS may never terminate! We need symbolic methods to tackle huge search spaces.
  * Consider a program with 100 boolean variables.
    * Representing each state individually is not feasible
    * Symbolic representation represents sets of states more compactly
  * If we have 3 symbols, `p`, `q`, `r`, the total number of states here is 8.
    * However, the symbol `p` by itself represents 4 states 
      * All 4 possible assignments to `q` and `r` results in `p` SAT 
    * The sentence `q & ~r` represents the remaining 2. 
      * SAT depending on whether `p` is true or false
  * Formally we have
    * A boolean formula \(F\) represents **the set** of all states \(S\) if \(S \models F\) (S satisfies F)
      * Take all the boolean variables in S, plug them into F, and if F is true, then F is a representation.
      * Can be one or many satisfying assignements, so the precise set of states is the set of all states that satisfy F, i.e \(States(F) = \{S | S \models F \}\)
    * Formulas and sets of states are interchangable 1-1
    * We can manipulate formulas instead of representing graphs
* Logical connectives as operations on Sets
  * Consider \(S_1 = States(F_1)\) and \(S_2 = States(F_2)\)
  * \(S_1 \cup S_2 = States(F_1 \vee F_2)\)
  * \(S_1 \cap S_2 = States(F_1 \wedge F_2)\)
  * \(\bar S_1 = States(\neg F_1)\)
* Reachability algorithm through symbol
  * Start with set of initial states \(s_0 \in R_0\)
  * Collect all such states reachable from one step from \(s_1 \in R_0\) as \(R_1\)
    * \(R_1\) is closed under \(R_0\), i.e. \(R_1\) is the set of states after 0 or 1 steps
    * Continue for an arbitrary number of states, i.e. \(R_2\) the set of states after 0, 1, or 2 states.
  * We represent a state from \(R_i\) to \(R_j\) as a relation \(step(v, v')\) where \(v\) and \(v'\) are vectors of states.
  * Implementation
    * \(R_0 = I\) is the set of initial states
    * \(R_1(v) = [R_0(v') \wedge step(v', v)] \vee R_0(v)\)
      * \([R_0(v') \vee step(v', v)]\) is the set of steps reachable from \(R_0\)
      * We then union such steps with \(R_0\)
    * \(R_2(v) = [R_1(v') \wedge step(v', v)] \vee R_1(v)\)
    * Repeat for all steps
    * Let \(E(v)\) represent all error states
      * At each step \(j\), if \(R_j(v) \wedge E(v)\) is SAT, then an error state is **reachable**
      * Note that \(R_j \wedge E\) is the intersection of two sets
        * asking if this is SAT is equivalent to asking if the intersection of the two sets is non-empty!
        * witness for an error state in up to \(j\) steps
    * If the system is finite state, then \(\exists j. R_j = R_{j+1}\)
      * after a point, we will exhaust all states.
    * We either find a \(j\) such that \(R_j \wedge E\) is SAT, or \(j\) such that \(R_{j} = R_{j+1}\).
* Property-directed reachability
  * Invented in 2011
  * Clause: is a disjunction of literals
  * Cube: is a conjunction of literals
    * The 'dual' notion of a clause
  * Each frame \(R_j\) is a CNF formula
    * It is an over-approximation of the set of reachable states in \(j\) steps
    * \(CL(F)\) is the set of clauses in a CNF formula \(F\)
    * We don't care about equisatisfiability right now.
  * Invariants
    * \(R_0 = I\)
    * \(R_j \subset R_{j + 1}\)
      * \(R_j\) is both the set of reachable states as well as the propositional logic formula
      * \(R_{j + 1}\) is strictly larger than the set of states \(R_j\)
    * \(CL(R_{j + 1}) \subset CL(R_j)\)
    * \(T(R_j) \subseteq R_{j+1}\)
      * \(T\) is short for step, this means that \(R_{j+1}\) represents approximates all the states that you can get from \(R_j\) after 1 step
    * \(R_j \subseteq \neg E\)
      * As long as the algorithm continues, there is no non-empty subset with error states, (except the last state N)
    * Start from frame \(R_n\). 
      * Check if \(R_N \wedge E\) is SAT
      * Keep transferring clauses from \(R_N\) to \(R_{N+1}\)
      * Decide when it is valid to move a clause from \(R_N\) or \(R_{N+1}\)
      * Ask \(R_N \wedge T \wedge \neg C'\) is not SAT
      * Can we take a step outside \(C'\) from \(R_N\)
      * If we can not, then we can transfer a clause from \(R_N\) to \(R_{N+1}\), because no matter what we do we will always end up in a known state
      * If the formula is SAT, then \(C\) is too constrained to describe the transition
    * Check if \(R_{N+1} = R_N\) , if so then we can terminate, since we have exhausted the states
    * If there is an intersection between \(R_N\) and \(E\), we can not necessarily conclude we have reached an error state yet, as \(R_N\) is an **overestimation**
      * Check a nominal state in the intersection \(s\), and check if \(s\) reachable from an initial state, by recursively checking states in each lower level down to \(R_0\)
        * \(R_{N-1} \wedge T \wedge S\)
      * If the chain is broken, then the error state is actually not reachable as a counterexample.
        * We need to refine \(R_N\)
        * \(s\) is a cube \(\implies \neg s\) is a clause
        * we add \(\neg s\) to \(R_N\) to 'learn' that \(E\) has a bogus move

* Concolic testing
  * concrete execution (random testing)
  * symbolic testing
  * 