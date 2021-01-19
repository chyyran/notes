# 2020-11-27

* Combinatory categorial grammar
  * arguments that human language belongs in this class
  * categorial grammar is one of oldest grammar formalisms, dating back to 19th century
  * combinatory catgeorial grammar now well established, coputational well founded
    * gives semantics and syntax
    * prosody, information, automatic parsers, generation
  * lexicalized grammar
  * elementary syntactic structure (ccg has lexical catgeory) assigned to each word
  * small number of rules define how categories comvine
  * production rules are more or less universal
  * rules have mathematical rules:  based on combinators from combinatory logic
  * lexicon has rich structure
    * labels like noun, sentence, verb, production rules
      * slash operators
        * backslash: look to left
          * S\NP: give me an NP to my left and I return a sentence
  * lexical categories
    * atomic cats: S, NP, NP, PP, ...,
      * unlikely to have VP
    * Complex categories built recursively from atomics and slashes, indicating directions of arguments
    * Complex categories encode subcategorization
      * intrasitive verb: S\NP *walked*
      * transitive verbs: (S \NP)/NP *respected*, ex fred respected john
        * form VP given a subject but take another argument
      * ditransitive verb: ((S\NP)/NP)/NP *gave* "i gave marie a book"
      * order is from interior to exterior
    * complex categories encode modification
      * encode some optionality
      * pp nominal: (NP\NP)/NP
        * swallow up NP and replace with a new NP
        * replace "the man" with "the man in the park"
      * pp verbal: ((S\NP)\\(S\NP))/NP
    * rabidly pragmatic 
      * considering headedness
      * what requires a constituent
      * vps are just tossed out because we dont need it
      * we dont care about how things combine except for two factors
        * we get a sentence a output
        * we get the right semantics
  * descends from logical derivation
    * final deduction at the bottom, not tree at the top
  * function application schemata
    * Forward (>) and backward (<) application
      * X/Y Y => X (>)
      * Y X\Y => X (<)
    * elimination rules
  * classical categorical grammar only has application rules
    * context free
  * combinatory categorical grammar has additional rules
    * \> Type raising rule
      * 'Microsoft' is an entity in the world (NP)
      * instead of thinking it as an entity, think of it as all the properties in the world that are true of Microsoft
      * assemble properties as a bundle, think of the set as being equivalent to the object
      * property is a function that applies to entity and returns a truth value
        * `Property :: Entity -> Bool`
      * can lift the NP into S/(S\NP) 
        * think about NP as being a second order representation
      * X => T / (T\X) (> T)
      * X => T \ (T/X) (< T)
    * \> B forward composition
      * 'Microsoft celebrated'
      * turn Microsoft into the functor of 'celebrated'
      * gap percolation
      *  X / Y Y /Z => X / Z (> a)
     * no longer context free
   * can talk about direct objects without getting confused about subject
   * conjunctions like 'but' combine 2 things of same cat into 1 thing of the same cat
  * CCG is mildly context sensitive
  * natural language is provably *non-context free*
  * constructions in Dutch and Swiss German (Shieber, 1985) require more than context free power
    * crossing dependencies which CCG can handle
    * embedding of verbal predicates inside other predicates
    * "I know that John thinks that Fred left"
  * CCG semantics
    * categories encode argument sequences
    * typed lambda caculus
    * john models NP: john'
    * shares models NP: shares'
    * buys models (S\NP)/NP: Lx.Ly.buys'xy
    * sleeps models S\NP: Lx.sleeps'x
    * well models (S\NP) \ (S\NP): Lf.Lx.well' (f x)
      * higher order!
      * swapping out principle functor 
* tree adjoining grammars
  * elementary trees at any depths
  * substitution at \(\downarrow\)
  * tree substitution grammar equivalent to CFG
  * instead of drawing tree on top of a sentence, combine atomic trees
  * eg a1 = [NP. Peanuts], a2 = [NP. Harry], a3 = [S. [NP. _] [VP. [V. likes] [NP. _]]]
    * attach NPs to blanks
      * this is tree substitution (CFG equivalent)
  * add adjunction
    * a1 = [NP. Harry], a2 = [S. [NP. _] [VP. [V. likes] [NP. _]]] a3 = [NP. peanuts] b = [VP. [VP. *] [Adv. passionately]]
    * adjunction trees specially marked (like b) only has one redex
    * for substitution + adjunction trees of the same type can clip off and reattach 
  * 2 kinds of trees: derivation tree and derived tree
    * derivation: how alphas and betas are put together to get derived tree
    * also possible to build semantics for tags
    * less elegant but have event-based semantics
      * not just predicates
      * third element -- event describes moment in time or context, confluence, etc 