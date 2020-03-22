# Semantics
> **def'n** *Semantics*
> The study of the *linguistic* aspects of the meaning of expressions.

We limit the notion of 'meaning' to 'linguistic' meaning: in everyday parlance 'meaning' includes world knowledge.

For example

* (1) A banana is a berry

(1) is false if our notion of a berry is not a technical definition; but in technical botanical terms a banana is a berry.

* (2) A banana is a good breakfast

(2) depends on one's preference of bananas

* (3) The banana is on the table

This can only be answered by people with observation of the table.

Consider

* (4) Iorek is a big bear
* (5) Iorek is a bear

Regardless of world knowledge, we have that if 4 is true, then 5 must also be true \(4 \implies 5\) (more correctly), \(4 \models 5\)

Knowledge of grammar includes the ability to identify semantic relations between sentences; **compositionality** is one answer to how this is achieved.

> **def'n** *compositionality*
> The principle that meaningful expressions in language are built up by other meaningful expressions in a way determined by the structure of the sentence

* We need meanings for the atoms of a language
* how complex expressions are built from the meanings of their parts
  
This is how speakers of a grammar can assign meanings to an infinite set of expressions

This is explored using **extensional semantics**

> **def'n** extensional semantics
> Meaning is understood in terms of the extension of an expression; the set of 'things' it applies to in some **universe**

Consider the universe \(U = \{\text{Lyra, Will, Roger,  Iorek}\}\)

The expression 'Lyra' wrt this universe is the individual named by the name Lyra. We use double brackets to indicate that we are interested in picking out the extension of this expression in a universe, i.e. \(\llbracket\text{Lyra}\rrbracket\).

We can also understand the list of entities picked out by an expression as a set. *We can view expressions as a sort of inverse choice function that maps a string to a subset of \(U\)*. The subset \(U' \subseteq U\) picked out by an expression \(E\) is the called the *extension*.

* \(\llbracket\text{Lyra}\rrbracket\) = \(\{\text{Lyra}\}\)
* \(\llbracket\text{Will}\rrbracket\)= \(\{\text{Will}\}\)
* \(\llbracket\text{Iorek}\rrbracket\)= \(\{\text{Will}\}\)
* \(\llbracket\text{human}\rrbracket\)= \(\{\text{Lyra, Will, Roger}\}\)
* \(\llbracket\text{bear}\rrbracket\)= \(\{\text{Iorek}\}\)
* \(\llbracket\text{boy}\rrbracket\)= \(\{\text{Will, Roger}\}\)

We can express more complex meanings. Consider `[TP [DP Lyra] [T' [T] [VP [V slept]]]]` 'Lyra slept' mean? We can model VP as an extension. If Lyra and Will are sleeping, Iorek and Roger are not, then

* \(\llbracket\text{slept}\rrbracket\)= \(\{\text{Lyra, Will}\}\)

Then what is the extensional meaning of 'Lyra slept'? This is the truth value of the relation between two subsets of \(U\).

Consider:
* \(\llbracket\text{Lyra}\rrbracket\) = \(\{\text{Lyra}\}\)
* \(\llbracket\text{slept}\rrbracket\)= \(\{\text{Lyra, Will}\}\)

A sentence is true if the extension of the subject is a subset of the predicate. That is we have \(\text{Lyra slept} \iff \llbracket\text{Lyra}\rrbracket \subseteq \llbracket\text{slept}\rrbracket\). Following the same logic, we have \(\text{Iorek slept} \iff \llbracket\text{Iorek}\rrbracket \subseteq \llbracket\text{slept}\rrbracket\) which is false.

Consider 
* (9) Iorek is a big bear
* (10) Iorek is a bear
  
'Big bear' is the intersection of entities selected by 'Big' an 'Bear'
* \(\llbracket\text{Big bear}\rrbracket = \llbracket\text{Big}\rrbracket \cap \llbracket\text{bear}\rrbracket\)

Then, the truth value of 'Iorek is a big bear' is simply the truth value of \(\llbracket\text{Iorek}\rrbracket \subseteq \llbracket\text{Big bear}\rrbracket\)

Note that this definition guarantees that \(\llbracket\text{Iorek}\rrbracket \subseteq \llbracket\text{Big bear}\rrbracket \models \llbracket\text{Iorek}\rrbracket \subseteq \llbracket\text{bear}\rrbracket\).

This is called entailment.
* \(s1\) *entails* \(s2\) in an universe iff \(s1\) is true, then \(s2\) is true.

We can also have mutual entailment, as opposed to asymmetic entailment.

* (11) Lyra heard Iorek
* (12) Iorek was heard by Lyra
  
It can easily be seen that \(11 \models 12 \wedge 12 \models 11\). This is called paraphrase. We can also have mutual entailment through synonymy

* (13) Franny gave Hassan a **gift**
* (14) Franny gave Hassan a **present**

We can have *contradictions* \(\bot\) through *negation* or *antonymy*

Negation:

* Liza is a cat.
* Liza is not a cat.

Antonymy
* The store is closed
* The store is open

Sentences can be internally contradictory.

* A hedgehog is not a hedgehog.

Internally contradictory sentences entail everything vacuously. Since \(s1 \models s2\) means that if \(s1\) is true, then \(s2\) must also be true; an internal contradictory sentence is always false, which says nothing about \(s2\). \(\forall s. \bot \models s\). Alternatively, since \(\bot\) is false in all situations, all sentences are vacuously entailed.

A tautology (e.g. People are people) is entailed by every true sentence. \(s \implies s \models \top\). Alternatively, there are no situations where \(\top\) can be false.


**Assertions** are speech acts that claim some proposition is true.

* (a) Franny likes pancakes
* (b) Franny regrets liking pancakes

30 asserts that 'Franny likes pancakes' is true. In 31, Franny's liking of pancakes is **presupposed**. How can we tell?

* The truth of assertions are cancelled are cancelled by negations
* (c) Franny does not like pancakes
* (d) Franny does not regret liking pancakes.

\(a\) 'cancels out' \(c\). Modelled as entailment, \(a \not \models c\).

However, \(d \models a\) and \(c \models a\). The truth value of \(a\) is not changed.

Many verbs known as 'factive' verbs presuppose a complement, such as 'regret', 'know', 'be sorry', 'realized'. The presupposition they introduce is not cancelled under negation.

Not all verbs that introduce complement clauses are factive. For example, 'believe' and 'consider'.

Consider:

a. Hassan was late.
b. Franny believes Hassan was late
c. Franny does not believe Hassan was late.

Note that \(b \not \models a\) and \(c \not \models a\).