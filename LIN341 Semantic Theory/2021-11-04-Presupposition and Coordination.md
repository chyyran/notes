# 2021-11-04 Presupposition and Coordination

* basic facts
  * A sentence like 'Chris stopped smoking' entails the following
    1. Chris does not smoke.
    2. Chris smoked in the past.
  * If we negate this, we no longer entail (1) but keep implication in (2)
    * Chris did not stop smoking
      * \(\not \models\) Chris does not smoke
      * \>\> Chris smoked in the past.
        * If this was just an entailment, this would be filtered out.
  * There are some environments that filter out the entailment (1)
    * Negation: Chris didn't stop smoking
    * Question: Did Chris stop smoking
    * Antecedent of conditional: If Chris stopped smoking, she will get healthier
      * compatible with both Chris smoking or not smoking
    * Possibility modal: It's possible that Chris stopped smoking
      * Whether or not Chris stopped smoking this is still true
  * Remember entailment def.
    * \(S \models E \equiv S \implies E\) 
* Remember that presupposition is an inference that we expect to survive the embedding of environments that filter out entailments
  * The intuition is that presupposition is background information, it is taken for granted when interpreting the sentence but are not the main point
    * Chris does not smoke, #but she stopped smoking
      * The presupposed inference being restated here sounds redundant since it is already part of the common ground
    * Chris used to smoke, but she stopped smoking
* Presuppositions properties
  * project across filtering environments
  * backgroundness
* Certain lexical items trigger presuppositions
  * definite articles presuppose the existence of their noun complement
    * The woman who discovered a cure for cancer won a Nobel prize
      * presupposes the existence of the woman who discovered the cure
  * wh-clefts presupposes the truth of the predicate
    * It was Joshua who broke the toaster
      * presupposes that the toaster is broken
  * factive predicates presuppose the truth of the predicate
    * jess is **aware** that the roof is leaking
  * Additive particles presuppose the alternative proposition
    * 'Alex stole a laptop too' presupposes someone else stole a laptop or Alex stole more than a laptop depending on prosodic stress
    * \(\exists x. Thing(s) \wedge \neg Laptop(x)\wedge Stole(a, x)\)
* Consider the sentence 'Alex is having dinner in New York too'
  * We start a conversation with this sentence
  * We don't have any context to license the usage of *too*
  * This is a presupposition failure, because the presupposition is not part of our common knowledge
  * To avoid failure we have to be able to presuppose that there is a **specific individual** within our universe of discourse, and not just 'somebody'
    * there are many people in NY so it's useless to assume it is just existential, i.e. \(\exists x. a \neq x \wedge DinnerNyc(x)\) is too weak
    * We need a proposition \(\exists x, x \neq a \wedge (p = DinnerNYC(x))\)

* Presupposition accomodation
  * When the presupposition of an utterance is not common knowledge there can be a communication breakdown (presup. failure)
  * The particle *too* is much harder to accomodate than something like *again*.
    * 'Do you want to have dinner at my place too?'
      * failure if you have no idea who else is supposed to be there
  * Other cases are pretty easy to accomodate
    * 'I'm sorry, I'm late, **my dog** was sick and I had to go to the vet'
      * **my dog** presupposes the existence of the dog. 
* Fundamental problems
  * What is the nature of presuppositions? To what extent are they semantic or pragmatic phenomena?
    * In this class we will lexically encode presuppositions
  * What is the truth value of a sentence whose presuppositions are not satisfied
    * In our truth-conditional semantics we will introduce an undefined truth variable.
  * Why is it that certain expressions or constructions are systematically associated with presuppositions? Is it a matter of convention?
    * We are assuming that they are lexically encoded
  * Why is it the case that presuppositions project as they do?
    * We will explore an analysis that is not really optimal for pedagogical reasons..
