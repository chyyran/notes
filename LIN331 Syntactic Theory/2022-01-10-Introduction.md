# 2022-01-10 Introduction

* Review
  * Syntactic patterns are not memorized
    * speakers don't memorize a list of possible sentences
  * speakers have knowledge of patterns they havent seen before
    * can assign interpretation
    * can judge acceptability
    * can use syntax creatively
  * how are infants able to acquire systems that have this property?
* How do we know what we know about novel sentences?
  * Consider: Imagine you were a whale and you were breaking up with your whale girlfriend and humans recorded it and put it on spotify to fall asleep to
  * We can take fragments and make it into an interrogative
    1. Imagine you were a whale
    2. What did you imagine you were?
  * We can't apply the same pattern to all cases
    1. Imagine you were a whale and you were breaking up with your whale girlfriend
    2. \*What did you imaine you were and you were breaking up with your whale girlfriend?
       * We know the ungrammaticality of this sentences without having memorized it
* How is this possible?
  * Knowledge of novel sentences can be understood in terms of generalized cognitive abilities like analogy
    * This is not suifficiently explanatory.
  * Analogies can be dysfunctional
    1. An elephant sat on the table <-> The table was sat on by an elephant
      * A lamp sat on the table <-> \*The table was sat on by a lamp
    2. Salima seemed to speak French <-> It seemed that Salima spoke French
      * Salima hoped to speak French <-> \*It hoped that Salima spoke French
        * There is a reading where this can be grammatical if 'it' is not taken to be an expletive (i.e. it's raining). 
        * With the same intension as in (2) it is ungrammatical
    3. Felix promised Salima to take better care of himself <-> \*Felix promised Salima to take better care of herself
        * The coindexing in the transposed sentence is between Salima and the anaphor and the example becomes ungrammatical
    4. Felix persuaded Salima to take better care of herself <-> \*Felix persuaded Salima to take better care of himself
       * We have obligatory coindexation here with Salima and the anaphor 
  * We have complex patterns here but the restrictions on coindexation go different ways while only the verb differs
  * Consider the following examples where analogy would not make the correct predictions
    1. I want someone to talk.
      * Someone else is doing the talking 
    2. I want someone to talk to.
      * I am doing the talking 
    3. I want someone to talk to me. 
      * Someone else is doing the talking

* How do we know these facts?
  * Why do we not make analogies that would result in the wrong grammar?
  * How do we avoid the wrong grammar in acquisition?
* Grammar is a cognitive system
  * The rules of grammar must be abstract because they underlie all natural languages, not specific languages
    * Must be abstract enough that they hold for all natural languages
  * We don't speak in just abstractness
  * **tension** between fundamental similarities in different languages and empirical crosslinguistic variation 
  * there is important uniformity as well as variation across natural languages
  * some evidence that ordering of adverbs (meaningwise) is invariant across languages
    * adverbs don't all hang in the same places
    * for example, `[[always]] > [[completely]]`, or `[[no longer]] > [[always]]`
  * variation
    * Null subjects!
      * some languages like English require that languages must have a subject
        * John / \* NULL saw that film
        * Juan / NULL vio esa pelicula
      * multiple Wh-questions
        * in English, Wh-words are fronted
          * if there are 2, only the first one fronts, i.e. 'What did he give to whom'
        * in Chinese, the Wh-pronoun stays to the right of the verb
          * if there are 2, both Wh-words do not front.
        * In bulgarian, the pronoun fronts.
          * if there are 2, both Wh-words front
  * Whatever grammar is, it must be flexible and abstract enough to accomodate all this variation

## Principles and Parameters
* Developed by Chomsky 
* A grammar consists of two kinds of 'rules'
  * Principles (account for uniformity)
    * uniformly true and hold in all languages
  * Parameters (account for variation)
    * choice point where languages can diverge in terms of the implementation
    * In its original incarnation, a parameter was thought of as a menu item or binary switch
      * ex. subjects can be null
      * not really the view now..
      * choice of a menu of features or functional elements that are used to build a syntax

## Overview of Syntax History
### Extended Standard Theory
* Early architecture of syntax
  ```
  Base ----> [PSRs, Lexicon]
                  |
                  v
            [Deep Structure] ---> semantic representation
                  |
                  v
            [transformational component]
                  |
                  v
            [Surface structure]
                  |
                  v
            [phonology module]
  ```
  * PSRs looked like CFG rules; for every kind of phrase it spelled out exactly its components
    * eg. NP -> (Det) (AP+) N (PP)
    * not a whole lot of generalization (word order)
  * Deep structure is an initial syntactic representation using PSR and lexicons to form a tree
    * not the final representation
  * Transformational component had very specific rules that would relate phrases to another
    * input: numbered scheme like `1 2 3 4 5` as indices into the deep structure and reorder it to `3 1 2 4 5` for example to produce surface structure
    * importantly its specific to the rule and input
    * opaque to morphological aspects
    * need very long, idiosyncratic rule lists

### Government and Binding Theory (G&B)
```
                                 Phonological form
                                 /
[D-Structure] -> [S-Structure]--<
                                 \
                                 Logical form
```
* D-struture and S-structure are more abstract
* In earlier models, semantic representation was tied to D-structure
  * meaning can depend on transformations and surface structure
* still an idea of 2 levels of representation
* in G&B, PSRs don't have the very specific form but are abstracted over X'-theory
  * structure of phrase is not given by category but is instead by their positions in syntax (eg. Adjuncts, Specifiers, Complements, etc.)
  * how do we model in a restrictive way what can be in the structure?
* abstracted from detailed patterns, abstract modules that used to be baked into PSRs
  * theta-theory (theta-roles) that would restrict D-structure
    * well-formed D-structure has to satisfy theta roles of the matrix
  * C-selection
    * verbs select NPs or PPs
* We still had a transformational component, but instead of index shuffling, there was a notion of \(\text{Move}(\alpha)\)
  * when you get to the S-structure, there are restrictions on where things can be
    * case filter module that says for certain XPs they must be in certain positions to receive case
* this is a pretty big shift from EST even though there are commonalities

## Minimalism
* Still within P&P
* We get rid of the idea of PSRs generating early representations
* We don't start with the complete projection of PSRs to tree
* Abstract "numeration" of items that will be put together
* Example
  * Franny saw Fred -> ["Franny", "saw", "Fred"]
    * There is no PSR that generates the tree
    * We iterate with \(\text{Merge}\) that puts items in the numeration until it is empty
      * {Franny, {Saw, Fred}}
* Then once numeration is emptied, it is spelled-out and split into PF and LF.
* Syntax is so pared down and has forced a rethinking of what the restrictions are on possible combinations
* Still must be case, theta, etc. theories
  * degree of abstractness and derivation and plays out in order of operations
  * no a priori D-structure 