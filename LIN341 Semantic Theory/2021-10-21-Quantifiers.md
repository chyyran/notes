# 2021-10-21 Quantifiers

* Recall predicate abstraction \(f(x) \to \lambda x. f(x)\) (eta expansion)
* Recall predicate modification \(\lambda x. g(x) \to \lambda y. h(y) \to \lambda x. g(x) \wedge h(x)\)
* Consider the following DPs
  * [DP Every student] is happy
  * [DP Some student] is happy
  * [DP No student] is happy
* The *determiner* is 'Every', but the **quantifier** is the DP [Every student].
  * 'Every' is not really on par with the quantifiers of first order logic \(\forall\), but instead 'Everything' is.
  * Notice that 'every' has some filter that is obligatory.
    * Every student : \(\forall x. Student(x) \implies P(x)\)
* What is the type of these expressions in \(L_\lambda\)?
  * We can not analyze these as \(e\).
    * \(e\) allows for analyses of subset to superset inferences For example if we have set of \(x \in \text{Cat} \subseteq \text{Animal}\)
    * When NP is of type \(e\), sentences of the form \(\text{NP VP} \wedge \neg \text{NPVP})\) are contradictions. This is not true for quantifiers.
  * Law of the excluded middle
    * if you have \(p\) is true then there is no alternstive, either \(p\) is true or fllse.'
    * Expressions of type \(e\) don't take part in scope ambiguity
* Historically we analyze everything and nothing denote sets.
  * \(\llbracket Everything \rrbracket = D_e\)
  * \(\llbracket Nothing \rrbracket = \emptyset\)
  * This doesn't work! Remember sets are `e -> t` via characteristic function isomorphism. How do we combine this with \(\lambda x. glitters(x)\)?
  * It is also non informative even if we mess with the types. \(\lambda x. x \in D_e \wedge glitters(x) \equiv \lambda x. glitters(x)\)
  We really want to say some inclusion relation: \(D_e \subseteq Glitter\).
  * We can make this work for some simple sentences.
    * Ann vanished \(\iff \forall x \in {Ann}.  x \in Vanished \)
    * Everything vanished \(\iff \forall x \in De.  x \in Vanished \)
    * Nothing vanished \(\iff \forall x \in \emptyset. x \in Vanished\)
      * This is vacuously true! By definition the empty set is the subset of any set.
      * No matter what we put here we always end up with a true statement.
    * Also note that
      * Nothing vanished fast \(\models\) Nothing vanished
        * by vacuous reasoning. 
        * this is however not the case! What if sommething vanished slowly?
  * We can not model quantifiers as expressions of type \(e\) or of type \(et\).
* Quantificational DPs denote relations between sets.
  * We can paraphase quantificational DPs as follows
    * Some student is happy
     
      There exists at least one individual who is both a student and a happy person.

      \(\exists x. S(x) \wedge H(x)\)

      \(S \cap H \neq \emptyset\)
    * Every student is happy

      For every individual if that individual is a student then they are happy.

      \(\forall x. S(x) \implies H(x)\)

      \(S \subseteq Happy\)

    * No student is happy

      There does not exist any individual who is both a student and is happy.

    \(\forall x. S(x) \implies \neg H(x)\)
    
    \(S \cap H = \emptyset\)
* Higher order functions
  * **Some** is translated as \(\lambda P. \lambda Q. \exists x P(x) \wedge Q(x)\)
  * **Every** \(\lambda P. \lambda Q. \forall x. P(x) \implies Q(x)\)
  * **No** is translated as \(\lambda P. \lambda Q. \neg \exists x. P(x) \wedge Q(x)\)
* Quantifiers in object position
  * Consider "Magda likes every student"
    * The fully evaluated DPs look like \(\lambda f. \forall x. s(x) \implies f(x)\) with type \((e \to t) \to t\). However we want to combine it with a VP of type \(e \to (e \to t)\).
  * Additionally the denotation we want is that the property of the student is liked by Magda, but at the point in the derivation we do not have access to Magda
  * Even if we ignore the type, the resulting statement ends up in the wrong position!
* Quantifier Raising
  * Consider a sentence such as [Student who Jess likes]
    * This NP could combine with a determiner as a higher DP
    * This structure already gives us a solution to quantifier raising!
    * We want to think of students as being in the object position.
      * \(\lambda x. Student(x) \wedge Likes(j, x)\)
      * The individuals who are students are also the individuals which Jess likes.
    * We think of the `who` as leaving a trace behind which acts like a variable to be filled in at a higher level
    * Instead of the relative pronoun as moving from the object position, we think of \(student\) as originating inside the DP, and leaves a trace which can be combined down in the hierarchy
    * Now we have a quantifier that originated inside the VP and moved up, which has the correct type
* Type shifting
  * We change the type of the verb or the quantifier to fit.
* Bound pronouns
  * Consider a sentence like [Every linguist likes herself]
    * This should mean \(\forall x. Linguist(x) \implies Likes(x,x)\)
    * We can not bind "herself" to the same referent in \(x\) in the quantifier.
    * What if we give "herself" an index and insert a binder between 'likes' and 'every linguist'
      * At the binder we get \(Likes(v1, v1)\)
      * One level higher we abstract over \(v1\) via predicate abstraction
    * Then raise it to SpecTP