* Definite descriptions
  * definite descriptions are **referring expressions**
  * In the context of the lecture (in 2021), it seems correct that \([[\lang\text{the chair of the department of linguistics}\rang]]^{M, g}\) = Sali Tagliamonte
    * A single definite description seems to pick the individual that satisfies the description
  * What happens when there is no such individual that the referent refers to?
    * \([[\lang\text{the president of the department of linguistics}\rang]]^{M, g}\) = ??
    * Such descriptions lead to presupposition failure
      * example
        1. The president of the Dept. of Linguistics is a woman.
        2. I didn't know the Dept. of Linguistics had a president?
      * are preserved under negation
        1. The president of the Dept. of Linguistics is a woman.
        2. I didn't know the Dept. of Linguistics had a president?
  * Similar problems when a singular description is fulfilled by more than 1 individual
    * \([[\lang\text{the Dept. of Linguistics graduate student}\rang]]^{M, g}\) = ?
  * It seems that these presupposition failures 'project' above negation
  * This naturally leads to the observation that definite description presuppose the existence of **a unique individual** that satisfies the description.
    * This leads to a three-valued truth logic
    * \(S >> P \equiv \neg P \implies \neg S \wedge S \equiv S = \#\)
      * S presupposes P if S is neither true nor false unless P is true.
## \(\iota\)-logic

* We need to interpret presuppositions with respect to a three-valued True, False, Undefined system
* We need to add an operator that allows us to translate such definite descriptions.
  * \(\lang \text{the} \rang = \lambda f_{e,t}. \iota x. f(x)\)
  * \(\lang \text{the cat} \rang = \iota x. cat(x)\)
    * 'the unique individual x such that x is a cat'
  * We need to specify the interpretations of such expressions
    * What does 'failure' of interpretation means?
      * \(\#_{e}\) is the undefined individual and expressions that fail to refer denote \(\#_{e}\).
      * Formulas that denote \(\#\) are neither true nor false.
  * \(\iota x.P(x)\) denotes **the single individual** that satisfies P. If \(|P| \neq 1\) then it denotes nothing.
    * \[\llbracket \iota x.P(x) \rrbracket^{M, g} = 
         \begin{cases}
         d & \{k : \llbracket P(x) \rrbracket^{M, g[x \to k]}\} = 1\} = \{d\}\\
         \# & \text{otherwise}
         \end{cases}
         \]
* Kleene semantics
  * Consider the sentence "The cat is hungry"
    * There is no cat, so 'the cat' denotes \(\#_e\).
    * This trivially denotes \(\#\).
  * What about more complex sentences like 'The cat is hungry and Jess is tired' or 'The cat is not hungry'.
  * If \(\#\) means 'nonsense' we have the 'weak Kleene semantics'
    * |&|T|F|#|
      |-|-|-|-|
      |T|T|F|#|
      |F|F|F|#|
      |#|#|#|#|
      
      |\||T|F|#|
      |-|-|-|-|
      |T|T|T|#|
      |F|T|F|#|
      |#|#|#|#|
      
      ||\(\neg\)|
      |-|-|
      |T|F|
      |F|T|
      |#|#|
  * If we instead take \(\#_e\) to be undefined we have the strong Kleene loigics
   * |&|T|F|#|
      |-|-|-|-|
      |T|T|F|#|
      |F|F|F|F|
      |#|#|#|#|
      
      |\||T|F|#|
      |-|-|-|-|
      |T|T|T|T|
      |F|T|F|F|
      |#|T|F|#|
      
      ||\(\neg\)|
      |-|-|
      |T|F|
      |F|T|
      |#|#|
* Strong kleene is what happens when all possible repairs are applied to a failed presupposition
* We can also analyze quantifiers according to three-valued logic. We need to satisfy the following conditions
  1. The interpretation of \(\forall\) and \(\exists\) should match \(\wedge\) and \(\vee\).
     * We don't want to use weak Kleene for the universal and strong Kleene for the existential or vice versa
  2. \(\forall\) and \(\exists\) should be duals.
     * \(\forall x. P(x) \equiv \neg \exists x. \neg P(x)\)
  3. We should make empiracally correct predictions about presupposition projection.
  * Consider the definitions provided in the textbook.
    * \[
        \llbracket \forall x. P(x) \rrbracket^{M, g} = \begin{cases}
        T & \llbracket P(x) \rrbracket^{M, g[x \to d]} = T,  \forall d \in D \\
        \# & \llbracket P(x) \rrbracket^{M, g[x \to d]} = \#,  \exists d \in D\\
          F
        \end{cases}
       \]
        * this is weak kleene, because as soon as we have one undefined everything is undefined.
        * \(T \wedge ... \wedge \# \wedge ... = \#\)  
    * \[
        \llbracket \exists x. P(x) \rrbracket^{M, g} = \begin{cases}
        F & \llbracket P(x) \rrbracket^{M, g[x \to d]} = F,  \forall d \in D \\
        \# & \llbracket P(x) \rrbracket^{M, g[x \to d]} = \#,  \exists d \in D\\
          T
        \end{cases}
       \] 
        * This is still weak kleene analaysis 
        * \(T \vee ... \vee \# \vee ... = \#\)
  * We can logically confirm points 1 and 2 via truth table
  * What about point 3?
    * Consider these following sentences
      1. Every dog chewed its bone. 
         * \(\forall x. Dog(x) \implies Chewed(x, \iota y. Bone(y) \wedge Possess(x, y))\)
         * What does this presuppose?
           * Does it presuppose that every dog owns a bone?
           * Does it presuppose that every dog owns a unique bone?
           * Does it presuppose that everything in the domain of quantification has a unique bone that it owns? Does everything in the universe own a bone?
           * We need to consider what the value of Posess(x,y) is.
           * We also quantify over every individual in the domain!
           * Consider a model where we have a dog that does not posess a bone. Then such a truth value would be \(\#\). 
             * By weak Kleene the entire formula is \(\#\). 
           * In trivalent logic, \(P \implies Q\) is undefined if P is false and Q is undefined (equivalence to \(P \vee \neg Q)\).
           * This means any bone in the domain is has the antecedent undefined.
           * Under weak Kleene, "Every dog chewed its bone" ends up presupposing that every individual in the domain of discourse owns a bone which is way too strong.
      2. Some dog chewed it's bone.  