# 2021-03-02 Predicate logic

* predicate logic 
* need to move beyond propositional logic
* meaning below the level of sentence

* What we missed in propositional logic
  * argument structure
    * Gertrude likes Maria vs Maria likes Gertrude
    * this argument is valid in propositional, but how do we differ between this semantically?
    * we want a logic that is able to capture this structure
  * Quantification
    * Every human is mortal vs Some humans are mortal
  * how common structure affects general logic of reasoning
  * valid argument with quantifiers
    * Every human is mortal
    * Socrates is human
    * therefore, socrates is mortal
  * invalid arguments
    * some humans are mortal
    * socrates is human
    * therefore socrates is mortal
  * regardless of the items, we want to be able to to validate the argument
  * validity relies on the shape (argument relies on transitivity of 'in')
    * Kingston is in Ontario
    * Ontario is in Canada
    * Therefore, Kingston is in Canada
* compositional semantics
  * meaning of sentences is calculated by the meaning of its constituent parts
* consider 'Kelly wrestles.'
  * intransitive verb
  * verb is the predicate, subject is the argument
  * WRESTLE(k)
  * convention is predicates are in allcaps
  * Kelly knows Henry
    * KNOW(k, h)
    * active voice subject first, and the active voice object second
  * proper names using individual constants
* predicate arities
* predicative nouns and adjectives (copular) are translated as unary predicates
  * Marilyn is a chemist
    * CHEMIST(m)
  * Marilyn is Irish
    * IRISH(m)
* translation
  * for simple **active** sentences without quantifiers
  * no pronouns
    * verb/nominmal/adjectival predicate as the predicate
    * proper names as constants
    * subject as arg1
    * object as arg2
  * for **passive sentences**
    * same principles, reverse arguments
    * Joana kicked Ana
      * KICK(joana, ana)
    * Pia helped Jess
      * HELP(pia, jess)
    * Jess was helped by Pia
      * HELP(pia, jess)
  * when NP is introduced by a PP, it is an argument of the verb, but we ignore the PP
    * Marcus talked to Alexandra
      * TALK(m, a)
    * ALexandra introduced Tara to mika
      * INTRODUCE(a, t, m)
        * subject, object, indirect object
    * Marcus danced in Casa Loma
      * DANCE(m)
      * we ignore 'Casa Loma' as it is not an argument of the verb

* Basic set theory
  * set is a collection of objects
  * list of its members in braces, (list notation, roster notation)
  * inclusion vs membership
    * 3 is a member of {1, 2, 3} \(\equiv\) \(3 \in \{1, 2, 3\}\)
    * { 3 } is included in {1, 2, 3} \(\equiv\) \(\{3\} \subseteq \{1, 2, 3\}\)
  * binary relations
    * relations that hold two things
    * binary relations are sets of ordered pairs
    * pairs are ordered!!
    * **like, be greater than, inside**, express binary relations
  * x likes y: \(\{<x, y>\}\)
    * Assume we have U = {Alex, Chris, Jess}
    * Jess likes Chris, Jess likes herself, Alex likes Chris and nobody likes anyone else
    * { (Jess, Chris), (Jess, Jess), (Alex, Chris) }
* Modelling
  * Modeled propositional logic with truth tables
  * In PredL, we use models instead
  * a model is an abstract repr of the world
  * model contains individuals we can organize in set
  * model contains information about denotation of diff exprs of predicate logic
  * to interpret PredL in a model M, we use
    * universe U which is a set of individuals
    * An interpreteation [[ ]]^M which tells us the denotation of expressions of PredL in the model
    * in slides, blue is english
    * simple model
  * we can formulate general rules
    * \(\llbracket P(t)\rrbracket ^M = T \iff \llbracket t \rrbracket ^M \in \llbracket P \rrbracket^M\)
    * If \(t_1, ..., t_n\) are individual constants and R is an n-ary predicate with n gte 2, then
      * \(\llbracket R(t_1, ..., t_n) \rrbracket^M = T \iff <\llbracket t_1 \rrbracket^M, ..., \llbracket t_n \rrbracket^M> \in \llbracket R \rrbracket ^M\)
    * connectives can be interpreted the same way. 
  * compositional model of english
    * translate sentences to formulae in predicate logic
    * interpret in a model
    * if the translation step can be made systematic, the whole procedure is going to be compositional
* Denotation
  * \(\llbracket [_{NP} Jess] \rrbracket = Jess\)
  * \([\llbracket [_{VP} smokes] \rrbracket = {Chris, Jess, Robert}\)
  * \(\llbracket [_S \text{NP } \text{VP}] = \)