# 2020-01-14 Morphological Analysis

* Categories
  * Open vs. closed class categories
  * Subcategories
* Morphemes
  * Bound vs. free morphemes
  * Roots vs. affixes
* Complex word formation
  * Compositionality and idiomaticity
  * Selection, complements, heads
* Lexical entries
  * Trees
* Combinatory principles
  * Locality
  * RHHR
* Morphology and Syntax
  * Lexical categories are syntactic categories
  * Cross-linguistic differences in free vs bound morphology

## Categories
* Use distributional evidence to identify categories
* Morphology (word-formation) offers one important kind of distributional evidence
* > **def'n** Open class categories
  > new members are freely added, e.g. iPad, Insta, Google, frenemies
  > Some examples are nouns, verbs, and adjectives.
* > **def'n** Closed class categories
  > new members are not freely added, e.g. determiners (the, a), prepositions (in, out), grammatical morphemes (-ed, s) 
## Subcategories
* Within a given category, we can usually identify subcategories.
* For example
* ```haskell
  Noun = Count | Mass | ...
  Verbs = States | Events | ...
  Adverbs = Manner | Degree | Frequency | Modal
  ```

  Some examples
  * `cat-s`
  * `*furniture-s`
  * `eating breakfast`
  * `*I am knowing algebra`
* Some examples of the different types of adverbs
  * Manner: slowly, carefully, quickly
  * Degree: too, enough
  * Frequency: often, rarely, always
  * Modal: possibly, probably
* `Franny possibly ate too much`
* `Franny ate enough`
* `*Franny enough ate`

## Morphemes
* Morphemes are the smallest meaningful units of language.
  * *smallest* means indivisible
  * *meaningful* means means they are a pairing of form and meaning
  * How do we infer that some string in a language is a morpheme?
  * Ex. `unfortunately` 
    * `un-` `fortun(e)` `-ate` `-ly` 
      * `un-` means "not"/negation, attaching to adjectives
        * `un-happy`, `un-pleasant`, `un-clear`
      * `fortune` can be used by itself, but also can have things attached to it
        * `mis-fortune`
      * `-ate`
      * `-ly` describes an action (?)
        * `clear-ly`, `pleasant-ly`, `happi-ly`
    * We can separate by removing parts of words and seeing if the remaining parts are still meaningful
    * `unfortunately - un = fortunately`
    * `fortunately - ly = fortunate`
    * `fortunate - ate = fortune` 
  * What about `uncle`? Can we remove anything?
    * The `un` in `uncle` doesn't mean anything in `uncle`!
    * What does it mean for something to *have meaning*? There is a pairing between form and meaning in `un` in unfortunately. There is no meaning in `cle` or `un`; no pairing between the forms and `cle`.
* Morphology offers one important kind of distributional evidence
* Morphemes can be *bound* or *free*
  * In some cases the subparts of words are words, for example, `general` in `generalize`.
  * In other cases they are not, for example `-ize`. `-ize` can not appear on its own.
  * > **def'n** Bound morphemes
    > must appear attached to another element
    > We use a hyphen (-) on it's bound edge to indicate this. `-ize`, `-s`, `un-`, etc.

  * > **def'n** Free morphemes
    > can appear independently
* There are no "word boundaries" in speech: there are no such things as some symbol that mark word boundaries. 
  * `black board` vs. `blackboard`
  * `school bus` vs. `schoolbus`
* bound morphemes are sometimes also called *affixes*. They are differentiated in terms of how they attach to a base. A *base* is not necessarily required to be a free morpheme.
  * A *suffix* attaches to the right of a base.
  * A *prefix* attaches to the left of a base.
  * An *infix* attaches inside a base
    * Tagalog: `ma-buti` (good), `b-um-uti` (become good)
  * A *circumfix* attaches on both sides of the base
    * `em-bold-en`
  * A supra-segment affix attaches without lengthening the base, but instead changes the *prosody* of the word
    * `permit` as a noun, or `permit` as a verb.
  * A stem change attaches without lengthening the base, instead the base is mutated.
    * `run` -> `ran`
