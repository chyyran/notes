# 2020-02-04 Sentence Processing

Most trees have this basic structure.
```
  CP
 /  \
C   TP
   /  \
  XP  T'
     / \
    T   VP
```

A 'mini-grammar' is a hypothesis of the way we think a native speaker is using the language.

> **def'n** parser
> A parser is the procedure for assigning a structure to the string/determines how words in sentences relate to each other.

> **def'n** syntactic parsing
> mental process that takes sequences of words and assigns hierachy

**def'n** psycholinguistics
> study of the psychological and neurobiological factors involved in the perception, production and acquisition of language.

> **def'n** formal syntax
> data is the syntactic patterns and grammaticality judgments. Goal is the develop abstract grammatical models that will generate all and only grammatical structure

> **def'n** sentence processing
> data is experimentally controlled measures of observable human behaviour (eg. reading times), and brain patterns. 

## How do we deal with ambiguous structure?
> Time flies like an arrow. Fruit flies like a banana.

* Ambiguous structures imposes a processing cost.
  * Longer reading times
  * Lower comprehension accuracy
  * Different patterns of brain activity

> **def'n** Global ambiguity
> A sentence can be assigned more than one structure and corresponding interpretation.
> **def'n** Local ambiguity
> A sentence is ambiguous up to a point but then it is disambiguated.

ex. While Frank was dressing the baby played on the floor
This has the meaning "While frank was dressing himself, the baby played on the floor". However, we elided "himself", and it violates subcategorization, which takes one DP. 

We can't maintain the ambiguity. It's resolved before the end of the sentence.

What do speakers do when parsing these sentences?

Consider how we parse `While Frank was dressing the baby played on the floor`

`[TP [CP While Frank was dressing] [TP [DP the baby] [T' [T +tense] [VP played on the floor]]]]`

Psycholinguistics measure processing load, and make inferences. For example, reading time is longer when processing load is higher. 

Listeners make parsing decisions before they have enough info. It is incremental, word by word.

Which structure is it building? Making structural choices is not hard, but which structure are we actually building?

When people have a choice of different structures, sometimes they are wrong.

> While Frank was dressing the baby **played**
People slow down at **played**, at the ambiguous sentence.

One structure is `[VP [V dressed] [DP the baby]]`, and the other is `[VP [DP the baby] [VP played on the floor]]`.

We are accepting the first structure, until we get to the problem of `played` not having a subject!

This is telling us something about the design of the parser. These types of sentences are called "garden path" sentences. 

## Two-stage model
Syntactic paring takes place in two processing stages:

```
Input -> [Lexical processor] -> Categories -> [Syntactic parser] -> Syntactic structure -> [Thematic interpreter] -> Semantic meaning.
```

* Incoming sequence of words is analyzed to determine what categories the words belong to. No other information is used in the initial structure building process.
* Sentence interpretation: meaning is computer by applying semantic rules to the structured input.
* Strict view of what can influence structure building: ONLY the sequence of categories.
* Classic garden path theory proposes two heuristics
  * Late closure
    * Do not postulate unnecessary structure
    * If possible continue to work on the same structure for as long as possible (p. 657).
      * Stop usually at a subcategorization error
  * Minimal attachment.
    * When more than one structure is possible, build the one with the fewest nodes. (p.657)

## One-stage constraint based model
One-stage models where multiple structures are said to be considered simultaneously with a wide range of factors influencing the parser's choice.