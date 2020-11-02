# 2020-11-01 Model Checking

* Checking whether a formula is satisfied in a finite domain
  * Model: finite-state transition system
  * Logic: propositional temporal logic
  * Verification Procedure: exhaustively search the state space to determine truth of specification

* Why model checking?
  * alternative to pen-and-paper program proofs
  * limit oneself to a set of systems that can be verified easily
  * originally restricted to finite state
  * systems with short descriptions
  * control oriented systems, e.g. hardware, protocols
  * fully automated with low computational complexity
    * does not require hints like loop invariants
    * counterexamples can be used as a debugging tool
      * witnesses for why a property does not hold in a system
* Labeled transition systems
  * a directed state machine graph that represents a program
  * tuple (S, Act, ->, I, AP, L)
    * \(S\) is a set of states
    * \(Act\) is a set of actions
    * \(\to \subseteq S \times Act \times S\) is a transition relation
    * \(I \subseteq S\) is a set of initial states
    * \(AP\) is a set of atomic propositions
      * talks about facts we care about proving
    * \(L : S \to 2^{AP}\) is a labelling function
      * associates every state a subset of atomic propositions that hold true in that state
    * If \(S, Act, AP\) are finite the so is the transition system
  * can have memory, represent side effects
* Formal specification
  * Consider dining philosophers with 5 philosophers
    * Classic deadlock scenario: all 5 philosophers have 1 chopstick, waiting for another chopstick to be released to start eating
    * We can use reachability to express the deadlock scenario
      * Given a TS and a target set T, is T reachable from \(Q_0\)
    * Starvation (one philosopher doesn't get to eat) can not be modeled using reachability!
* Inelegant solution--Using one TS as a spec for another TS
  * Given a TS \(M\) for the model and a TS \(S\) for the spec
  * Is every behaviour of \(M\) has a behaviour of \(S\)?
    * If we know that the specification TS has properties we care about, we can attempt to show that the model TS has the same properties
    * Formally \(L(M) \subsetseq L(S)\), the language of \(M\) is included in the language of \(S\)
    * Language exclusion check, doable linear in \(M\), and EXPTIME in \(S\).
      * Need to determine if \(S\) is deterministic, which is EXPTIME
  * How can we build the second system that we know is well-behaved??
* Temporal logics
  * language for describing properties of infinite sequences
  * extensions of propositional logic
  * temporal operators to describe sequencing properties