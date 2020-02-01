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
  * Complements
    * Phrases that are c-selected by heads and introduced in the tree as the sister of the head.
    * Complements are obligatory to phrase structure
    * For example, `devour` must have a DP complement
      * `*Franny devoured`
      * `*Franny [devoured [the cookie]]`
    * The DP c-selects an NP
      * `*Franny [devoured [the]]`
      * `Franny [devoured [the cookie]]`
    * C-selection in syntax is similar to c-selection in morphology in order to know what a head c-selects. This is part of its lexical entry.
  * Constituency tests demonstrate that a complement always behaves as though it is inside the phrase, not outside.
    * Franny will [devour the cookie]
    * and Hassan will ~~[devour the cookie]~~ too
    * * and Hassan will ~~[devour~~ the cookie] too
  * DP c-selects NP, or nothing
    * pronouns and proper names are simple DPs
      * They have the same distribution that nouns that have a determiner, but can't have anything in them.
  * NP c-select 
    * PP, i.e. student **of linguistics**
    * Clauses
      * claim **that the earth is flat**
    * Nothing!
      * The norm is for nouns to not have complements
  * Adjective can c-select complements
    * Nothing
    * PP
      * afraid of the dark
    * Clauses
      * proud **that I finished the project on time**
  * VPs are more complex
    * Nothing
    * 1 DP
      * devoured the cookie
    * 2 DPs
      * gave Hasan the cookie
    * 1 DP and 1 PP
    * a clause
  * Heads vary in very significant ways in terms of subcategories.
    * Category of morpheme makes c-selection column completely redundant.

## Clauses
The biggest kind of phrase is a Clause
* Clauses can be broken down into subject and predicate
* Clauses can be introduced recursively
* Clauses that appear inside other clauses, they are **subordinated clauses**
  * Hassan [said [that Franny [devoured the cookie]]]
* Clauses are constituents
  * I already know **that reading week is in February**
  * **That reading week is in February**, I already know.
  * I already know **it**
  * What I know is **that Reading Week is in February**
  * I already know **that Reading Week is in February** and **the weather will be bad**
* A single node that exhaustively dominates a clause, but what category is the dominating node?
  * Complementizers are words we see when we introduce embedded clauses
    * I know **that** Reading Week is in February
    * I wonder **if** Reading Week is in February
    * I planned **for** Reading Week is in February
  * Looks like determiners, but have a different distribution
  * We take a clause to be a CP (a complementizer phrase)
    * We have evidence for this to be true
      ````
          VP
         /   \
        V     CP
        |    /  \
      think C   XP
            |    |
           that  X
                 |
             she left
      ````  
      * Complementizers are c-selected by the verbs that introduce them.
        * Franny may think **that** she left
        * *Franny may think **if** she left
        * *Franny may think **whether** she left
      * Complementizers indicate what type of clause they are building, e.g. statement or question
        * We use notation whether or not a complementizer forms a question
          * that C[-q]
          * for C[-q]
          * if C[+q]
          * whether C
      * Sometimes in English, complementizers are optional (null complementizer). We assume there is a complementizer even if we don't see it.
      * The XP in the above introduces the subject of the sentence.
        * The XP is a projection of a Tense category
          * `Franny devoured the cookie` Past-tense
          * `Franny devours the cookie` Non-past
          * `Franny will devour the cookie` Future
      * There are major distributional differences between tensed and tenseless clauses.
      * Examples (in English, tenseless clauses are subordinate)
        * Hassan persuaded **Franny to call the senator**
        * Hassan persuades **Franny to call the senator**
        * Hassan will persuade **Franny to call the senator**
    * Complimentizers clearly select tensed/tenseless distinction
      * `I heard that [Franny called the senator]`
      * `*I heard that [Franny to call the senator]`
      * `*I prefer for [Franny called the senator]`
      * `I prefer for [Franny to call the senator]`
    * C selects for [+/- t] for tense.
    * So now we have a name for tense phrases, TP
      * How do we fit a T head into the TP structure?
      * T forms a constituent with VP to the exclusion of a subject.
        * Clear to see with free morphemes in T (modals), for example **will**
        * It forms an intermediate node T' (T-bar) to distinguish from the head and the TP