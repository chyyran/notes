# 2020-11-15 Computational Tree Logic

* If we have two transition systems that are "trace equivalent", then they satisfy the same set of LTL formulae
* Instead of viewing a transition system as a series of paths, we 'unfold' the execution while maintaining structure as an infinite tree
* Reference tree by the state at the 'root' of the tree
* Syntax
  * State formulae: \(\Phi ::= \text{true} | a | \Phi_1 \wedge | \Phi_2 | \neg \Phi | \exists \varphi | \forall \varphi\)
  * Path formulae: \(\varphi ::= \bigcirc \Phi | \Phi_1 \cup \Phi_2\)
* A capital \(\Phi\) is a "state formula", execution tree of a system rooted at the state
* Lowercase \(\varphi\) path formulae are the same as in LTL
  * Next \(\bigcirc\)
  * Until \(\cup\)
* We can turn a path formula by the existential or universal quantifier
  * \(\exists \varphi\) exists a path emanating from the state, that satisfies \(\varphi\) 
  * \(\forall \varphi\) all paths emanating from the state satisfy \(\varphi\)
  * In LTL, we had an implicit universal quantifier
* \(\exists \bigcirc(x=1)\)
  * We are currently in a state where at least one successor state has x=1
  * Exists a successor of this state such that x = 1
* \(\forall \bigcirc(x=1)\)
  * We are currently in a state where all successor state satisfies x = 1
  * All successors of the current state satisfy x = 1
* \(\exists x = 1 \wedge \forall \bigcirc ( x \geq 3)\)
  * This formula is nonsense
  * We can not apply a quantifier by a standard state formula, we **need** a temporal operator.
* \(\exists \bigcirc (\text{true} \cup (x = 1))\)
  * Until needs a quantifier! We can not apply next to a path formula in CTL.
* Eventually
  * \(\exists \diamond \Phi = \exists (\text{true} \cup \Phi)\)
  * \(\forall \diamond \Phi = \forall (\text{true} \cup \Phi)\)
* Always
  * \(\exists \square \Phi = \neg \forall \diamond \neg \Phi\)   
    * At least one path emanating from the current state that \(\Phi\) always holds on every state
    * "I will never find a path such that eventually all paths do not hold for \(\Phi\)
  * \(\forall \square \Phi = \neg \exists \diamond \neg \Phi\)
    * On all paths emanating from the current state, \(\Phi\) holds for every state
    * "I will never find a path such that there is a path where \(\Phi\) eventually does not hold"
  * Be careful to flip the quantifier!
* CTL formulas are always executed over execution trees
* Semantics
  * CTL is interpreted over infinite trees of execution, represented by the state that roots the tree.
  * \(s\) is a state, \(L(s)\) is an atomic proposition of \(s\), \(\pi\) is a path
    * \(s \models a\) iff \(a \in L(s)\)
    * \(s \models \neg \Phi\) iff not \(s \models \Phi\)
    * \(s \models \Phi \wedge \Psi\) iff \((s \models \Phi)\) and \((s \models \Psi)\)
    * \(s \models \exists \varphi\) iff \(\pi \models \varphi\) for some \(\pi \in Paths(s)\)
    * \(s \models \forall \varphi\) iff \(\pi \models \varphi\) for all \(\pi \in Paths(s)\)
  * \(\pi\) is a path
    * \(\pi \models \bigcirc \Phi\) iff \(\pi[1] \models \Phi\) 
      * Next state of \(\pi\) satisfies \(\Phi\)
    * \(\pi \models \Phi \cup \Psi\) iff \(\exists j \geq 0. \pi[j] \models \Psi \wedge (\forall 0 \leq k < j. \pi[k] \models \Phi)\)
    * These are exactly the same as in LTL.
    * Semantics for until refer to CTL semantics, not LTL semantics.
* 