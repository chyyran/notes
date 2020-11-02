# 2020-11-01 Linear Temporal Logic

* syntax
  * \(\varphi :== \text{true} | a | \varphi_1 \wedge \varphi_2 | \neg \varphi | \bigcirc \varphi | \varphi_1 \cup \varphi_2\)
  * It is an extension of the basic propisitional syntax \(\text{true} | a | \varphi_1 \wedge \varphi_2 | \neg \varphi\)
  * New temporal operators
    * Next operator \(\bigcirc \varphi\) "next phi"
    * Until operator \(\varphi_1 \cup \varphi_2\) "phi 1 until phi 2"
  * Syntax sugar
    * Eventually operator \(\Diamond \varphi \equiv true \cup \varphi\) "eventually phi"
    * Always operator \(\square \varphi \equiv \neg \Diamond \neg \varphi\) "always phi"
* LTL is not about sets/snapshots of states of systems anymore
  * about executions of systems
  * properties of a system over time
  * there is always a particular path or sequence of states
  * can have one or many execution paths
  * satisfying assignment is one path throughout the system
  * pure propositional formulas only talks about the starting initial state.
  * temporal operators allow us to talk about sequential states in the path
* Intuition
  * atomic proposition \(a\)
    * Initial state satisfies \(a\) \(S_0 \models a\)
    * `[ a ] -> [ arbitrary ] -> [ arbitrary ] -> ...`
    * For example if we want to satisfy \(a \wedge b\)
      * `[ a & b ] -> [ arbitrary ] -> [ arbitrary ] -> ...`
    * \(a \wedge \neg b\) can be labeled by explicitly specifying lack of \(b\)
      * `[ { a } ] -> [ arbitrary ] -> [ arbitrary ] -> ...`
  * next step \(\bigcirc a\)
    * next step of the current path satisfies \(a\)
      * `[ arbitrary ] -> [ a ] -> [ arbitrary ] -> ...`
    * Can be extended \(\bigcirc \bigcirc a\)
      * `[ arbitrary ] -> [ arbitrary ] -> [ a ] -> ...`
  * until \(a \cup b\)
    * \(a \wedge \neg b\) until \(b\) is satisfied
      * `[ a & ~b ] -> [ a & ~b ] -> [ b ] -> [ arbitrary ] -> ...`
    * lets us state that something is going to happen, at some unspecified point in time
    * until such a thing happens, some other thing (\(a\)) is true
  * eventually \(\Diamond a\)
    * Eventually \(a\) is true after some point, but before that \(a\) is not true.
    * `[ ~a ] -> [ ~a ] -> [ ~a ] -> ... -> [ a ] -> [ arbitrary ] -> ...`
  * always \(\square a\)
    * Every state of the path satisfies \(a\)
    * Invariant of the system
    * `[ a ] -> [ a ] -> [ a ] -> ...`
* Semantics
  * LTL is interpreted over paths
  * paths are infinite **words** labeled with a subset of the atomic propositions that are true at each **letter**
  * satisfiability means one path evaluates to true
  * validity is all possible paths evaluate to true
  * paths go on forever so we can model both terminating and non-terminating systems
  * \(\sigma\) is a path
    * \(\sigma \models \text{true}\) is always satisfied vacuously, any state satisfies true
    * \(\sigma \models a\) iff \(a \in A_0\), that is \(A_0 \models a\)
    * \(\sigma \models \varphi_1 \wedge \varphi_2\) iff \(\sigma \models \varphi_1\) and \(\sigma \models \varphi_2\)
    * \(\sigma \models \neg \varphi\) iff \(\sigma \not \models \varphi\)
    * \(\sigma \models \bigcirc \varphi\) if \(\sigma[1...] = A_1A_2A_3...\models \varphi\) 
      * After the next step of \(\sigma\) (which is a word of letters APs) satisfies \(\varphi\)
    * \(\sigma \models \varphi_1 \cup \varphi_2\) iff \(\exists j \geq 0. j[...] \models \varphi_2\) and \(\sigma[i...] \models \varphi_1\) for all \(0 \leq i < j\)
      * there is some point \(j\) in \(\sigma\) satisfies \(\varphi_2\) forever, and at all paths at a point \(i\) before \(j\) satisfies \(\varphi_1\)
    * \(\sigma \models \Diamond \varphi\) iff \(\exists j \geq 0. \sigma[j...] \models \varphi\)
    * \(\sigma \models \square \varphi\) iff \(\forall j \geq 0. \sigma[j...] \models \varphi\)
  * LTL satisfaction relation \(\models\) is the smallest relation satisfying the above rules