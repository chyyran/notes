# 2021-12-02 Conjunction and Plurality

* We need to introduce groups of individuals in our ontology
* There are also a multiplicity of meanings of conjunctions
  * We can unify the analysis by giving a recursive definition of conjunction

## Conjunction
* In basic use, \(\langle and_S \rangle = \lambda q. \lambda p. p \wedge q\)
* There are other uses that are quite hard to use
  * \(\langle and_{VP} \rangle = \lambda g. \lambda f. \lambda x. f(x) \wedge g(x)\)
    * Alex sings and dances - \(sings(a) \wedge dances(a)\)
  * We have 2 things that are not `t` but we make room for the subsequent arguments, then we apply the conjoined predicates to the argument.
* We can also formulate a quantifier conjunction here
  * \(\langle and_{DP} \rangle = \lambda Q'. \lambda Q. \lambda f. Q'(f) \wedge Q(f)\)
    * `and :: ((e -> t) -> t) -> ((e -> t) -> t) -> (e -> t) -> t`
* Through the same algorithm we derive a combinator for transitive verbs
  * \(\langle and_{V} \rangle = \lambda h'. \lambda h. \lambda y. \lambda x. h(y)(x) \wedge h'(y)(x)\)
    * `and :: (e -> (e -> t)) ->  (e -> (e -> t)) -> e -> e -> t`
    * Alex loves and admires Jess = \(Loves(a, j) \wedge Admires(a, j)\)
* We are going to define conjunction recursively that tries to reduce to base `t -> (t -> t)`
* We also need to simplify a little by defining an operator `e -> (e -> t)` to `e -> t`
* We first need to define 'boolean type'
  * A boolean type is any type that returns `t`.
    * \(t\) is a boolean type
    * For any type \(\alpha\), if \(\beta\) is boolean, then \(\langle \alpha, \beta \rangle\) is boolean.
* **and** is defined as an operator \(\Pi\), defined recursively for any boolean type \(\tau\)
  * \[
        \Pi_{\langle \tau, \langle \tau, \tau \rangle \rangle}  = 
            \begin{cases}
                \lambda X_\tau. \lambda Y_\tau. Y \wedge X & \tau = t\\
                \lambda X_\tau. \lambda Y_\tau. \lambda Z_\alpha \Pi_{\langle \beta, \langle \beta, \beta \rangle \rangle}(X(Z))(Y(Z)) & \tau = \langle \alpha, \beta \rangle
            \end{cases}
    \]
* Hmm
  ```haskell
  data Boolean a b = Base a | Rec a b
  and :: Boolean a -> (Boolean a -> Boolean a)
  and (Base a) = (\x y -> y & x)(b)(a)
  and (Rec a)  = (\x y z -> and $ (x(z))(y(z)))(b)(a)
  ``` 

* This theory is incomplete
  * Consider 'Jess and Chris are a happy couple'
    * With our previous theory this would be interpreted as 'Jess is a happy couple and Chris is a happy couple'
  * We need a new conjunction that pluralizes the group `(e -> e) -> e`
  * Thus we need a theory of plural predication
  * Predicates like 'happy couple' can only be applied to groups of 2 for example
  * Distributive interpretation
    * Jess and Chris based a pie -> 'Jess baked a pie and Chris baked a pie'
    * interpretation is distributed across all agents
  * Collective interpretation
    * Jess and Chris based a pie -> Jess made the crust, and Chris put it in the oven, etc.
    * We can not say that Jess collectively baked a pie
  * SOme predicates are collective
  * These can be mixed
    * The linguists and the philosopher baked a pie 
      * true if linguists baked a pie together separate from the philosophers' pie who was baked together
  * what is the nature of the difference between distributive predicates like 'tall' or collective ones like 'gathered' or 'numerous'
  * We first need to introduce a sum operation \(\oplus\)
    * Given 2 individuals \(d\) and \(d'\) their sum is \(d \oplus d'\).
  * We define a part-of relation \(\leq\). Every individual is related to itself.
    * Alex \(\leq\) Alex
    * Alex \(\leq\) Alex \(\oplus\) Jess \(\oplus\) Chris
    * Alex \(\oplus\) Jess \(\leq\) Alex \(\oplus\) Jess \(\oplus\) Chris
  * This is isomorphic to the power set of individuals.
  * Unlike power sets we here have individuals directly rather than sets of individuals  * With this operator
  * With this operator we define \(\langle and_{e, ee}\rangle = \lambda x. \lambda y. x \oplus y\)
  * We define an operator pluralization \(*\) that takes a set P and returns \(*P\) which includes all members of P and their sums
    * \(\llbracket *P^{{M, g}}(d) \rrbracket = 1 \iff \llbracket P^{{M, g}}(d)  \rrbracket = 1 \vee \exists d', d''. d = d' \oplus d'' \wedge \llbracket *P^{{M, g}}(d')\rrbracket = 1 \wedge \llbracket*P^{{M, g}}(d'')\rrbracket = 1\)
    * basically takeing the "power set"
  * This gives us the interpretation of plural nouns
    * \(\lang -s \rang = \lambda P. \lambda x. *P(x)\)
    * \(\lang student \rang = \lambda x. Student(x)\)
    * \(\lang students \rang = \lambda x. *Student(x)\)
* We need to define some sets to consider collective and predicative operation.
  * A set of singular individuals AT (atoms)
  * \(d \in AT \iff d \in D_e, \not \exists d' \in D_e, d' != d. d' \leq d\)
  * \(d \in PL \iff d \in D_e, d \not \in AT\)
  * an atom is an individual that has no proper part
  * a plurality is any individual that is not an atom
* We can define predicates by restricting their domain to either AT or PL
  * for example, **gathered** is defined only for PL
  * **tall** is defined only for AT.
    * despite this it can combine with plural subjects
    * this is done by the auxilliary
    * **are tall** = \***tall** = \(\lambda x. *Tall(x)\)
    * The only way for the sum argument to be in the extension of it's pluralization, this only makes sense for its parts to be in the extension of the non-pluralized predicate
    * This explains the distributive entailments!
* Plural definite descriptiom
  * Plural definite descriptions have an undefined denotation if there is no individual in the extension of the description
  * If there is one or more, then they denote the greatest individual (where greatest = plural that has all others as a part) in the extension of the description
    * This is unlike singular definite description where it is undefined if there is more than one unique individual
  * The supremum of a set \(\sup S\) is the greatest member of \(S\) if it exists.
    * \(\sup P \iff \iota x. P(z) \wedge \forall z. P(z) \implies z \leq x\)
  * We then redefine the definite article **the** = \(\lambda P. \sup P\)
    * For singular nouns, this denotes only atomic individuals, and the supremum will be undefined unless there is one and only one individual in the extension of P. 
      * There are no sums in a non-pluralized P.
    * With plural nouns, the supremum is defined if and only if the extension of the noun is not empty.
* Cumulative readings
  * Consider a sentence like "two Dutch authors wrote three Gothic novels"