# 2021-12-09 Event Semantics

* Consider the following 'diamond' of entailments
  * Brutus stabbed Caesar in the back with a knife
  * Brutus stabbed Caesar in the back
  * Brutus stabbed Caesar with a knife
  * Brutus stabbed Caesar

* Without events we can try to represent this like so
  * \(\exists . knife(x) \& stab(Brutus, Caesar) \& with(x) \& in(Back(Caesar))\)
    * This does not capture that the knife beign used is \(x\)!
    * There are other problems, such as the relationship between Brutus and the Knife, and that Caesar was stabbed in the back, etc.
  * With 'complex' predicates we can be a little more detailed
    * \(\exists. knife(x) \& with(in(stab, Back(Caesar)), x)(Brutus, Caesar)\)
      * the entire predicate "stab in caesar's back" ends up being in the scope of 'with'
      * We don't in general know if with(in(...)) is equivalent to in(width(...))
  * To formalize this we can say that the order of the modifiers don't matter by forming a closure over permutations of modifiers
    * Let \(PERMA(A_1 \$ ... \$ A_N N)\) be the set of all permutations of the modifiers for all Z(x) iff \(A_1 \$ ... \$ A_N N . x\)
    * This solution is not very optimal because the syntax of the logical form ends up being too complicated, and this principle is basically too powerful.

* With events we can make this relationship explicit.
  * \(\exists e. stab(e) \& agent(e, B) \& patient (e, C) \& in(e, back(C)) \& \exists x. knife(x) \& with(e, x)\)
    * where B: brutus, C: Caesar, BK. back
    * We have a conjunction of formulae within an existential quantifier
    * conjunctions have certain quantities to account for the pattern of diamond entailment.
  * 'there is an event \(e\)' such that it has the properties \(P_1, P_2, ...\). 
    * we can analyse each properly independently with respect to \(e\).
    * if we have a sequence of conjuncts, each conjunct is also independently true if the entire sentence is true
    * the order of the conjuncts do not matter
    * this analysis is much neater to account for the properties of a diamond event 
* ordering of modifiers can still be restricted in syntax
  * tall Canadian philosopher/Canadian tall philosopher
