# 2021-03-16 Quantifiers

* Scope ambiguities
  * someone loves everyone
    * there is someone that loves everyone else
      * exists x. PERSON(x) & forall y. PERSON(y) -> LOVE(x, y)
    * for everyone there is someone that loves them
      * forall y. PERSON(y) -> exists x. PERSON(x) & LOVES(x, y)
    * notice that the first implies the second, but not the other way around
* scope can be made precise
  * forall x\[f\]
    * f is in the scope of forall x
  * exists y \[g\]
    * g is in the scope of exists y
  * can be useful to paraphase translations in english
    * "Every child read a book"
    * quantifiers in english don't like to take scope outside of the clause
* consider a sentence like "Every child read some book"
  * We have two interpretations
    * forall x. CHILD(x) -> exists y. BOOK(y) & READ(x, y)
    * exists y. BOOK(y) & forall x. CHILD(x) -> READ(x, y)
  * subject c-commands object, but in the second interpretation, the scope is inversed
    * first interpretation has quantifiers in **surface scope**
    * second interpretation has quantifiers in **inverse scope**
  * a relation between a sentence and its interpretation, not of the quantifiers itself
  * 