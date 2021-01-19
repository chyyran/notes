# 2020-11-29 Program Synthesis

* In 60s and 70s, LTL and CTL formulas were thought to be able to produce an impl from spec.
* Program synth today derives from SAT/SMT
* Idea is to produce small code fragments that satisfy the spec
* Defer tedious work to computer
* use as a programming aid
* Sketching
  * Fundamentals:
    * the larger the universe, the less successful the sythesis
    * how does a tool define a universe of things that fill up a hole?
    * how does programmer communicate what he wants?
  * Sketches:
    * programs with holes
    * write what you know, use holes for details you don't want to figure out
  * example:
     ```csharp
        sketch:
        int bar (int x) implements foo {
            return x << ??;
        }
        spec:
        int foo (int x) {
            return x + x;
        }
        result:
        int bar (int x) implements foo {
            return x << 1;
        }
     ```
    We have a sketch with holes, a spec that `bar` must work with, then the synthesizer gives us the result.
  * We can use equivalence to existing code as spec
  * can also use logical specification
    * `assert r == 2 * x`
  * samples of input/out pairs as spec
    * `(r, x): (0, 0) (2, 1) (6, 3) (20, 10)`
  * holes are meant to be placeholder code fragments
    * can be arbitrarily complex
  * fragments range over a user-defined set
    * defining a good set of fragments is key to effective Sketching
    * defined using a grammar
      * tiny subsets of programming languages
      * sets of fragments defined hierarchically
      * integer constants --> expressions --> statements --> procedures --> sketch
        * can be conditions, eg expressions that only affect x and y.
* Definition of program synthesis
  * Focus on standard functions that terminate
  * Assume a property \(\phi\) over input output pairs for a program
  * Synthesis === finding a function that fits the specification
    * \(\exists P. \forall x \phi(x, P(x))\)
  * If the formula \(P\) is satisfiable then the witness for \(P\) is the implementation.
  * \(P\) is standing in for a function or relation, so the language is strictly more expressive than everything we have seen before.
  * When does it make sense?
    * when it is easier to write \(\phi\) than \(P\)
    * when it is easier to be convinced about \(\phi\) than it is to write \(P\)
  * constraint solving program, generic efficient solutions do not exist
  * algorithmic challenge: solve quantified SAT by reducing to CNF and use a solver