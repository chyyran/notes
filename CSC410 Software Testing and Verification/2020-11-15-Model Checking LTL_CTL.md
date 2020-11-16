# 2020-11-15 Model Checking LTL/CTL

* For LTL, we need to discuss automata on infinite words, so we will not do so.
* CTL expansion laws
  * \(\exists \Phi \cup \Psi \equiv \Psi \vee (\Phi \wedge \exists \bigcirc \exists (\Phi \cup \Psi))\)
    * Phi until Psi is the same as "Psi is true right now, or Phi is true, and there exists a successor of the current state where the existential statement is once again true"
  * \(\exists \Diamond \Phi \equiv \Phi \vee \exists \bigcirc \exists \Diamond \Phi\)
    * Exists eventually Phi is the same as Phi is true now, or otherwise there is a successor where Phi is eventually true
  * \(\exists \square \Phi \equiv \Phi \wedge \exists \bigcirc \exists \square \Phi\)
    * Exists always Phi is the same as Phi is true now, and there exists a successor where Phi is always true
* We need to evaluate a formula bottom up from the expression tree
* What is evaluation in CTL?
  * CTL formula is 1-1 with the set of states that satisfy it
  * \(Sat(\Phi)\) is the set of all states that satisfy \(\Phi\)
  * evaluation is calculating the \(Sat\) sets of states that satisfy \(\Phi\)
* Recursive rules for ENF
  1. \(Sat(true) = S\)
  2. \(Sat(a) = \{ s \in S | a \in L(s)\}\) for any \(a \in AP\)
  3. \(Sat(\Phi \wedge \Psi) = Sat(\Phi) \cap Sat(\Psi)\)
  4. \(Sat(\neg Phi) = S \ Sat(\Phi)\) 
  5. \(Sat(\exists \bigcirc \Phi) = \{ s \in S | Post(s) \cap Sat(\Phi) \neq \emptyset\}\)
  6. \(Sat(\exists(\Phi \cup \Psi))\) is the **smallest** subset \(T\) of \(S\) such that  
     1. \(Sat(\Phi) \subseteq T\)
     2. \(s \in Set(\Phi) \wedge Post(s) \cap T \neq \emptyset \implies s \in T\)
  7. \(Sat(\exists \square \Phi)\) is the **largest** subset \(T\) of \(S\) such that
     1. \(T \subseteq Sat(\Phi)\)
     2. \(s \in T \implies Post(s) \cap T \neq \emptyset\)
* Example
  * Given a transition system\(TS = (S, \to, AP, I, L : S \to 2^{AP})\)
  * We want \(Sat\) that returns a subset of states in \(TS\) that satisfy the CTL formula
  * Notice that these formulae are recursive, and can be implemented as a recursive algorithm, except Until
    * We need to use expansion laws that are 'sort of' recursive, but require us to do some additional computation to properly evaluate Until.
  * \(Sat(true) = S\), \(Sat(false) = \emptyset\)
  * \(Sat(a)\) is the set of states that are labelled \(a\) 
    * \(\{s \in S | a \in L(s)\}\)
  * \(Sat(\Phi \wedge \Psi) = Sat(\Phi) \cap Sat(\Psi)\) is self explanatory, we look at the intersection of the states that satisfy both
  * \(Sat(\Phi \vee \Psi) = Sat(\Phi) \cup Sat(\Psi)\) similarly
  * \(Sat(\neg Phi) = S \ Sat(\Phi)\) is the set of all states that do not satisfy \(\Phi\)
  * \(Sat(\exists \bigcirc \Phi)\) 
    * The set of all states that has at least one successor that satisfy \(\Phi\)
    * \(\{ s \in S | Post(s) \cap Sat(\Phi) \neq \emptyset\}\)
    * Equivalently \(\{ s \in S | \exists s' \in Sat(\Phi) : s \to s'\}\)
    * Note that \(Sat(\Phi)\) is strictly smaller that \(Sat(\exists \bigcirc \Phi)\) so this recursion terminates.
  * \(Sat(\forall \bigcirc \Phi)\)
    * Similar to existential, the set of all states where all successors satisfy Phi
    * \(\{s \in S | \forall s' : s \to s' \implies s' \in Sat(\Phi)\}\)
  * \(Sat(\exists \Phi \cup \Psi)\)
    * The expansion laws provide a constraint, and until is the smallest set that satisfies the constraint
    * Consider a set \(T = \{ s \in S | s \in Sat(\Psi) \vee (s \in Sat(\Phi) \wedge \exists s' : (s \to s' \wedge s' \in T))\}\)
      * \(s\) either satisfies \(\Psi\) (in \(Sat(\Psi)\)), OR, \(s\) satisfies \(\Phi\), AND there is a successor \(s'\) of \(s\) which is in \(T\)
      * \(T\) is the smallest set that satisfies the constraint!
      * This is the \(Sat\) set of Until.
    * How do we compute this?
      * This is a 'fixpoint'
      * We want to compute the smallest fixpoint for \(T\)
        1. We start with \(Sat(\Psi)\), and include it in \(T\)
          * Every state that satisfies \(Sat(\Psi)\) trivially satisfies \(\Phi \cup \Psi\)
        2. We start with a state \(s \in Sat(\Phi)\)
        3. Check if \(s\) has a successor in \(T\) (currently \(T\) = \(Sat(\Psi)\)), if so include that in \(T\)
        4. Continue to enumerate states in \(Sat(\Phi)\), checking if there are successors in \(T\), until exhausted, or no more states in \(Sat(\Phi)\) have successors in \(T\).
 * \(Sat(\forall \Phi \cup \Psi)\)
   * Similar approach to the existential until.
   * Consider a set \(T = \{ s \in S | s \in Sat(\Psi) \vee (s \in Sat(\Phi) \wedge \forall s' : (s \to s' \wedge s' \in T))\}\)
     * Instead of only checking 1 successor, we need to confirm that all successors \(s'\) of \(s\) are in \(T\)
   * How do we compute this?
     1. Start with \(Sat(\Psi)\), and include it in \(T\)
     2. Pick a state \(s'\) in \(Sat(\Phi)\)
     3. Check if **all successors** of \(s'\) are in \(T\), if so add it to \(T\)
     4. Continue to enumerate states of \(Sat(\Phi)\), checking if all successors of the state are in \(T\) until exhausted, no more states in \(Sat(\Phi)\) have **all successors** in \(T\).