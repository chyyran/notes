# 2021-03-09 Quantifiers

* forall, exists
* generalized quantifiers: relations between sets
  * every cat is happy: \(Cat \subseteq Happy\)

* two quantifiers
  * forall: universal quantifier
  * exists: existential quantifier
  * \(\forall x [LINGUIST(x)]\)
    * Every x is a linguist
    * Every entity in our universe is a linguist
    * true in a model M iff every entity in U of M is a linguist
  * \(\exists x [LINGUIST(x)]\)
    * There is an x that is a linguist
    * There is one entity in our universe that is a linguist
    * true in a model M iff at least one entity in the universe U of M is a linguist
* Entity vs individuals
  * someone vs something
* variables do not refer, do not denote an individual
* \(\forall x [LINGUIST(x)] & \exists x [CHEMIST(x)]\)
  * does this capture "everyone is a linguist and one of them is a chemist"
  * it does capture the entailment, but that is not a good translation semantically
* quantifiers tell us to consider possible values for variables
* Some P **is** Q == at least one P **is** Q
* Some Ps **are ** Q
  * involves conversational implicatures, more complicated
* \(\forall x \exists y [LOVE(x, y)]\)
  * for every x there is a y such that x loves y
  * everyone loves someone else
* \(\exists y \forall x [LOVE(x, y)]\)
  * there is someone that everyone loves
* english sentence with quantifiers have 2 parts
  * restriction
    * NP that is determined by the quantifier
    * quantifiers in english are determiners
    * "[_DP Every [_NP chemist]] is happy"
  * nuclear scope
    * the rest
  * two parts must appear in the predicate logic
* "John met every student"
  * the quantifier phrase is an object
  * restriction; student
  * nuclear scope: John met
  * \(\forall x. MET(j, x)\)

* existential informal guidelines (active voice)
  * subj pos
    * translate predicate and use variable as first arg
    * translate restriction and use same var
    * cojoin two formulae with &
    * put existential quantifier in front of formula
    * "Some student is happy"
      * \(\exists x [STUDENT(x) & HAPPY(x)]\)
    * "A policeman arrested Pia"
      * \(\exists x [POLICEMAN(x) & ARREST(x, p)]\)
  * obj pos
    * translate predicate and use variable as **second arg**
    * translate restriction
    * cojoin formulae
    * put quantifier
    * "Conan interviewed some politician"
    * \(\exists x [POLITICIAN(x) & INTERVIEW(c, x)]\)
* universal informal guidelines (active voice)
  * subj pos
    * translate predicate and use variable as first arg
    * translate restriction and use same var
    * cojoin two formulae with ->
    * put existential quantifier in front of formula
      * this is because of **english**
    * "Every student is happy"
      * \(\exists x [STUDENT(x) \implies HAPPY(x)]\)

* Negation 
  * "no student complained"
    * \(\neg \exists x. STUDENT(x) & COMPLAIN(x)\)
    * \(\forall x. STUDENT(x) \implies \neg COMPLAIN(x)\)
  * "not every student complained"
    * \(\neg \forall x. STUDENT(x) \implies COMPLAIN(x)\)
    * \(\exists x. STUDENT(x) & \neg COMPLAIN(x)\)
* Generalized quantifiers
  * [[Every cat is cute]]^M = T iff [[cat]]^M \(\subseteq\) [[cute]]^M
  * \(\llbracket \text{Every cat is cute}\rrbracket^M \ T \iff \)
  * [[some cat is cute]] iff [[cat]]^M cap [[cute]]^M != emptyset