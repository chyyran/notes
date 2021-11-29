# 2021-11-25 Discourse Representation Theory

* Deals with anaphora and indefinites
* Indefinites have some problems when trying to evaluate for meaning
* Russell (1905) argues that **indefenites are not referring expressions**
  * ex. A dog walked in
    * The conventional view is that "A dog" is a referential expression of type \(e\).
    * The first issue is that indefinites refer, it's not clear what the referent is.
      * ex. John is friends with a dog, and Mary is friends with a dog.
        * the referent 'a dog' keeps changing what it is referring to throughout the sentence.
    * Negation does not work the same way
      * ex
        * It is not the case that a dog came in
          * "No dog came in"
          * We are treating "a dog" as a existential quantified expression. 
          * If this was a referring expression then this would be interpreted as a single dog
        * It is not the case that Fido came in
    * Indefinites embedded under other quantifiers do not act the same as referential expressions
      * ex.
        * Every child likes a dog
          * This is ambiguous for every child likes a single dog or multiple dogs
          * If "a dog" was a referential expression then this would be unambiguous
        * Every child likes Fido
* There are also problems for quantificational of indefinites
  * Discourse anaphora
    * *A man walked in. He looked tired.*
    * The referent of 'He' is in another sentence in the discourse.
    * The antecedent is 'a man'
    * What is the representational analysis?
      1. \(\exists x. Man(x) \wedge WalkedIn(x)\)
      2. \(LookedTired(x)\)
    * The referential variable \(x\) in 2 is **free!**. 
      * It is not bound by the qualifier in (1) 
      * Binding operators never take scope beyond the sentence.
      * Our theory does not constraint choice of assignment function.
 
* **Donkey sentences**
  * *If a man owns a donkey, he beats it.*
  * We have two clauses related by a conditional.
  * \(\exists x. [man(x) \wedge \exists y. donkey(y) \wedge owns(x, y)] \rightarrow beats(x, y)\)
  * The bound variables go out of scope in the antecedent, and \(x, y\) are free in the consequent.
* Problems against cross sentential QR
  * Consider if we instead concatenate "A man walked in..." cross setentially
    * \(\exists x. Man(x) \wedge WalkedIn(x) \wedge LookedTired(x)\)
  * What if speech acts contradicted each other.
    * ex
      1. A man fell over the edge.
      2. He didn't fall, he jumped.
      * The discourse representation as a whole is contradictory but each speech act is consistent
      * If we assume that indefinites take scope over the discourse we can no longer consider each utterance in isolation
    * ex.
      1. A dog came in
      2. What did it do next?
      * We can't start with a proposition, then continue with a question!
      * 'it' refers across sentence boundaries in the discourse
* **Maximality in anaphora**
  * Consider the sentence
    * John owns some sheep. Harry vaccinated them.
    * \(\exists x. sheep(x) \wedge owns(j, x) \wedge vaccinated(h, x)\) 
      * This is wrong!
      * This is true if there is at least one of John's sheep that was vaccinated by Harry, but intuitively the sentence is interpreted maximally
        * Harry vaccinated **all the sheep**, not just a one of them.

## Discourse Representational Theory
* A **discourse referential structure** is a mental structure held by a speaker 
  * contains all individuals (events, objects) mentioned in the text
  * for each individual, record what is said about its
* Indefinites introduce new discourse referents
  * Every time we have an indefinite, it functions as an instruction to introduce a **new** discourse referent.
  * Consider *John is friends with a dog, and Mary is friends with a dog.*
    * Every time "a dog" is parsed, there is a new discourse referent created
  * discourse referents have a lifespan and we can only refer to it anaphorically in a certain part of the discourse.
    * Bill has a car/It is black/Bill's car is black
    * Bill doesn't have a car. \*It/The car/Bill's car is black
      * negation limits the lifespan of the referent
    * John wants to catch a fish and eat it for supper. \*Do you see it over there?
      * wants limits the lifespan of the referent
