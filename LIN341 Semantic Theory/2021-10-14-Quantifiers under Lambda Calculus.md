# 2021-10-14 Quantifiers under Lambda Calculus
* Translating English into expressions of lambda calculus
  * How do we convert expressions in \(L_{English}\) into \(L_{\lambda}\), then from \(L_{lambda}\) to denotations?
  * Consider \(\text{run} \rightsquigarrow Run \rightsquigarrow \llbracket Run \rrbracket^{M,g}\)
    * Remember that the denotation of 'Run' is isomorphic to the characteristic function of the set of people who Run.
  * We have some tree representing the sentence 'Jess likes Alex'
      ````
                               Likes(j, a)
                                   / \
                                  /   \
                                 /     \
                                /       \
                               /         \
                              /           \
                             /             \
                          Jess             /\ \x -> Likes(x, a)
                            j             /  \
                                         /    \
                                        /      \
                                       /        \
                                     likes       \
                          \y x -> Likes(x, y)   Alex
                                                 a 
      ````
      We want our translation to be systematic and compositional with respect to each node
  * A lot of semantics presupposes direct interpretation of English, and the two are in fact provably equivalent axiomatic systems
  * We will start with proper names and pronouns
    * Proper names are translated as constants, and pronouns are translated as variables.
    * \(\text{Jess} \rightsquigarrow j\)
    * \(\text{she} \rightsquigarrow y\)
  * Pronouns in English can be bound, which is why we do variable translation, and the interpretation of the variable can vary
  * Intransitive verbs are translated as unary predicates.
    * \(\text{run} \rightsquigarrow run\) 
    * We assumed that the unary predicates of \(L_1\) denoted sets but in \(L_{\lambda}\) we interpret it as the isomorphic characteristic function of type  \(\langle e t \rangle\)
      * The characteristic function is the denotation of the lambda expression but not the denotation of the predicate itself
      * \(\llbracket run \rrbracket^{M, g} = \text{set of runners} \rightsquigarrow run\)
      * Via eta-expansion we right it as \(\text{run} \rightsquigarrow \lambda x. run(x)\)
      * The result of applying this function to a term of type \(e\) is \(t\)
  * We need three pieces of information to derive complex interpretation
    * How to derive translation of NPs from pronouns or proper nouns
    * How to derive translation of intransitive VPs from intransitive V
    * How to derive translation of phrases \(S \to NP VP\) from the translation of subject NP and VP?
  * Non-branching nodes (NN)
    * If \(\beta\) is a tree whose only daughter is \(\alpha\), then \(\lang\lang \beta \rang\rang = \lang\lang \alpha \rang\rang\)
  * Function application (FA)
    * If \(\gamma\) is a tree whose only two subtrees are \(\alpha\) and \(\beta\), and \(a \rightsquigarrow x\) where \(x : \sigma \to \tau\), and \(\beta\) is of type \(\sigma\) then \(\lang\lang \gamma \rang\rang = \lang\lang \alpha \rang\rang(\lang\lang \beta \rang\rang)\)
  * The order of the curried lambda is important to properly specify the agent and patient of the binary relation.
    * For example '[Ludmila [VP kissed Jesse]]'
      * \(kissed\) is eta-expanded \(\lambda y. \lambda x.Kissed(x, y)\). The function is applied first to \(j\) before applied to \(l\).
* Copular and identity functions
  * Adjectives like 'french' and common nouns can also be used with predicates (with copular) so it makes sense to translate adjectives as functions `e -> t`.
  * The copula is thus a higher level identity function of type \(\lang \lang e, t \rang, \lang e, t \rang\rang\) 
    * `is :: (e -> t) -> e -> t`
    * `is P x = P x <=> id`
    * \(is = \lambda P_{\langle e, t\rangle}. \lambda x.P(x)  \)
  * In English, the analysis tell is that 'is' contributes no semantic value but it does carry tense information.
    * In the syntax however, we would stick `BE` somewhere in the VP, and have put inflection in the TP or AgrP rather than on the copular verb itself.
    * Crosslinguistically it is possible to do this NN compounding without copula
  * There are identity functions of different types.
    * Consider 'Alex is jealous of Mina'
      * `Jealous :: e -> e -> t = \y x -> Jealous(x, y)`
      * Then we can consider `of :: e -> e`, so `'of'('Mina') = m`