* Logic of perceptual idioms
  * verbs like see, hear, feel
  * direct perceptual report
    * Mary saw that Brutus stab Caesar
      * stab is not inflected for tense even if the event happened in the past
    * Sam heard Mary shoot Bill
    * Agatha felt the boat rock
  * If we use a complementizer we have to inflect the verb
    * Mary saw that Brutus stabbed Caesar
      * This doesn't mean exactly the same as 'Mary saw Brutus stab Caesar'
      * In this sentence, we can read it as the event of Brutus stabbing Caesar has completed
      * In direct perceptual report, then Mary experienced the event directly, 
        * in here Mary's perception supports her report, but there is no requiement that the event be experienced directly
      * The matrix verb takes a proposition as its complement.
    * We can capture the difference straightforwardly with events.
      * \(\exists e. see(s) \& experiencer(e, M) \& \exists e'. stabbing(e') \& agent(e', B) \&patient(e', C) \& percept(e, e')\)
      * We can also account for the phenomena where anaphora to complements of perception reports seem to target particular events.
        * \# In 1912, Whitehead saw Russell wink. In 1914, McTaggart saw it too.
          * We get a contradiction because "it" refers to the exact same event that can not happen in 2 different years.
        * In 1912, Whitehead saw Russel wink. In 1914, McTaggart saw the same.
    * There are issues for this analysis with perceptual reports.
      * Consider the example
        1. Poppaea saw Brutus leave the house
        2. Brutus left the house with a knife under his coat
        3. Brutus left the house only once.
        4. Hence Poppaea saw Brutus leave the house with a knife hidden under his coat.
      * *Poppaea saw Brutus leave the house* tells us that Poppaea saw the event of the leaving of the house
        * The fact that Brutus left the house under is coat is not specified as part of the perception in (1). Therefore (4) is not a conclusion we can draw validly.
        * However the analysis we proposed before allows this interpretation.
          * \(\exists e. see(e) \wedge exp(e, P) \wedge \exists e'. leave(e') \wedge theme(e', B) \wedge source(\iota x. H(x)) \wedge percept(e, e')\)
        * \(\exists e. leave(e) \wedge theme(e, B) \wedge source(\iota x. H(x)) \exists x. knife(x) \wedge Inst(e, x)\)
        * We can merge these two events to conclude 4, but this is not intuitively valid.
        * The issue is that the clause \(percept(e, e')\) only tells us that the event was perceived, but does not tell us what exactly was perceived
        * This means our analysis is not correct
* We need to to refine our analysis by introducing situation semantics
  * a pair of 'bare real events' and 'visible' events
    * For example, \(\langle e, \lambda e. leave(e) \wedge theme(e, Brutus) \wedge source (\iota x. H(x))\)
* In our analysis so far we have assumed an explicit event, but often these events are implicit
  * IN the following pair, (1) presupposes there was a unique singing of the Marseillaise
    1. After the singing of the Marseillaise they saluted the flag
        * \(\exists e. salute(e) \wedge agent(e, v1) \wedge theme(e, F) \wedge after(e, \sup e' sing(e') \wedge theme(e', M))\)  
    2. After the Marseillaise was sung they saluted the flag 
       * \(\exists e. salute(e) \wedge agent(e, v1) \wedge theme(e, F) \wedge e' sing(e') \wedge theme(e', M) \wedge after(e, e')\)
         * We are asserting the existence of the event of singing of the Marsellaise, and additionally that there wa not a unique event of singing
* We can quantify over events explicitly
  * For example consider the sentences
    * In every burning oxygen is consumed
    * Agatha burned the wood
    * Oxygen was consumed
  * \(\forall e. B(e) \implies \exists e' C(e) \wedge Patient(e', e)\)
  * \(\exists e. B(e) \wedge Agent(e, a)\)
  * \(\therefore \exists . c(e) Patient(e, o)\)
* Neo-davidson separation allow us to separate the event instance from the thematic roles of the event
  * Also allows us to study event alternations.
    * Consider the following alternation
      * Brutus stabbed Caesar
      * Caesar was stabbed (by Brutus)
    * \(\e. stab(e, Brutus, Caesar)\) (classical davidsonian)
    * \(\e. stab(e) \wedge agent(e, Brutus), \wedge patient(e, Caesar)\)
    * \(\e. stab(e) \wedge patient(e, Caesar)\) (passiviation by dropping agent predicate)
* How do we get the logical form for these event-separated structures?
  * Without events we used to analyse verbs very simply
    * \(\lambda y. \lambda x. stab(x, y)\)
    * If we add an argument to an event like this what we get is a lambda with a single event
      * \(\lambda y. \lambda x. \lambda e. stab(e, x, y)\)
        * at the top we use some type shifting operator and quantify over the event.
    * we can have a much richer implementation, such as 
      * \(\lambda y. \lambda x. \lambda e. stab(e) \wedge agent(e, x) \wedge patient(e,y)\)

* Compositionality in neo-davidson semantics
  * To introduce thematic roles, we must posit that they are introuced by phonologically empty functional heads.
    * For example, \(\langle \textsc{Agent} \rangle = \lambda x. \lambda e. agent(e, x)\)
    * We use predicate modification to combine verbal proprties and thematic roles
    * As long as we are introduicing arguments, we have to leave the variable \(e\) open.
      * Once we quantify over the event, we're stuck.
      * We need to wait until the end to close off the event properties
  * There is a problem with this analysis
    * Consider a sentence like No dog barks
      * intuitively, we want \(\exists x. dog(x) \wedge \exist e. bark(e) \wedge agent(e, x)\)
      * however waiting until the end gets us \(\exists e \neg . bark(e) \wedge \exists x. dog(x) \wedge agent(e, x)\)
        * Situations where these is no event of a dark event but there is an event that is not an event that a dog is barkings
        * for example, the cat is meowing -> there is an event that is not an event of the dog barking
          * regardless of whether or not dogs are barking
      * To solve this, we use continuations to allow events to be interpreted in the scope of the quantifier
        * \(\langle \text{bark} \rangle = \lambda f. \exists e. bark(e) \wedge f(e)\)
        * Close off the continuation with the identity tautalogy \(\lambda e. e = e\)
        * This allows the quantifier over event in the scope of the quantifier over individuals