# 2021-10-21 Argument Structure

* Argument structure refers to semantic (theta) roles assigned by words
  * We will talk about the following roles
    * Agent (Ag)
      * The thing that is responsible for doing the action
    * Experiencer (Exp)
      * The thing thatexperiences a mental state
    * Theme (Th)
      * The thing that is moved, changed, described
    * Goal (Go)
      * The thing where an action ends 
    * Benefactor (Ben)
      * The thing for which which anaction was done
    * Location (Loc)
      * The place where the theme is
    * Referent (R)
      * The thing a noun refers to. 
    * Event (Ev)
      * Something that takes place, that happens. 
* We will encode the argument structure of words using nested angle brackets with commas
  * 1 \(\theta\)-role denoted `<Role1>`
  * N \(\theta\)-role denoted `<Role1 <Role 2 , .., Role N>>`
  * For example
    * Intransitive verbs
      * `swim <Agent>` "The fish swam", "\*The fish swam me"
    * Transitive verbs
      * `bit <Agent<Theme>>` "The dog bit me", "\*The dog bit"
    * Optionally transitive verbs
      * `sing <Agent <(Theme)>>` "The soloist sang", "The soloist sang the song"
    * Ditransitives
      * `give <Agent <Theme, Goal>>`
        * "You gave a book to Jody"
        * "\*You gave a book"
        * "\*You gave Jody"
        * "\*You gave"
  * The argument in the outer bracket is the *external argument*
  * The argument in the inner bracket is the *internal argument*
  * Internal arguments are drawn *inside* the VP, whereas external arguments ends up the subject TP.
* External arguments
  * In English the external argument is often the agent if present
  * It is the subject of the simple clause
  * Can usually be identified with a construction like
    * They consider *ext. arg* [pred (to be) (X)]
    * They made *ext. arg* [pred X]
      * If you insert 'me' between that forces interpretation of 'me' as the agent
        * i.e. They made **me** bite the dog cf. The made **the dog** bite me.
* Argument structure of adjectives and nouns
  * Adjectives and nouns can also have argument structure
    * They consider *external argument* [to be (X)]
    * They made *ext. arg* [X]
  * Example
    * They consider **the water** [to be **drinkable**]
    * They consider **me** [to be a fool]
  * The external argument of an adjective is often a theme
    * Some adjectives can have complex argument structure with optional internal arguments
    * Often psychological predicates, and take experiencers as external arguments
    * Example
      * *afraid <Exp <(Theme>>*
        The consider **the children** [(to be) **afraid** (of the dogs)] 
  * The external argument of a noun is a bit harder to define
    * It is "the thing a noun refers to", a *referent* (R)
    * Nouns can have complex argument structures, but internal arguments are always optional
      * Usually introduced by the preposition *of*
      * *picture <R <(Theme)>>*
        They consider **this** [to be **a nice picture** (of the tower)] 