* Conjunctions like 'and' are defined as `\q p -> p & q` which is of type `t -> t -> t`
* Negative items are defined `\f x -> not f $ x` which propagates up the NegP. 
* `not` is of type `(e -> t) -> (e -> t)` since the sister VP is of type `e -> t`
  * ```
        /\
       /  \
    Billy <e, t>         
            / \
           /   \
          /     \
         /       \
        /         \
       /           \
       |            \
     not               sing
    <<e, t>, <e, t>>   <e, t>   
    ```
  * We basically eta-reduce `sing`, combine it with a negation function
  * Consider the application of 'not sing'
    * \(\lambda f. \lambda y. \neg f(y) / \lambda x. sing(x) = \lambda y. \neg sing(y)\) 
  * What is the type of `and` in dual NP constructions??
    * Consider Billy and Jenny sing.
      * We want the NP to have type `\f -> f(j) & f(b)` so when it is applied to `sing` we get `sing(j) & sing(b)`.
      * We want `\x f -> f(j) & f(x)` at the conjP
      * This infers the type `\y x f -> f(x) & f(y)`
  * Can we give a single basic translation for `and`?
    * `and Q P :: Q -> P -> t`
* Adjectives
  * Consider the sentence 'We hired a French morphologist'
    * This entails that 'We hired a morphologist' and 'We hired a French person'
    * Adjectives that license this pattern are intersective
    * Remember we defined it as \(\llbracket \lang\lang A N \rang \rang \rrbracket^{M, g}(d) = 1 \iff \llbracket \lang \lang A \rang \rang \rrbracket^{M, g}(d) = \llbracket \lang \lang M \rang \rang \rrbracket^{M, g}(d) = 1\) 
      * In other words, if \(\exists d \in \llbracket \lang \lang A \rang \rang \rrbracket^{M, g} \wedge d \in \llbracket \lang \lang N \rang \rang \rrbracket^{M, g}\)
    * Such adjectives can not only be used attributively but also predicatively.
      * 'John smokes' : 'smokes' `\x -> Smokes(x)`
    * We don't know how to deal with sentences like 'Michelle is a french morphologist'
      * What is the expression for 'french morphologist'? We want to say something like `French(m) & Morphologist(m)` at the root.
      * `is` and `a` can be identity so at those levels we have `\x -> French(x) & Morphologist(x)`
      * We do not know how to combine two functions of type `<e,t>` into a conjunctive function.
    * We have to add a principle of composition axiomatically.
      * If we have a node \(\gamma\) with children \(\alpha, \beta : \lang e, t \rang\), then \(\gamma \rightsquigarrow \lambda x. \alpha(x) \wedge \beta(x)\)
* Relativization
  * Consider the following sentences
    * The room which is available is expensive
      * The NP room is translated as \(\lambda x. Room(x)\)
      * We want 'which is available' to be \(\lambda x. Available(x)\).
      * We want to be able to combine this together so at the end we get \(\lambda x. Room(x) \wedge Available(x)\)
      * The clause 'is available' we want to be of type `t`. How do we get the entire clause to be translated as `\x -> Available(x)`?
    * The available room is expensive
  * We need to understand the semantic effect of relativization
    * This allows us to understand traces and nominal expressions that bind traces
    * We need to keep track of where the relative pronoun originates
    * We will treat the trace as a free, indexed variable of type `e`, then somewhere above we have a lambda that binds the variable.
  * If \(\alpha\) is an indexed trace or pronoun, then \(\lang\lang \alpha_1 \rang\rang = x_1\)
    * The indexed variable will be bound by Spec,CP which binds the indexed variable with the lambda
    * This principle is called **predicate abstraction**
      * If \(\alpha\) is a branching node whose daughters are \(\beta\) and \(\gamma\), where \(\beta\) is a relative pronoun or 'such', and \(i \in \N\), \(\lang\lang\alpha\rang\rang = \lambda x_i \in D. \lang\lang y\rang\rang\)
