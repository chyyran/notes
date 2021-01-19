# 2020-11-29 Algorithmic Programming Synthesis
* Compilation
  * does not produce unknowns, just translates
  * represents source programs as AST
  * lowers AST to target language
  * lowering performed with rewrite rules, which are guaranteed to be correct
  * this is idealistic in reality this may not be correct
* deductive synthesis
  * similar mechanism
  * start from spec, use rules to lower spec to program
  * rewrite sequence can be non-deterministic
  * rewrite rules need not be arbitrary composable
  * need to be design by a domain expert
  * not sure what it means to be a successful synthesis
* search synthesis
  * relieves designer from designing rewrite rules
  * frees programmer from restrictive specification
  * partial program defines a search space
    * find a candidate in the space that satisfies \(\phi\)
  * such a space is huge
  * do it symbolically and use a solver
  * program
    * inputs are spec and sketch
    * program to formula translator
    * pass formula to solver
      * if no, program is not doable
      * if yes, feed witness to code generator with original sketch
        * witness is values for the holes
  * example
    * we have a program `f(x) { return x + x }`
    * formula that represents it `S_f (x,y): y = x + x`
    * Solver is an interpreter, ex `S_f(x, y) ^ x = 3 | y = 6`
    * Program inverter, ex `S_f(x, y) ^ y = 6 | x = 3`
      * bidirectionality allows for solving
    * we have spec and partial program also converted into formula
      * solver finds h (hole), and synthesizes program
    * might not get lucky with choice of input
      * if we choose the wrong input, try again, take construction of constraints and find the hole
    * use io pairs as constraints from spec formula
* inductive synthesis
  * small world hypothesis
    * if there is a small set of inputs where if the program is correct, then it is correct for every input
    * not generically true but likely is
  * instead of solving 
    * \(\exists h \forall x \phi(x, P(x,h)))\)
    * we solve instead \(\exists h \phi (x_1, P(x_1, h)) \wedge ... \wedge \phi(x_n, P(x_n, h)))\)
  * where do the test inputs come from? i.e. \(x_1\) to \(x_n\)?
    * CounterExample Guided inductive synthesis (CEGIS)
    * inductive synthesizer
      * starts from random inputs (base case)
      * uses inputs and synthesis algorithm to produce candidates
      * if it fails, then the synthesis problem is unsolvable
      * if it succeeds, decides whether candidate implementation works through a verifier
        * if verifier fails, adds a counterexample input, and repeat.
        * if verifier succeeds, we're done
      * small world hypothesis tells us that cegis will eventually reach a good synthesis or fail
      * on average, need log of size of candidate space
* Reactive synthesis
  * closely related to temporal logic
  * reactive programs react to some info from environment, not meant to terminate
  * synthesis is inverse
    * given spec in LTL or CTL, ask for program to be synthesized
  * consider controller maintaining tank being heated by gas burner in [min, max] range.
    * can view this as a game
    * plant is a 2-player game arena
    * spec is game objective for player 1
    * controller is a winning strategy for player 1
      * only thing controllable is gas burner
    * solutions to this game is not unlike CTL solving
* Deductive synthesis
  * start from spec, use rules to derive implementation
  * joshi, nelson, randall 2002
    * reg6 * 4 + 1
      * Build expression tree `(+ (* reg6 4) 1)`
      * Any power of 2 can be rewritten as a shift `(+ (* reg6 (** 2 2)) 1)`
      * Now that we know 4 is a power of 2, rewrite as `(+ (<< reg6 2) 1)`
        * order of previous rule matters! we need to know that 4 is a power of 2
      * s4addl(k,n) instruction could have represented the entire operation `(s4addl reg6 1)`
        * need all the rewrite rules to cover entire search space 