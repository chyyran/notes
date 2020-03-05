# 2020-03-03 Locality vs. non-local dependencies.

The locality of relations like selection and modification is fundamental.

* Locality of selection
  * a head c-selects its complements as a sister
* Locality of modification
  * A modifier adjoins to the XP it modifies (golden rule)

What if we force a violation of locality?

1. Topicalization
   1. She *put* **the pictures of Bill** on your desk
   2. **The pictures of Bill**, she *put* on your desk
2. Questions
   1. Franny *will* **put the pictures of Bill on your desk**
   2. *Will* Franny **put the pictures of Bill on you your desk**?

Remember that T c-selects VP, but in 2.2, it seems like localization is violated!

We say that the structures that feel like they are not behaving are *derived* from the behaving structure.

An **underlying structure** where local dependencies are established.
A **surface structure** which include the outputs of processes that move heads and phrases.

## Head Movement Patterns
These processes change the positions of heads
* T-to-C in questions
  * In English quesions, we see a displacement pattern where the position of the subject is inverted
    * You *could* **visit on Friday**
    * *could* you **visit on Friday**
  * Two classes of questions
    * **polar questions** yes-no question where the expected answer is yes or no
    * **wh-questions** where the expected answer is new information of the sort requested by the speaker
  * Inversion is modeled as a movement of T to C
    ```
          CP
         /  \
       C    TP
       |   /  \
     [+q] DP   T' 
          |   / \
         SUB T   VP
             |
          [+tense]
    ```
    ```
          CP
        /   \
      C      TP
    [+t,+q] /  \
     ^     DP   T' 
     |     |   / \
     |    SUB T   VP
     |        |
     +---[+tense]
    ```
  The T has moved up to C.
  When we move, we cross the item out in the base position, and rewrite it in the C 
  * What restricts T-to-C movement to questions?
    * **T-to-C** can only happen to `[+q]` clauses.
* V-to-T
  * Order of finite V and adverb phrase
    1. Romeo *carefully* **words** his letters
    2. *Romeo *soigneusement* **formule** ses lettres
    3. *Romeo **words** *carefully* his letters
    4. Romeo **formule** *soigneusement* ses lettres
 * Order of finite V and *negation*
    1. Romeo did *not* **visit** his neighbours
    2. *Romeo ne *pas* **visite** ses voisins
    3. *Romeo did **visit** *not* his neighbours
    4. Romeo ne *visite* **pas** ses voisins
 * This is modeled as a movement of V to T
   ```
         T'
        /  \
       T    VP
     [+t]   |
            V
   ```
   ```
         T'
        /  \
       T    VP
     V [+t] |
     ^      |
     |      | 
     +----- V
   ```
 * V-to-T is triggered by a bound `[+tense]` lexical item; `[+tense]` is like a bound morpheme
 * But V-to-T doesn't happen in English, so how does `[+tense]` be bound in English?　Affix hopping lowers `[+tense]` to V.
* Instead of moving from V to T, it is the inverse movement, where T moves to V.
   ```
         T'
        /  \
       T    VP
     [+t]   |
            V
   ```
   ```
         T'
        /  \
       T    VP
     [+t]   |
      |     |
      +---> V[+t]
   ```
* Auxiliary verbs in English **BE** and **HAVE** do undergo V-to-T.
  * Aspect is the *internal temporal structure* of an event, independent of tense.
  * The event was completed or in progress
  * Perfective auxiliary HAVE
    * Franny *has* eaten the cookies
    * Franny *had* eaten the cookies
    * Franny will *have* eaten the cookies
  * Imperfect auxiliary BE
    * Franny *is* eating the cookies
    * Franny *was* eating the cookies
    * Franny *will* be eating the cookies
  * In english, auxilliary verbs undergo V-to-T
    * Order of finite V and adverb phrase
      1. Romeo carefully words his letters
      2. *Romeo carefully has worded his letters
      3. *Romeo words carefully his letters
      4. Romeo has carefully worded his letters
    * Order of finite V and negation
      1. Romeo *did* not visit his neighbours
      2. *Romeo not has visited his neighbours
      3. *Romeo visited not his neighbours
      4. Romeo has not visited his neighbours
   * V-to-T does not happen if T is already occupied
     * Romeo has not visited his neighbours
     * Romeo could not have visited his neighbours 
 * Participles
   * Auxiliary verbs C-select other VPs
   * HAVE occurs with -en and BE occurs with -ing. We assume it is introduced with the auxiliary in the underlying structure, but the participle undergoes **affix hopping**
   * ```
          VP
         /   \
        V    VP   
     be+ing /  \
           V   DP
           |  the cookies
          eat
     ```
     The -ing hops to the V
     ```
          VP
         /   \
        V     VP   
     be+ing  /  \
        |   V   DP
        |   |  the cookies
        +->eat+ing
     ```
     Remember to cross out the original `ing`.
* Main challenge is to decide what processes have applied.
  * Clauses that have auxiliary verbs
    * Apply Affix Hopping for -en or -ing
    * Is there a modal in T?
      * Yes => Don't apply V-to-T
      * No => Apply V-to-T to the highest auxiliary.
    * Is there [+q] in C?
      * Yes => Apply T-to-C movement
      * No => We're done
* BE and HAVE may also be main verbs, that do not undergo affix hopping.
* Main verb BE undergoes V-to-T, but main verb HAVe does not (in Canadian English)
## Do Support
* Consider
  1. Franny kicked the ball
  2. *Franny not kicked the ball
  3. Franny did not kick the ball
  4. *Franny did not kicked the ball 
* We need *do* here because negation blocks affix hopping! IN the presence of negation, the main verb must remain untensed. It's a dummy verb that we use to bind the `[+tense]` to.
```
       T'
     /    \
   /         \
  [do-ed]     NegP
            /    \
          Neg    VP
          |     /  \
         not   V
              kick  
``` 

## Phrasal Movement
* Topicalization
  * Instead of moving a head, we move the entire XP, adjoining it to TP
  * Underlying structure: XP satisfies in the usual way
  * Topicalized: movement applies
* Wh-movement