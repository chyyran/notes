# 2021-10-21 Derivational Concatenation

* When we concatenate morphemes we're also able to change argument structure
* We are treating argument structure as this complex feature and need to incorporate such features into our WSTs.
* Argument feature can be inherited following NLC/PC
  * Consider the pair *dark* (A) / *darkness*
    * I consider the **sky** to be **dark** (A) <Th>
    * I consider **that** to be **darkness** (N) <R>
    * \*I consider the sky to be **darkness** (N) <Th>
  * We assume that affixes can have argument structure in their lexical entry
  * This is well behaved with PC, consider featureless affix *re-*
  * argument structure is also well behaved wrt HR
    * `bridge <R, <Loc/Go>>` / `drawbridge <R, <Loc/Go>>`
* Sometimes the argument structure is a function of its components
  * This process is systematic
  * Substitution linking
    * The argument structure of the whole is the same of the AS of the base plus some other argument
    * Consider *flat <Th>*
      * **The metal** is flat 
      * I *flattened* **the metal**
        * Theme is no longer the external argument, it is an internal
        * *-en* suggest NLC has applied, where was Ag introduced?
    * **def'n** Substitution linking
      The argument structure of a non-head **replaces** an argument of the affix. The argument structure of the word are said to be *linked*.
    * *-en* has structure `<Ag <Ev>>`, and Ev is replaced by the argument of the non-head
    * **sisterhood condition**: this operation holds only between **sisters**
* Synthetic compounds
  * Consider synethetic compounds with deverbal *-ing* nouns
    * Start with some non-derived transitive verbs `<Ag <Th>>`
      * **The lions**`<Ag>` eat *meat*`<Th>`
    * Nominalizing with *-ing* changes category to N, and introduces `<R>` external argument
      * It also inherits arguments of its base by substitution linking
        * I consider *our biggest problem*`<R>` [to be the eating of *meat*`<Th>` by **lions**`<Ag>`]
          * Notice agent being expressed using by-phrases
    * Consider N-N compounds by deverbal *-ing* nouns
      * *One issue*`<R>` is *meat-*`<Th>`eating (by **lions**`<Ag>`)
      * The first noun is clearly being interpreted `<Th>` of the deverbal *-ing* noun.
      * Unlike other examples we have seen where the thematic role is satisfied outside of the head word, the theme here is internal to the derived word
      * Internal structure is created with. In this case we have *-ing* with structure `N <R <Ev>>`
        * *-ing* gets its argument from the V
* **Argument identification**
  * The left-hand member of the compound satisfies a thematic role of the head noun
  * We use **argument identification** to capture this generalization
    * Write a superscript letter (e.g. i) to the right of the label of the node which is identified with an argument of its sister, and a matching superscript to the right of the Thematic Role it satisfies. 
    * Applies to **sisters** only
  * We identify the non-head node with an argument of its sister.
* **Saturation principle**
  * If an argument of the head is identified with the non-head via argument identification, then that argument is not passed on to the larger word.
