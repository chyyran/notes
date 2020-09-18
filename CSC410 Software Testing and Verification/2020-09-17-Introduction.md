# 2020-09-17 Introduction
* Software validation is the toughest open problem in CS
* Verification always derived by academia
  * rich theoretical basis
  * lot of room for pragmatism
  * theoretically motivated heuristics
  * verify as much as possible
* examples
  * northeast blackout caused by data-race
  * Ariane V crash (1996) caused by 64 bit to 16 bit conversion
  * Pentium FDIV bug (1997) LUT had mistakes
  * Mars Orbiter used feet per second instead of Newtons per second
  * Therac-25 overradiated patients 
  * heartbleed
  * spectre
* make software more reliable
  * need industry standards
  * can we certify software?
    * provably unsolvable in uncertainty but...
    * partial validation
    * intelligent testing
* software verification
  * proving formally a program satisfies a specification written in a logical language
  * formal models for programs (entity), i.e. what you are trying to verify
  * logics for specs, i.e. what you are trying to show the model will do: prove
  * algorithm for checking the model against the specification
    * shows that the model adheres to the specification
* partial correctness
  * pre/postconditions: formal spec
  * every terminating execution of the program satisfies the specification
* total correctness
  * partial correctness + prove that the program will terminate
* practical relevance
  * amazon uses some of these correctness techniques
* **history**
  * 70s: philosophy: programmers write programs, prove them correct on pen and paper
  * failed but is resurging
    * no way to find bugs
    * heavily manual: not appealing
  * 80s: model checking
    * narrow scope of verification for fully automated techniques
    * SPIN early automated verifier for hardware
    * heuristics to control explosion
      * partial order reduction
      * hashing
      * LTL/automata
    * SMV
      * symbolic model checker with binary decision diagrams
        * compact representation of binary graphs
    * SAT solvers
      * yes or no for boolean satisfiability expression
      * can be used in model checking to "boost" their power
  * software model checking
    * SLAM
    * Static driver verifier
      * model checker that validates device drivers against spec
      * predicate abstraction
      * pushdown automata algos
      * BDD for boolean programs
    * reduce reasoning about infinite state systems to finite state systems
  * correct by construction
    * program synthesis: produce a program that satisfies a spec
    * same three parts of a verification scheme: spec, algos, models
    * end user programming: for non programmers
* learning objectives
  * change the way you think and reason about programs
  * reason about programs about hoare logic and invariants
  * formal models
    * CFGs, state transition systems, symbolic reprs
  * specification systems
    * temporal logics
    * assertions
    * pre/postconditions
* progression
  * program correctness
    * recursive programs
    * iterative
    * hoare logic
  * decision procedures
  * symbolic methods
  * temporal logics
    * linear TL
    * computational TL
  * model checking
  * program synthesis
* 