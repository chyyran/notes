# 2021-01-12

* what is meaning?
  * different objects have meaning
  * gestures, signage, events
  * **words, sentences, _utterances_**
    * in this course, we study such linguistic meaning
    * we are not considering non-linguistic gestures
    * sign languages are linguistic gestures! we will not study them in detail though.
* Reasoning
  * Consider the following paragraph
  * > Stocks **can**, and do, become worthless. But an option holder runs a much greater risk of losing the entire amount paid for the option in a relatively short period of time. The risk reflects the nature of an option as a wasting asset that is worthless once it expires. **If** the option holder does**n't** sell the option in the secondary market **or** exercise it prior to its expiration date, the holder loses the entire investment in the option.
    * The first "can" indicates that the statement "Stocks can become worthless" may possibly be true in some context
    * "do" indicates that stocks becoming worthless is true in some known context---such an event has been observed by the speaker
    * "can" and "do" are functional morphemes, doesn't have lexical (referential) meaning
  * **If** the option holder does**n't** sell the option in the secondary market **or** exercise it prior to its expiration date, the holder loses the entire investment in the option.
    * "If" sets up the proposition 
      * with the antecedent "the option holder does**n't** sell the option in the secondary market **or** exercise it prior to its expiration date"
      * conseqeunce of "the holder loses the entire investment in the option."
    * "n't" negates the truth of the statement "does sell the option"
    * "or" conjunction
    * If-then structure
    * \(\neg Sell(Option) \vee Exercise(Option) \implies Lose(Investment)\)
  * Wason's Selection Task (Wason 1968, Wason & Shapiro 1971)
    * You are given some cards, such as `D F 3 5`, **all cards only have a letter on one side and a number on the other**
    * Given a statement such as "Every card with a D on one side has a 3 on the other side"
    * Which cards do you need to flip to verify the truth of the claim?
    * Answer is D and 5, and only 12.5% people answered correctly.
    * We are trying to falsify the statement. 
      * Flip D to try and falsify '3 on the other side'. If 3 is not on the other side, then we have falsified it.
      * F is independent of the proposition
      * The proposition is a forward implication, so what 3 has on the other side is independent. We only care about cards with D on the letter side.
      * Flip 5 to check if there is a D to falsify \(Letter(D) \implies Number(3)\)
  * Wason's Selection Task (Concrete)
    * Encode previous problem with cards `Manchester, Leeds, Car, Train`
    * Cards have a destination on one side, and transport on the other
    * "Every time I go to Manchester, I go by car"
    * Correct answer is Manchester and train, 62.5% of people answered correctly
    * Why is this different from the numbers and letters example?
  * Goals
    * What information is encoded by 'if', 'not', 'or', 'can'?
    * How does lexical and grammatical info interact with context and reasoning of speakers?
* Variation
  * Reduplication in Squamish
    1. Llha Linda na kw'elh-nexw-as kwetsi stakw
      DET Linda RL spill-TR-3.ERG DEM water
      "Linda spilled the water (by accident)"
    2. Llha Linda na kw'elh-kw'elh-nexw-as ta stakw
      DET Linda RL spill-RED-TR-3.ERG DET water
      "Linda spilled the water all the time"
    3. Na lhelh-lhelh-sp'utl'em
       RL-RED-ingest-smoke
       "He smokes"
    * In  2 and 3 there is reduplication but not in 1.
    * Reduplication is used to express habitual aspect in Squamish
  * Can we find crosslinguistic patterns with reduplication as a grammatical feature?
  * Are there limits to this variation
  * Is there structure?
  * How does this cross-linguistic variation affect translation?
* Semantics and pragmatics
  * Need to represent meaning of sentences
  * Meaning of morphemes, words, phrases
  * How meaning of sentences depends on meaning of their constituent parts
  * How linguistic information interface with non-linguistic information?
  * **semantics** has to do with the conventional meaning of words and morphemes and how to derive meaning based on syntactic structure
    * literal meaning
    * word sense
  * **pragmatics** deals with contextual meaning, the same sentence may have different meanings in different contexts, and how this is is used
    * contextual meaning
* Sentence Meaning
  * A **sentence** is a type of linguistic expression, considered **outside of its context of use**
  * An **utterance** is an instance of speech (by a speaker) in a concrete context
* Concepts
  * truth-conditions
    * conditions that are required for a sentence to be true
    * iff you know the meaning, you know the conditions in which it is true---to know the meaning of a sentence is to know the conditions in which is true
      * if someone can tell you in which situations the sentence is true, they know the meaning of the sentence
  * entailments
    * A **entails** B iff every situation in which A is true is a situation where B is true
    * written \(A \implies B\)
    * one way: if A entails B, B does not necessarily entail B. B may be true when A is false.
    * "There is a ball on top of a cube" entails "There is a cube"
    * 1. Chris is a violent criminal
      2. Chris is an alleged criminal
      3. Chris is a criminal.
      * 1 entails 3, but 2 does not. 3 does not entail 1.  
  * Contradictions
    * When two sentences can not be true in the same situation they contradict each other
      * Chris likes every fruit
      * Chris likes bananas
    * \(A \implies B\) iff \(A \wedge \neg B\) is contradictory 
    * `#` means the sentence is not semantically permissible
  * implicatures
    * non-literal meaning
    * inference, conclusion reached by reasoning about the literal meaning of the sentence, through context
      1. How does Chris look?
      2. Is Chris smart?
      3. He is very beautiful
      * With (1) and (3) taken together (3) has its literal meaning. With (2) and (3), there is the literal meaning + implicature that Chris is not smart.
    * Try to second-guess the intentions of the speaker, and enrich the literal meaning
    * Used to not sound impolite
    * "Read between the lines"
    * Implicature is a form of implication, implied by a speaker rather than asserted. 
    * Not part of 'what is said' in an utterance in Gricean terminology
  * Metaphors
    * 'Jess has a heart of stone'
    * Literal meaning: Jess's cardiac muscle is formed of mineral aggregate
    * Figurative meaning: Jess has no sympathy for people
    * Metaphor: heart of stone symbolizes absence of sympathy 
  * presuppositions
    * information taken for granted when the speaker utters a sentence
      * 'Jess stopped smoking' presupposes that 'Jess used to smoke'
      * 'Jess did not stop smoking' also presupposes 'Jess used to smoke'
  * speech acts
    * How we talk about sentences
    * Intonation
    * A sentence can be an order, question, promise, depending on the utterance