* Roots 
  * > The root of the word is what you start with before any affixes have been added (pp. 485)
  * But this definition implies that roots are free. This isn't necessarily true
    * `*ceive`, `*sist`, `*tain`
      * `per-ceive`, `re-ceive`
      * `per-sist`, `re-sist`
      * `per-tain`, `re-tain`
    * `*scissor`
      * `scissors`
      * `scissor-hands`
      * `scissor-ing`
    * `*kempt`
      * `unkempt`
      * `well-kempt`
  * In some languages, bound roots are the norm
    * `*perr` (DOG, Spanish)
      * `perr-o`
  * A better definition of a root can be as follows
  * > **def'n** Root
    > A root has independent meaning. 
  * Compare to affixes, which have 'slots' in their meaning that are completed by the base they attach to.

## Complex Word Formation

* > **def'n** Compositionality
  > The meaning of a complex structure is a function of its meaning of its parts
* For example, `<verb>-er` nouns means `one who <verb>s`.
  * The pattern is productive and generative, the result of compositional:
    * `I need a debugg-er`
  * This even works for words we've never seen before.
    * `Fido is a good blick-er, I see him blick all the time`.
    * `Krum always gets penalties for blatching. He is an uncontrollable blatch-er`. 
* Not all complex forms are compositional. When the meaning of a complex structure is not compositional, it is **idiomatic**
  * `kicked the bucket`
  * `barking up the wrong tree`
  * `cost an arm and a leg`
  * This also works on the morphological level:
    * `pick pocket`
    * `butterfingers`
    * `considerable`
      * `consider-able` doesn't necessarily mean "able to be considered". Unlike `love-able`, `lock-able`.
* An affix needs a *complement* (pp. 489), and selects its complements. It's also picky about the category of its complements, so we refer to selection as **category selection**, or **c-selection**.
* Once an affix attaches to its complement, the subpart that determines the category is the **head**.
  * `un-` + `lock` (V) -> `unlock` (V)
    * the head is `lock`
  * `black` (A) + `board` (N) -> `blackboard` (N)
    * the head is `board`
* The c-selection of an affix is something that the speaker must acquire about the morpheme
* Sometimes the affix is picky about the bases in other ways called *lexical restrictions*
  * `nation-al`, `ration-al`, `ornament-al`, so the category is noun.
  * `*neighbourhood-al`, `*friend-al`, `*meat-al` is ungrammatical. What's going on?
  * `-al` only attaches to *latinate* (words borrowed from Latin) bases
* The sum of morphological knowledge a speaker has about a morpheme is referred to as the lexical entry of a morpheme
  |form|bound/free|category of morpheme|c-selection|category of result|lexical restrictions|meaning|
  |---|---|---|--|--|--|--|
  |-al|bound (suffix)|(what is it)|N|A|latinate|relating to \<N\>|
  |digit|free|N| | | | DIGIT |

* Linguists commonly use tree diagrams to represent complex word formation.
    ```
        V
       / \
      /   \
     un-   V
           |
         lock
    ``` 
    ```
        N
       / \
      /   \
     V    -er
     |    
    speak
    ``` 
 * These trees are **always binary trees**
    ```
         A
        / \
       /   \
     un-    A
           / \
          /   \
         N   -ate
         |
      fortune  
    ``` 
 * For two nodes \(A\) and \(B\), \(A\) **dominates** \(B\) if and only if \(B\) is a descendant of \(B\).
 * The **head** is always an immediate child/daughter of the root node.
 * An equivalent notation is labeled bracket notation
   `[N [V [ [N digit] -al] -ize] -ation]`
   This can be converted to a tree recursively
 * Trees encode hierarchical structure.
 * There are two meanings in the word "unlockable" 
   *  ```
           A
          / \
         /   \
       un-    A
             / \
            /   \
           V   -able
           |
        lock
      ```  
      "Not Lockable"
      ```
           A
          / \
         /   \
        V   -able
       / \
      un- V
          |
         lock
      ```  
      "Able to be unlocked"
## Deriving complex words
* Locality
  * (C-)selection is *local* in the sense that an item can only select properties of its sisters (siblings)
  * **It is impossible for a suffix to select from a descendant category.**
  * This is impossible: The made up suffix `-astial` can not select a verb made from an adjective.
    ```
          N
         / \
        /   \
       V  -astial
      / \
     A  SUFF
     |
    lock
    ```
* Right-hand head rule
  * This is specifically for English: the head is the rightmost "element"
    * The rightmost element gives its category to its entire root
    * This allows us to infer that affixes have categories