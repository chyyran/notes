# 2020-03-10

* Wh-movement from the perspective of sentence processing
* **Who** did Franny see __?
  * A wh-question is a construction that involves a filler-gap
  * We interpret it as the complement of see
* **def'n** A filler-gap appears in a place in the sentence which is often not the location in which it must be interpreted
* Unbounded dependencies 
  * You can create a filler gap dependency across unbounded distances
    * Who did Franny see __ ? 
    * Who did Hassan say that Franny saw __ ?
    * Who did Juan think that Hassan said that Franny saw __ ?
* All these filler-gap dependencies are derived from Wh-movement
  * Wh-question
  * Indirect questions
  * Relative clauses
  * Clefts
* Indirect question
  * There is an embedded question
  * Liza wondered **who** Franny saw __
* Relative clauses
  * These are clauses that modify **NP**s. They adjoin NPs
    * NOT DP
  * Liza knows the *man* **who** Franny saw __
    * We have the clause `[who Franny saw]` that is an adjunct of the NP `[man]`
  * There's no request for information; the information is the noun that is being modified
  * The C in this CP is [-q]
    * ```
            CP
           /  \
          DP  C'
         who / \
            C  TP
            |  ...
          [-q]   
      ```
* Clefts
  * It is *Liza* **who** Franny saw _
  * Very similar to relative clauses, but wrt constituency, in a cleft, it's not a constituent within a DP, but higher up
    * Adjoined to CP adjoined to TP,
    * ```
        CP
       /  \
      C   TP
         /  \
        TP   CP
            /  \
           DP   C'
         who   /  \
             C    TP
      ```
* How does the parser handle long distance dependencies?
* We posited two levels of representation. Does parsing evidence support this.
* Gaps and traces account
  * Speakers plan and produce sentences by starting with a representation that satisfies the expected local dependencies (cf. underlying representation)
  * When speakers encounter an utterance that doesn't match the underlying representation
    * Parser recognizes it doesn't match when it encounters a filler
    * When it encounters a filler, treats it as a signal of mismatch, and triggers the expectation of a gap in the structure
    * Once the gap is filled, interpretation proceeds as normal
* Identifying fillers
  |Construction|Example|Filler|
  |------------|-------|------|
  |Wh-question|**Who** did Franny see __?|Wh-word|
  |Indirect question|Liza wondered **who** Franny saw __ |Wh-word|
  |Relative clause|Liza knows the *man* **who** Franny saw __| NP wh-word|
  |Cleft|It is *Liza* **who** Franny __ | it BE XP wh-word|

  How does the parser identify fillers?
  It-cleft always starts with "it is"
  * The gap position can be inferred on the basis of *subcategorization*
  * For example, the parser can infer a gap after **invited** because *invite* subcateorizes for a DP
    * It was *Franny* **who** Hassan invite.
  * Associating the filler phrase with the gap site, interpretation of the local dependency of the gap site and the verb becomes possible.
* Cross-modal priming
  * Priming is a processing effect where similarities of various sorts facilitate processing. 
    * "facilitate processing" means "speeding up processing"
    * Words can prime other words. 
    * When a word primes another word, it is called a **prime** and the primed word is a **target**
      * `cat` primes `dog` (semantic priming)
      * `cat` primes `hat` (phonological priming)
    * Structures can prime other structures
      * transitive use of a VP can prime another transitive VP
    * Priming is commonly manipulated in the design of the processing experiments.
  * Cross-modality involves manipulating more than one       perceptual channel. A cross-modal priming experiment sets up a priming effect across channels.
* **Nicol & Pickering (1993)**
  * Cross-modal priming experiment, participants were exposed to stimuli coming from two different senses: hearing and vision.
  * Thats *the boy* **who** the people at the party liked **[gap site]** very much.
    * Relative clause. It-clefts always start with "it is"
  * Participants were shown **target** words on a computer screen at different points in times as they listened to sentences like the above.
    * The words in the sentence they are listening to serve as the potential **primes** for these target words.
  * Participants responded to the target word by naming it as fast as they could.
    * Quick response implied info associated with target word was activated (priming effect)
    * Slow response implied info associated with target word was less activated.
  * Researchers measured how long it took participants to respond to visual target words
  * They presented target words just before liked, and at the gap site.
  * The reasoning is that if the parsing does occur at the gap site, it should activate a strong priming effect.
* Active filler strategy (Janet Fodor)
  * As soon as the parser encounters a filler it tries to put the filler in the first gap it finds
  * The parser finds gaps **greedily**
  * We expect **garden path effects** when there are multiple gap sites and the first one doesn't happen to be correct.
    * That's the *boy* who the girl liked [possible gap site] to ignore [actual gap site]
  * This is a local ambiguity