# 2021-10-07 Lambda Calculus

* One of our main goals is to interpret English sentences compositionally
  * Consider some sentence `[NP Jess [VP [V likes] [NP Mary]]]`
  * We can think of [VP likes Mary] as the set of people that like Mary, as a set of ordered 2-tuples from the denotation, i.e. \(\llbracket \text{VP} \rrbracket^{M, g}\)
  * We can do better than using fixed VPs
  * In this example we can think of `like` as a function that yields another function that yields the VP as a function.
  * If everything is function or arguments of functions, we can have a single principle of composition
  * The types of the functions must match
    * Jess likes Mary vs Jess like runs
    * We can think of arguments (DP) as arguments of type \(\epsilon\), and then functions as their own type \(\tau\)
* We can turn expressions that are not functions into functional expressions.
  * Consider \(run(v_1)\)
    * Since the free variable \(v_1\) is interpreted as a pronoun, we can paraphrase as 'they run'
    * \(\llbracket run(v_1) \rrbracket^{M,g} \equiv T \iff \llbracket v_1 \rrbracket ^{M, g} \in \llbracket run \rrbracket ^{M, g}\)
    * We can easily convert sets to functions using the characteristic function \(X_S : S \to \{1, 0\}\)
    * We could find the characteristic function \(X_{run}\), and write it  \(\lambda x.run(x)\) 
    * The \(\lambda\) operator abstracts over the free occurrence of the variable \(x\) in its scope.
    * The difference between \(X_{S}\) and \(\lambda x.S(x)\) is that the function \(X_S\) is the denotation of the expression \(\lambda x.S(x)\) in the formal typed lambda calculus. 
    * What is the type of \(\lambda x.run(x)\)? Lets try and apply it.
      * \(\lambda x.run(x)(b) \equiv run(b)\)
      * the lambda operator allows us to replace every bound occurrence of \(x\) with the applicant \(b\).
      * This is called \(\beta\) reduction
        * Formally it is the replacement of a bound variable in a function body with a function argument.
    * Functions can also be arguments.
      * \(\lambda y.\lambda x.like(x,y)\) 
      * Notice that the body of \(y\) is also a function
      * \(\lambda y.\lambda x.like(x,y)(b) \equiv \lambda x.like(x,b)\)
        * Notice this is the partially applied result of \(like(x,y)\) on \(b\). i.e. `like y x; like b` (notice arguments are swapped)  
        * We use comma syntax as a shorthand, formally we would see \(\lambda x.like(b)(x)\) after \(\beta\)-reduction.
* Consider some function \(\lambda x. know(x)\) denotes the function with the set \(\{\langle Sara, Jess\rangle, \langle Bonnie, Jess \rangle, \langle Lara, Frank \rangle\}\). 
  * We can turn this into a function \(X \to X \to \{1, 0\}\)
  * We can make precise the relation like so
    * \(\llbracket \text{know} \rrbracket^{M, g}(d')(d) = 1 \iff \langle d, d' \rangle \in R\).
    * The function is thus the **right to left** currying of the relation. 
    * Then we write this as \(\llbracket \lambda y.\lambda x. know(y)(x) \rrbracket^{M,g}\)
      * We know the denotation of the entire expression, and the expression \(\llbracket \text{know} \rrbracket^{M, g}\) is equivalent.
      * This is the \(\eta\)-reduction of \(\lambda y. \lambda x. know(y)(x)\) to \(know\).
* \(\alpha\)-conversion allows us to rename bound occurrences of variables to avoid name collisions
  * \(\lambda x. f(x) \to \lambda y. f(y) \equiv \lambda x.\phi \to \lambda y. \phi[x \to y]\)
  * As long as there are no accidentally captures of variables

* Types of \(L_\lambda\)
  * Expressions that denote individuals are typed \(e\), and expressions that denote truth values are of type \(t\).
    * Individual constants and variables are \(e\)
    * An expression of type \(t\) is a formula
    * Formally we denote the syntax of this type system
      * \(e, t\) are types
      * If \(\sigma, \tau\) are types, then \(\langle \sigma, \tau \rangle\) is a type.
      * Nothing else is a type.
    * \(\langle \sigma, t \rangle\) is the type of a function that maps an expr of type \(\sigma\) to a truth value.
      * **Notation note:** the course uses this syntax to express types but these notes may interchangeably use the syntax \(\sigma \to t\) or Haskell `f :: E T`. Angle brackets are hard to typeset.
    * For example, \(\lambda y. \lambda x. know(y,x)\) has type \(\langle e, \langle e, t \rangle \rangle\) or arrow notation \(e \to e \to t\) `know :: E E T`. Note that associativity of the angle brackets is rightwards.
    * With this notion of type we know know that \(\lambda x. run(x)\) has type \(e \to t\) so we can explain denotational failures.
* Lexicon of \(L_\lambda\)
  * For every type \(\tau\) a possible empty set `CON` of non-logical constants of type \(\tau\) in \(L_\lambda\)
    * For example, \(run\)  or \(happy\) are constants of type \(e \to t\).
  * For every type \(\tau\) a possible empty set `VAR` of variables of type \(\tau\) in \(L_\lambda\)
    * For example, \(\lambda P. P(j)\) where \(P \in \text{VAR}_{\langle e, t \rangle} : e \to t\) 
  * Logical constants \(\neg, \wedge, \vee, \to\)
  * Punctuation `()[]`
* Syntax of \(L_\lambda\)
  * For any type \(t\), if \(\alpha\) is a variable or constant of type \(t\) then \(\alpha\) is an expression of type \(t\) in \(L_\lambda\)
  * For types \(\sigma\) and \(\tau\) if \(\alpha\) is an expression of type \(\langle \sigma, \tau\rangle\) in \(L_\lambda\), and \(\beta\) is an expr of type \(\sigma\) in \(L_\lambda\), then \(\alpha(\beta)\) is an expression of type \(\tau\) in \(L_\lambda\).
  * ... similar rules as propositional logic connectives
  * \(\alpha, \beta\) are expressions of the same type \(L_\lambda\) then \(\alpha = \beta\) is an expression of type \(t\) in  \(L_\lambda\).
  * For types \(\sigma, \tau\) if \(v\) is a variable of type \(\sigma\) in \(L_\lambda\), and \(\alpha\) is an expression of type \(\tau\), then \(\lambda v.\alpha\) is an expression of type \(\langle \sigma, \tau \rangle\) in \(L_\lambda\).