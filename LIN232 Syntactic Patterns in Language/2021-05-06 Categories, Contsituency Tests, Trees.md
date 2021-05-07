# 2021-05-06

## Ontology of categories
  * N (Nouns) dog, fish, expectation
  * D (Determiners) the, a, some, few
  * V (Verbs) run, walk, sing, wish
  * T (Tense) to, can, may, could, must, will, have, be, is (copulas)
  * Adj (Adjective) red, tall, happy
  * Adv (Adverb) intentionally, quickly, loudly
  * P (Preposition) in, on, at
  * Deg (Degrees) very, really
    * subcategories of determiners
    * good diagnostics for adverbs or adjectives (very quickly, really happy, too tall)
  * PQual (Preposition qualifiers) just, right, straight
  * Conj (Conjunctions) and, or, but
  * C (Complementizers) that, if, for, whether
    * Introduces embedded sentences
  * Neg (Negation) not

## Diagonostics in English

These rules are some basic rules that will work as a rule of thumb. There will be exceptions.

**Noun**
| Syntactic | Morphological |
| --------- | ------------- |
| D _ V     | __ -s (PL)    |
| Adj _ V   | __ -ship      |

**Verb**
| Syntactic        | Morphological  |
| ---------------- | -------------- |
| wants/seems to _ | __ -s (3S Agr) |
|                  | __ -able       |
|                  | __ -ing        |

**Determiners**
| Syntactic | Morphological |
| --------- | ------------- |
| _ N       |               |

In English, D precedes all elements in the NP. Typically there is only one D per N, but there can be many adjectives preceeding an N.


**Adjective**
| Syntactic | Morphological |
| --------- | ------------- |
| D _ N     | __ -ness      |
| very _    | __ -ly        |
| as _ as   | un-__         |
|           | __-er         |
|           | __-est        |

Combine with N usually preceding, but sometimes following (i.e. "the visible stars visible")

**Adverb**
| Syntactic | Morphological |
| --------- | ------------- |
| _ Adv     |               |
| _ Adj     |               |
| _ V       |               |
| _ P       |               |
| very _    |               |
| as _ as   |               |

**Preposition**
| Syntactic | Morphological |
| --------- | ------------- |
| V _ NP    |               |
| PQual _   |               |

Ps introduce NP. PQual = Prep qualifier (just, right, straight)

## Subcategories

The distribution of some categories is sensitive to finer distinctions

* Count/mass
  * Many butterflies / *butterfly
    *Much butterflies / butterfly
  * *Many sand / sands
     Much sand
  * This distinction is called count vs mass nouns.
    * count nouns have atoms (individuals) 
    * mass nouns are amourphous where the atoms are too small tobe easily counted 
    
* Verb subcategories
  * Intransitive (1-ary)
    * They *sat/arrived/slept*
  * Transitive (2-ary)
    * They *devoured* the cookie / They *pet* the dog
  * Ditransitive (3-ary)
    * They *gave* a present to me. They *sent* me a present
  * Some verbs are both intransitive and transitive
    * George *ate*
    * George *ate* dumplings
* Caveats
  * Consider the following sentences, what category is *out*?
    * Gregor stumbled out
    * Gregor stumbled clumsily
  * Distributionally this suggests Adv
  * Just because something modifies a VP doesn't mean its an adverb
    * Gregor stumbled [_PP out the door]
    * Gregor stumbled [_NP the next day]
  * We **must** use more than one test

## Phrases and Constitutents

* Whole strings of words can have the same distribution as single worlds
  a.
    * [The large amourphos sculpture in Chicago] is called "Cloud Gate"
    * [It ] is called "Cloud Gate"
  b.
    * My friend wants to [take a yellow bird with her everywhere]
    * My friend wants to [do so]
  * This is called substitution
* Constituents must be phrases
* Endocentricity
  * Every phrase must have one obligatory word (the **head**)
  * The phrase is named after the head.
  * Consider example a. It is an N, so we can say that [The large amourphos sculpture in Chicago] is an NP.