* A DRS is a 2-tuple \(K = (U_k, Con_k)\)
  * \(U_k\) is the universe of the discourse
    * This is where the referents live
  * \(Con_k\) is the set of the conditions (closures) that specify properties on the referents in \(U_k\).
  * DRS are written in linear notation like so
    * \([x, y : Max(x), Donkey(x), Owns(x, y)]\)
  * DRS can be recursive
  * For example
    * Pedro doesn't own a donkey
      * \([x : x = Pedro \neg [y: Donkey(y), Owns(x, y)]]\)
    * If a farmer owns a donkey he beats it.
      * \([: [x, y : Farmer(x), Donkey(y), Owns(x, y)] \implies [: Beats(x, y)]]\)
      * Notice that the othermost shell here is empty
  * We say that a DRS \(K\) is true wrt a model \(M\) if there is a way to associate individuals in \(M\) with the discourse referents of \(K\) so that each condition in \(K\) is verified in \(M\)
    * We want to find an embedding \(U_k \to M_g\) that maps referents to individuals.
  * A function \(f\) verifies a DRS \(K\) with respect to \(M\) if
    * The domain of \(f\) is a subset of \(U_K\)
    * For each \(c \in Con_K\), \(c\) is true with respect to M.

* DRS interpretation is iterative
  * Start with an empty embedding and find mappings of values to closures. 

* Semantics of negation
  * Consider the DRS \(K\) for "Pedro doesn't own a donkey" \([x : x = Pedro, \neg [ y: Donkey(y), Owns(x, y)]]\)
    * \(f\) verifies \(K\) if \(f\) verifies \(Pedro(x)\) and there is no function \(g\) st.
      * \(g\) extends \(f\)
      * \(g\) verifies \([ y: Donkey(y), Owns(x, y)]\)
    * \(f : A -> X, g : A -> X\) are compatible if \(\forall a \in A, f(a) = g(a)\)
    * \( g : B -> X\) is an extension of \(f : A -> X\) if \(A \subseteq B\) and \(\forall a \in A, f(a) = g(a)\)
  * An embedding function \(f\) verifies a condition of form \(\neg K\) in \(M\) iff there is no function \(g\) such that \(g\) extends \(f\) and \(g\) extends \(K\)
    * There is no assignment \(G \to U_K\) that would allow \(g\) to exist
    * When discourse continues, and new information is received, we interpret relative to the new function
    * We do not have to exhaustively verify each referent
      * This means that modals like negation and desiratives are trapped within the scope of the inner referent
* Semantics of conditionals
  * \(f\) verifies a condition of the form \(K \implies K'\) wrt. \(M\) iff for all extensions \(g\) of \(f\) that verify \(K\), there is an extension \(h\) of \(g\) that verifies \(K'\).
  * This allows referents to interpret \(K'\) with respect to an embedding that assigns a value to the antecedent indefinites
* Anaphoric pronouns
  * pronouns introduce discourse referents that must be identified with old discourse referents
  * anaphoric expressions have unfilled referents that are identified
  * merging an anaphoric DRS is just the union of the universe and conditions.
  * When merging, the merged referent is 'accessible' so we can identify the anaphor with the referent.
  * Once it is done, we can do an \(\beta\)-reduction and replace it with with the referred.
* Additionally we have the following barriers for all DRS \(K, K', K''\), if \(Con_K\) contains a condition of the form
  * \(\neg K'\) then \(K\) is accessible to \(K'\)
  * \(K' \vee K''\) then \(K\) is accessible to \(K'\) and \(K''\).
  * \(K' \implies K''\) then K is accessible to \(K'\) and \(K'\) is accessible to \(K''\)
  * \(K' \forall x. K''\) then \(K\) is accessible to \(K'\) and \(K'\) accessible to \(K''\)
* In DRT, negation creates a new scope so we can not collapse double negated