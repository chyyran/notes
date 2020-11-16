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
    * \(\sigma \models \varphi_1 \cup \varphi_2\) iff \(\exists j \geq 0. \sigma[j...] \models \varphi_2\) and \(\sigma[i...] \models \varphi_1\) for all \(0 \leq i < j\)
      * there is some point \(j\) in \(\sigma\) satisfies \(\varphi_2\) forever, and at all paths at a point \(i\) before \(j\) satisfies \(\varphi_1\)
      * note that this is different from an atomic proposition that only talks about a single state in the path
    * \(\sigma \models \Diamond \varphi\) iff \(\exists j \geq 0. \sigma[j...] \models \varphi\)
    * \(\sigma \models \square \varphi\) iff \(\forall j \geq 0. \sigma[j...] \models \varphi\)
  * LTL satisfaction relation \(\models\) is the smallest relation satisfying the above rules

* Can we lift LTL from paths to states and transition systems?
  * \(s \models \phi \iff \forall \pi : \pi[0] = s \implies \pi \models \phi\)
    * Every path from the state \(s\) satisfies the LTL property \(\phi\)
  * Generalise to transition systems
    * \(TS \models \phi \iff \forall s \in I : s \models \phi\)
    * If every initial state satisfies \(\phi\), then the TS satisfies the property
  * Negation
    * \(\pi \models \phi \iff \pi \not \models \neg \phi\) is true for paths, but not necessarily TS
    * For example (`^v` indicates a loop)
      ```
        ^v            ^v
        s1<-----s0--->s2
        {a} 
      ``` 
      The path `s0 s1` satisfies \(\Diamond a\), but not `s0 s2`
      However, \(TS \not \models \Diamond a\) because `s0 s2` and \(TS \not \models \neg \Diamond a\) because `s0 s1`
  * Equality
    * Two LTL formulas are equivalent if they statisfy the same set of paths
    * \(\forall \pi: \pi \models \phi_1 \iff \pi \models \phi_2\)
    * LTL formulas are 1-1 with sets of paths, so if they are satisfied by the same set of paths they are the same
      * formulas are uniquely identifiable with the sets of path that satisfy it
* LTL formula laws
  * duality
    * \(\neg \bigcirc \varphi \equiv \bigcirc \neg \varphi\)
      * "not next phi" == "next not phi"
    * \(\neg \Diamond \varphi \equiv \square \neg \varphi\)
      * "not eventually phi" == "always not phi"
    * \(\neg \square \varphi \equiv \Diamond \neg \varphi\)
      * "not always phi" == "eventually not phi"
  * absorbtion
    * \(\Diamond \square \Diamond \varphi \equiv \square \Diamond \varphi\)
      * "eventually always eventually phi" == "always eventually phi"
    * \(\square \Diamond \square \varphi \equiv \Diamond \square \varphi\)
      * "always eventually always phi" == "eventually always phi"
  * idempotency
    * \(\Diamond \Diamond \varphi \equiv \Diamond \varphi\)
    * \(\square \square \varphi \equiv \square \varphi\)
    * \(\varphi \cup (\varphi \cup \psi) \equiv \varphi \cup \psi\)
    * \((\varphi \cup \psi) \cup \psi \equiv \varphi \cup \psi\)
  * distribution
    * \(\bigcirc (\varphi \cup \psi) \equiv (\bigcirc \varphi) \cup (\bigcirc \psi)\)
    * \(\Diamond(\varphi \vee \psi) \equiv \Diamond \varphi \vee \Diamond \psi\)
    * \(\square(\varphi \wedge \psi) \equiv \square \varphi \wedge \square \psi\)
  * expansion
    * \(\varphi \cup \psi \equiv \psi \vee (\varphi \wedge \bigcirc (\varphi \cup \psi))\)
      * Either \(\psi\) is already satisfied (then until is trivial satisfied), or we ensure \(\varphi\) is satisfied now, and we test for \(\psi\) at the next step in the path
    * \(\Diamond \psi \equiv \psi \vee \bigcirc \Diamond \psi\)
    * \(\square \psi \equiv \psi \wedge \bigcirc \square \psi\)
    * The expansion law "defines" Until, i.e. Until is the **least** solution to the expansion law
      * \(X = \psi \vee (\phi \wedge \bigcirc X)\)
      * Until is the smallest set of paths that satisfies this equation as a constraint, but it has many solutions.