## Constituency tests
* substituion tests
  * examples
    * do-so
    * it
  * procedure
    * Take a string of adjacent words
    * Replace with one (preferably mono-morphemic) word
    * Replace with a word similar in meaning (keeping the meaning of the sentence the same)
    * Keep everything else the same
    * If the resulting string is grammtical, then the original string forms a constituent
    * If the substitution is not grammatical, we **can't conclude anything**
  * NP-Pronoun replacement
    * the best replacement for an NP is a pronoun
    * it, they, he, she, there, here
  * Be careful with changing the meaning
    * example
      * I considered [the man in trouble]
      * I considered [him]
    * The thing being considered in the first example is that something was in trouble who was the man
  * Locational PP can be subtituted by there and here
  * AdjP needs to be first put in predicate position, and replaced with so
    * My extremely smart friend just loves yellow birds
    * My friend is [extremely smart]
    * My friend is [so]
  * VP uses do-so substitution
* Standalone test
  * Imagine a dialogue
    * My friend who likes yellow birds is in hawaii?
    * Q: Who is in hawaii
    * A: My friend who likes yellow birds
* Movement tests
  * NP preposing/topicalisation
    * I really respect [my friend who likes yellow birds]
    * [My friend who likes yellow birds], I really respect
  * Pseudoclefting
    * I really respect [my friend who likes yellow birds]
    * **Who** I really respect **is** [my friend who likes yellow birds]
  * Full clefting
    * I really respect [my friend who likes yellow birds]
    * It is [my friend who likes birds] who I really respect __
    * Watch out to not change the meaning
      * It is [my friend who I really respect] [__ who likes yellow birds]
* Coordination
  * most difficult to interpret
  * adding a second conjunct of the same type as the string in question, if it works, it *might* be a constituent
  * example
    * I volunteered [my advice]
      * I volunteered [my advice] and [my time]
    * I volunteered [for the shelter]
      * I volunteered [for the shelter] and [for that organization]
  * unlikes can not be coodinated
    * *I volunteered [my advice] and [for the shelter]
  * Be careful with elision
    * I will give *my students advice* and *the administration hell*
    * *It is [my students advice] that I will give
    * There is actually a gap because of elision of an identitcal verb
      * I will [_VP give my students advice] and [_VP __ the admin hell]
* **do multiple tests, a single test can not show something is a constituent**
## English Phrase Structure Rules
* CP -> (C) TP
* TP -> {NP/CP} (T) VP
* AdvP -> (AdvP) Adv
* XP -> XP conj XP
* NP -> (Det) (Adj+) N (PP+) (CP)
  * Notice that the N is obligatory
* PP -> P (NP)
* AdjP -> (AdvP) Adj
* VP -> (AdvP+) V (NP) ({NP/CP}) (AdvP+) (PP+) (AdvP+)
## Trees 
* Remember from 102 that all sentences start as TP
* Tips
  * Identify heads and label them
  * Bracket all single-word phrases
  * Bracket constituents starting with the smallest (least) words
  * Follow PSRs to decide what belongs ine ach phrase
  * Label bracketed constituents
  * Bracket VP after you decide NP and AP location
  * Create pairs of bracketed sisters starting from head and sisters
    * We will use binary branching (except coordination)
  * Draw upward first and plan how many levels you need
  * Empty nodes only allowed if they have a phrasal sister

### Examples

**Frank seems happy**
[_TP [_NP [_N Frank] [_VP [_V seems] [_AdjP [_Adj happy]]]]]

```
    TP
   /  \
  NP     VP
  |     /  \
  N     V  AP
  |     |   |
Frank seems Adj
             |
            happy
```

**My friend wants a yellow bird**
[_TP [_NP [D My]] [_VP [_V wants] [_NP [_D a] [AdjP [_Adj yellow]] [_N bird]]]] ]

```
         TP
        /  \ 
       /    \
      /      \
     NP      VP
    / \      / \
   D  N     V   \
   |  |     |    \
 My friend   wants \     
                    NP
                  /   \
                 D     \
                 |   /  \
                 |  AP   N
                 a   |   |
                    Adj bird
                     |
                    yellow
``` 

**My friend wants to take a yellow bird with her everywhere**

```
        TP
       /  \
     NP    \
    /  \    \
   D    N    \
   |    |     \
   My friend  VP
             /  \
            V    \
            |     \
          wants   TP
                 /  \
                T    \
                |     \
                to    VP
                     /  \
                    / \  \
                   /   \  \
                  /\    \  \
                V   \    \  \
                |    \    \  PP
            take     NP    \  |
                      |     \ everywhere
                      |     PP  
                      |     / \
                      |   with her
                  a yellow bird
```