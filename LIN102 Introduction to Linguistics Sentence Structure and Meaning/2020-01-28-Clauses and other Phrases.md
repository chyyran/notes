# 2020-01-28 Clauses and Other Phrases
* Clauses are special
* Phrase structure

## Phrases
* Syntax builds hierarchical structure by assembling words to form larger units
* Structure can be understood in terms of constituents, where each constituent is a unit of structure exhaustively dominated by a single syntactic node
* **Phrases and constituents are not the same thing**
  * All phrases are constituents, not the reverse
    * Individual words are also constituents.
* Phrase is a "richer" notion
  * They have parts not defined by exhaustive definition
  * What is the category of a phrase?
    * Phrases have heads which determine their category
    * We use the abbreviation `P` for "Phrase"
    * ```
        XP
       /  \
      X   ...
      ``` 
      Here, the head of the phrase is an `X`, and the entire phrase is an `XP`. 
    * The head of the phrase tells us the category of the phrase
      ```
       NP
       |
       N
       |
      box
      ```
    * In English, there is a strong tendency for the head to be on the left of a phrase, but this is not necessary.
    * When you add structure, it may or may not change the head.
    * Head of a phrase is a minimal category, not a mother node.
    * Every minimal category **projects** a phrase level node.
      * When you use a minimal category in **syntax**, it is always the child of a phrase-level node.
    * Every phrase has a head, and the head of a phrase is obligatory.
      * **box**
      * big **box**
      * **box** of chocolates
      * big **box** of chocolates
      * *big of chocolates
    * Some phrases only have a head.
      * Even if your phrase is one node, it needs to have a parent phrase-level node.
    * The head of a phrase determine what other constituents the phrase can contain
      * `The kids [ate the cookies]` VP
      * `The kids [ate]` VP
      * `The kids [devoured the cookies]` VP
      * `*The kids [devoured]` *VP
      * `The kids [watched the movie for 2 hours]` VP
      * `*The kids [finished the movie for 2 hours]` *VP
    * Phrases can be modified by other phrases, which optionally enriches the description of the head. 
      * Modified via a combinatorial mechanism called adjunction
      * people **who are kind to strangers**
      * watch **for an hour**
      * Adjuncts can behave with respect to consituency tests as though they are outside the XP they modify, and inside of it.
        * `Hassan bought that [big [box of chocolates]]`
        * `Hassan bought that [big [one]]`
          * Seems like it's outside the NP
        * `Hassan bought that [one]`
          * Seems like its inside the NP
      * We adjoin the modifier as a sister to the XP node and lavel the new highest node as XP again.
        * ```
              NP
            /   \
           AP    NP
           |    / \
           A    N PP
           |    |  |
          big  box of chocolates
          ```
          We have 2 noun phrases to work with here (big box of chocolates), and (box of chocolates)
        * This holds also for VP
          * `Hares [[run races] quickly]`
          * `... and Tortoises [[do so] slowly]`
          * `... and Tortoises [do so] too`
        * The adjunct does not change the category of the phrase.
      * The term "adjunction" specifically means to attach to a phrase level node, and create a new node from the child with the same category
      * Technically possible to use adjunction without modifiers
    * NP typically modified by 
      * Adjective Phrases (AP)
      * Prepositional phrases (PP)
        * girl **on a bicycle**
      * Clauses (?P)
        * people **who are kind to strangers**
    * VP typicaly modified by 
      * Adverb Phrases (AdvP)
        * run **quickly**
      * Prepositional Phrases (PP)
    * AP typically modified by
      * AP
        * **deep** red
      * AdvP
        * **mostly** red
      * Degree Phrases (DegP)
        * **very** red
    * AdvP typically modified by
      * DP
  * **Golden rule of modification**
    * The modifier attaches to the phrase it is understood as modifying
    * `Franny ate the cookie on the floor`
      * This can mean either the cookie was on the floor (about where the cookie is, which cookie)
        * Attaches PP modifier to "cookie"
      * Or where Franny ate (about where the eating happens)
        * Attaches PP modifier to VP "ate the cookie"

