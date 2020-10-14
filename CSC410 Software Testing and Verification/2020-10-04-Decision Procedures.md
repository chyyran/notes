# 2020-10-04 Decision Procedures

* algorithm that, given a **decision problem** terminates with correct yes or no.
  * can "x" be done?
  * decision procedure **must terminate** 
  * useful in synthesis, AI, compilers, theorem proving
* problems are fundamentally difficult, but procedures need to be very efficient.
* Are two code fragments equivalent?

    ```
    if (!a && !b) h();
    else 
        if (!a) g();
        else f();
    ```

    ```
    if (a) f();
    else 
        if (b) g();
        else h();
    ```

    This is a YES/NO problem.

    `if x then y else z` == \((x \wedge y) \vee (\not x \wedge z)\)
    The code fragments are represented by \(y\) and \(z\), and the proposition is modeled by \(x\). We have to assume `f`, `g`, and `h` are unrelated.

    We model both fragments as propositional formulae, then try to show equivalence.

    \[
        (\neg a \wedge \neg b) \wedge h \vee \neg (\neg a \wedge \neg b) \wedge (\neg a \wedge g \vee a \wedge f) \\ \iff a \wedge f \vee \neg a \wedge (b \wedge g \vee \neg b \wedge h)
    \]

* A propositional formula is **satisfiable** if there is an assignment that makes the formula evaluate to true.
  * \(A \wedge B\) is true, by assigning A and B true.
* A propositional is **valid** if all assignments make it evaluate to true.
  * \(A \implies A\) is true regardless of A true or false.
* A **theory** is informally, a finite or infinite set of formula, characterized by some common grammatical rules, functions, predicates, and a domain of values.
* A procedure for a problem is **sound** if when it answers "YES" to the question, the formula is valid: the procedure returns the correct answer.
* A procedure for a problem is **complete** if it always terminates, and if the formula is valid, it answers "YES".
* A procedure is a "decision procedure" for \(T\) if it is sound and complete with respect to every formula in \(T\).
* A theory is decidable iff there is a decision procedure for it.
* Not every theory has a decision procedure. We may have to compromise on soundness or completeness.
* A theory is interesting if it is expressive enough to model a real proble, and it is decidable or semi-decidable, and is more efficiently solvable.
  * The more expressive a theory, the more it tends towards undecidability.
  * The easier a theory is to decide, closer to polynomial decidability, the less expressive it is.

## SAT Solvers
* given a formula \(F\), a SAT solver decides if \(F\) is satisfiable
* what is a trivial SAT solving algorithm?
  * satisfiability problem is NP-complete
  * we can enumerate every T and F combination for a formula, but this is exptime. 2^n combinations!
* DPLL-based solver
  * traverses and backtracks a binary tree
    * internal nodes represent partial assignments
    * leaves represent full assignments
    * tries to turn partial assignment to full assignment
* Stochastic Search
  * guesses a full assignment, and if it doesn't work, flips values based on a greedy heuristic
  * stops solver from getting stuck in bad regions
* CNF is a conjunction of clauses, and each clause C is a disjunction of literals. Each literal is either plain variable \(x\) or negated variable \(\neg x\)
  * Formula: \(C_1 \wedge C_2 \wedge ... \wedge C_n\)
  * C: \(L_1 \vee ... \vee L_m\)
  * Example: \((a \vee b \vee c) \wedge (\neg a \vee \neg b) \wedge (\neg a \vee \neg c)\)
  * For every propositional formula, there is an equisatisfiable in CNF which is at most polynomially larger.
    * equisatisfiable between \(F_1\) and \(F_2\) means \(F_1\) is SAT if and only if \(F_2\) is SAT. Not that they are equivalent.
* Four types of clause (States)
  * **Satisfied**, if one or more literals are satisfied
    * Since the clause is in CNF, if we have one assigned to true, the clause will evaluate to true
  * **Conflicting**, if all of its literals are assigned, but not satisfied. 
    * Signals that a wrong decision has been made.
  * **Unit**, if it not satisfied, and all but one of its literals are assigned. 
    * Suggests only one choice for the remaining literal.
  * **Unresolved**, if it is not any other type.
* DPLL overview
  * Partial eval
    * Start with empty evaluation
    * extend it to all variables
    * Pseudocode: 
    ```
    bool DPLL(N: ClauseSet, A: PartialEval) {
        if (forall c in N, c == true under A) => true -- finished.
        if (exists c in N, c == false under A) => false -- check for conflicting clause, triggers backtrack
        if (exists c in N, c :: Unit(p)) => DPLL(N, A + { p := 1 }) -- assign unit literal
        if (exists c in N, c :: Unit(!p)) => DPLL(N, A + { p := 0 }) -- assign unit literal
        let c in N :: Undefined(p);

        -- if both calls fail, this returns the second failure of the 
        -- second call, triggering backtracking. 
        -- this means something is wrong about the partial evaluation.

        if (DPLL(N, A + { p := 0 })) => true 
        DPLL(N, A + { p := 1 })
    }
    ```
    * We can learn something from the mistake on backtrack. 
    * Keep track of invalid assignments: conflict analysis
    * BCP-conflict analysis-backtracking
      * Assignment associated with a decision level, for example, 
      * \(x_i@dl\) x_i was assigned true at level dl
    * BCP is performed over an implication graph
      * captures the steps of the algorithm
      * may show inherited decision nodes
      * follow necessities to derive a conflict!
    * An implication graph is a labeled, directed, acyclic graph G(V, E)
      * **read chapter before exam 2!!**
      * V is the literals of the current assignments, labeled with literals and decision level
      * E is the connection between literals. (u, v) is in the graph if the assignment to u plays a role in what value assigned to v (both u and v belong to a unit clause)
      * G can also contain a conflict node \(k\), incoming edges are all from literals that are a part of a conflict clause with k
      * Root nodes correspond to decisions, and internal nodes are implications made by propagation
      * Graph can be partial, and only refer to a certain decision level
      * Clause that is learned as a result of the discovery of a conflict
        * conflict clause allows us to encode our mistakes
        * an asserting clause is a conflict clause that becomes a unit clause the moment we backtrack
      * backtrack to the highest decision level before the current one.
    * conflict resolution 
      * an inference system based on conflict resolution is sound and complete
      * we can determine UNSAT of a CNF formula through finite applications of resolution
    * There is a sense of implication order, the order of decisions made in the implication tree
      * starting at the conflict node, we walk backwards, looking at the clauses
      * we resolve the two clauses, eliminating the "pivot"
      * take the new clause, and continue resolving against the previous clause
      * stop when "unique impliction point" is the only literal from the current decision level
        * keep producing sequence of conflict clauses until 
          * "clause should include the negation of the UIP literal"
          * all other literals should belong to decision levels that are not the current DL
        * UIP is a node (other than the conflict node), that is on all paths from the decision node to the conflict node
          * decision node is one such UIP
        * First UIP is a UIP that is closest to the conflict node
          * faster and backtracks to the lowest level
      * Why does this terminate?
        * correctness: any time there is a partial assignment we check if its SAT and returning it
        * terminate: 
          * thm: never the case that the solver enters decision level dl again with the same partial assignment
            * different dls are different times, but are forced to try a new partial assignment
            * whenever you enter an already seen decision level, it must be under a different partial assignment.