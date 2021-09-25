# 2021-09-09 Introduction

* What are the goals of semantic theory?
  * We don't want to get our theory tangled with ideas about what meanings are
  * Want to give a representation of an utterance meaning
  * We want a representation of word meaning
    * We want to distinguish the meaning of a word vs. different word
    * Want to distinguish word level with structural meaning
    * Address the meaning of words at an indirect way
  * Compositionality
    * The meaning of an utterance is derived systematically from the meaning of its parts
    * The main goal of such semantic theory
* **Why is compositionality important**
  * We are limited by biological factors
    * Lexicon
    * Memory
    * Processing power
    * Time
    * Computability
  * Despite these finite resources we can process and indefinitely large number of sentences
  * How is it possible for human beings to learn and use knowledge of language to have the productive ability to produce and interpret sentences
  * Knowledge of language is finite and has to be represented in a finite way
  * Can we model meaning as a function of words + syntax?
    * `F :: [Word] -> Syntax -> Context -> Meaning`
    * If we can find such finite `F` we have a theory of semantics
      * Knowledge Representation of Language in Semantics
    * We need language to be able to separate parts of a thought that correspond to parts of a sentence
* Representing syntactic structure
  * Consider the sentence [S [NP Chris [PredP [is happy]]]]
  * We want to describe some F that given the above sentence gives us an interpretation of the sentence
  * We want to describe F in a way that results in well formed output for whatever valid input
  * What are the properties of these inputs?
    * We want our function to give a compositional result
    * `F :: [Word] -> Syntax -> Meaning = F w s = map F w s `
    * For example with `Chris is happy`, we want `F(Chris is happy)` to be related in some way to `F(Chris) $ F(is happy)`
  * What is the representation of the output interpretation for the words and sentences?
  * What is the principles of composition? (dots in slides, here I use applicative infix `$`) 
* **Representation of interpretation of sentence**
  * For some input sentence, we give a set of truth conditions `T :: [(Sentence, Predicate a)] -> Bool`
  * We represent this as T-sentences: *S is true iff P*
    * We take S in object language (the language for which we develop a theory) and say that it is true if the conditions hold.
    * The conditions are expressed in a meta-language (the language where we express the theory of interpretation)
    * The object and meta-language can be different or the same
    * For example, `"Snow is white" iff snow is white`
      * Why is this a good interpretation of the sentence "Snow is white"?
        * We haven't really said anything yet!
      * Note the quotation marks, which are needed for a T-sentence
  * `F :: Sentence = True iff [Predicate]`
  * For every syntactically valid sentence, we map the sentence to a truth value iff some conditions
* Davidsonian Semantics
  * Why do we care about uninformative sentences like `"Chris is happy" iff Chris is happy`
  * If we have competence in the meta language, then the theory has succeeded
  * If we have a T-sentence like `"Chris is happy" iff snow is white` we know something went wrong somewhere (assuming competence in the meta-language)
  * These T-sentences are meant to be a check that we have specified the right object as an input to the interpretation function.
  * Note that is the iff that maps the structure of the input sentence to the T-sentences in meta language 
  * Theory does not reveal anything new about the conditions under which the sentence is true
  * It does not make the truth conditions clearer
  * The work of the theory is to relate the known truth conditions ("words") if the sentence that recur in other sentences, and can be assigned identical roles in other sentences
  * Insight is not in ascribing a meaning of a sentence, but the ability to derive the meaning of a sentence from the meaning of its parts
  * Reduce interpretation to the concept of truth
* Philosophical foundations
  * Davidson takes the semantic value of a word as its extension    
    * e.g. `F("Chris") = Chris` the interpretation of the string "Chris" is Chris the individual
      * The meaning of 'Chris' is whatever it is, but someone who interprets "Chris" correctly should be able to determine that it refers to the individual Chris
  * The semantic values of words being extension anchors language in the world
  * Identifying the referent in a referential sentence can be assessed by working with competent speakers of the language
  * Then the sementic value of predicate expressions is the set of elements that is happy (the extension of 'happy')
    * `F(is happy) = f(happy) ` {x : x is happy}`
  * How can we use such semantic values in our theory?
    * Input: X
    * Ouput: True iff x in { x : x is happy }
    * For example we have some characteristic function X_Happy :: e -> Bool
      * Trueif e is in the set of happy people, false otherwise
    * We then transform the input sentence
      * From "Chris" to Chris
      * "is Happy" to X_Happy
      * Then the root node is an application of the characteristic function X_Happy to the denotation Chris, which is true iff chris is happy 
    * Direct Interpretation
      * Think of the semantic value of "Chris" and "is happy" as the charactertistic function of a set
      * We don't just have the semantic value of the parts of sentences, but we also have a sense of how the combine
      * The combinatorial 'glue' of compositionality is functional application
      * Note that the denotation of "Chris" is not the representational language but instead are statements in the meta language
      * Then `F("Chris is happy") = F("happy") $ F("Chris")`
    * Indirect interpretation
      * We can also translate the elements of the sentence to a formal representation
        * "Chris" -> `c`
        * "is happy" -> `lambda x. HAPPY(x)`
      * Then we generate expressions of the sort `HAPPY(c)`
      * Then we interpret the expression: `F $ HAPPY(c)`
* Limits of extensional semantics
  * Consider the sentence "The morning star is the evening star"
    * This is clearly informative if you didn't know both referential clauses refer to Venus
    * If this is purely extensional we get T iff F("MS") = F("ES")
    * Then consider F("The morning star is the morning star") = T iff F("MS") = F("MS"), which is extensionally equivalent, but this is a trivial tautology
    * We need to consider the intensions behind the meaning
      * The intension of "the morning star" is the way to present the referent, or a rule that allows us to find the extension (not the extension itself)
      * Extended to sentences, the extension of the sentence is the truth value but the intension is the thought (the predicates/proposition)
    * A full theory of semantics can not be limited to extensional semantics