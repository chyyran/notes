# 2021-09-23 Propositional Logic

* A set is a collection of objects
  * We have two notations
    * Explicit listing: \(\{1, 2, 3, 4\}\)
    * Set builder: \(\{x \in \N: 0 < x < 5\}\)
  * Sets can be included in sets
  * Inclusion
    * proper inclusion (strict subset) \(\subset\)
    * \(\subseteq\)
  * Intersection/union \(\cup \cap\)
  * A "statement" is an expression that has a truth value
  * Expressions that denote sets don't have truth values
  * We have to ensure that the expression has the right type for what we say to be meaningful.
* Set difference
* Functions
  * Relations can be represented as a set of ordered pairs \(\{<a, 1>, <b, 2>\}\)
  * if for every input there is one output then it is a function
* Characteristic function
  * Consider a set \(S = \{a, b, c\}\) and our universe of discourse \(U\) the roman alphabet
  * We want to characterize this set using a function \(U \to \{1, 0\}\)
  * For every element \(u \in U\), if \(u \in S\) then \(X_S(u) = 1\), and \(0\) otherwise.
  * \(X_S\) then characterizes the set \(S\) within the universe \(U\).
  * This is useful for looking at denotations of tokens as functions such as \(\llbracket dog\rrbracket^M = \{\text{Rex}, \text{Champ}\}\)
    * We can then apply \(\llbracket \text{is a dog}\rrbracket(\llbracket \text{Rex}\rrbracket) = 1\)
    * Semanticists have a tendency to abuse notation and conflate sets with their characteristic functions
* Applications of set theory to language
  * Consider the following groups
    1. Canadian actress, cold food, blue shirt, cylindrical box
    2. skillful surgeon, experienced driver, lousy musician, typical politician
    3. alleged thief, hypothetical cure, would-be musician, potential solution
    4. fake fun, former politician, imaginary cure
   * What are the differences between each group when described as set relations
     1. "intersective adjectives" \(\llbracket A  N\rrbracket = \llbracket A \cap N\rrbracket\) relation. 
        * For example, the set of Canadians and the set of Actresses are very well defined
     2. "non-intersective subsective adjectives" \(\llbracket A N \subseteq N \rrbracket \)
        * The property of being 'skillful' is dependent on the noun it modifies
     3. "non-subsective non-privative 'modal'" adjectives 
        * A "hypothetical cure" is potentially a cure, and an "alleged thief" is potentially a thief
     4. "privative" adjectives \(\llbracket AN \cap N\rrbracket = \emptyset\)
        * An "imaginary cure" is not a cure
   * This introduces ambiguities
     * a "beautiful dancer" could be intersective (the dancer is beautiful) or subsective (the dancing is beautiful)
* Propositional logic
  * Atomic formulas are represented by letters and are only true or false
  * We can make expressions using connectives
  * Syntax
    * Any atomic formula \(\phi\) is well formed
    * If \(\phi\) is well formed then \(\neg \phi\) is well formed
    * If \(\phi\) and \(\varphi\) are well formed then \(\phi \& \varphi\), \(\phi \vee \varphi\), \(\phi \implies \varphi\), \(\phi \iff \varphi\),  are well formed
    * No other expressions are well formed
    * Here, \(\phi\) is a meta-variable that represents any well formed formula in propositional logic
  * Semantics  
    * \(\llbracket \phi \rrbracket^I\) gives the denotation of \(\phi\) relative to an interpretation function \(I\). 
    * An interpretation function \(I : \Phi \to \{0, 1\}\) (where \(\Phi\) is the set of atomic formulas in propositional logic) gives us the denotation of all atomic formulae. \(I\) tells us how to interpret formulas whose denotations do not depend on the semantics of the connectives (non-logical parts)
      * Coincides with the notion of a 'model'
      * \(I\) simply maps each propositional variable to truth values.
    * If \(\phi\) is atomic, then \(\llbracket \phi \rrbracket^I = I(\phi)\)
    * If \(\phi\) is well formed, then \(\llbracket \neg \phi \rrbracket^I\) = T if \(\llbracket \phi \rrbracket^I\) = F, or F otherwise
    * ...
