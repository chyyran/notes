# 2021-09-30 Predicate Logic

* Lexicon and Syntax \(L_0\)
  * No quantifiers and variables
  * Allows us to look inside logical structure of simple clauses
    * Jess met Alex
    * Mark Twain is Samuel Clemens
  * Lexicon
    * A set `Term` of constants \(a, b, c\)
    * A set `Pred-1` of unary predicates \(\text{Smoke}, \text{Run}, ...\)
    * A set `Pred-2` of binary predicates \(\text{Know}, \text{Like}, ...\)
    * Logical connectives \(\neg,\vee,\wedge,\to,\leftrightarrow\)
    * Identity \(=\)
    * Punctuation \(,\)
  * Syntax of \(L_0\)
    * A formula \(\phi\) is well formed if and only if
      * If \(\pi \in\) `Pred-n` and \(\alpha_1, ...,\alpha_n \in\) `Term` then \(\pi(\alpha_1, ...,\alpha_n)\) is well formed.
      * If \(\alpha, \beta \in\) `Term` then \(\alpha = \beta\) is well formed.
      * If \(\phi\) is well formed, then \(\neg\phi\) is well formed.
      * If \(\phi, \psi\) are well formed, then \((\phi \wedge \psi), (\phi \vee \psi), (\phi \to \psi), (\phi \leftrightarrow \psi)\) are well formed.
      * No other strings are well formed.
    * Note that this syntax does not allow bare terms
  * Semantics of \(L_0\)
    * We interpret formulae of \(L_0\) wrt models; symbolci representations of the worlds or different ways the worlds might be.
    * \(f\) is true in the model \(M\) means that \(f\) is true in the world as represented in \(M\).
    * \(M = \langle D, I \rangle\), where \(D\) is the domain of entities and \(I: \text{Term}|\text{Pred-n} \to D | {_\subseteq D} |  {_\subseteq \langle D, D \rangle}\) a function that assigns values to (non-logical constants) letters in `Term`
    * The denotation of some expression \(\epsilon\) of \(L_0\) in \(M\) is denoted \(\llbracket \epsilon\rrbracket^M\)
      * If \(\pi \in \text{Pred-n} \implies \llbracket \pi\rrbracket^M = I(\pi)\)
      * If \(\alpha \in \text{Con} \implies \llbracket \pi\rrbracket^M = I(\alpha)\)
      * If \(\pi \in \text{Pred-n}, \alpha_1, ..., \alpha_n \in \text{Term} \implies \llbracket\pi(\alpha_1, ..., \alpha_n)\rrbracket^M = 1 \iff \langle \llbracket \alpha_1 \rrbracket^M, ..., \llbracket \alpha_n \rrbracket^M  \rangle \in \llbracket \pi \rrbracket^M\)
      * If \(\alpha_1, \alpha_2 \in \text{Term}, \implies \llbracket \alpha_1 = \alpha_2\rrbracket ^M = 1 \iff \llbracket \alpha_1 \rrbracket^M= \llbracket\alpha_2\rrbracket ^M \)
    * Why don't we treat identity as a binary predicate?
      * The notion of sameness is not specific to a model
    * Sentence connects are interpreted as in predicate logic
* We can add functions to \(L_0\) that map individuals to individuals.
  * For example, let \(\text{spouseOf}: \text{Term} \to \text{Term}\).
    * \(\llbracket a \rrbracket^M = \) Alex
    * \(\llbracket j \rrbracket^M = \) Jess
    * \(\llbracket \text{spouseOf}(j) \rrbracket^M = \) Alex
  * We add the following lexicon
    * A set `Fun` of unary functions \(f: \text{Term} \to \text{Term}\)
  * Note that strings like \(\text{spouseOf}(j)\) is of type \(\text{Term}\)
    * If \(\gamma \in \text{Fun}, \alpha \in \text{Term}, \implies \gamma(\alpha) \in \text{Term}\)
    * Syntactically, if \(\gamma \in \text{Fun}, \alpha \in \text{Term}, \implies \gamma(\alpha)\) is well formed.
    * Semantically,  if \(\gamma \in \text{Fun}, \alpha \in \text{Term}, \implies \llbracket\gamma(\alpha)\rrbracket^M = \llbracket\gamma\rrbracket^M(\llbracket\alpha\rrbracket^M)\)
      * We need to add functions to our models to do this
* Adding variables
  * Variables can be bound to quantifiers. When a variable is not bound, it is *free*. A formula where there are free variables is an open formula.
  * Consider the following open formula, where \(j\) is a constant and \(x\) is a variable: \(\text{Like}(j, x)\)
  * We split apart \(\text{Term} = \text{Con} \{j, m, ..\} \cup \text{Var} \{x, y, z\}\)
  * We already have a syntax for \(\text{Term}\), but we need a new semantics to interpret variables.
  * We define an assignment function \(g: \text{Var} \to D\) that associates variables with individuals
    * Then, if \(\alpha \in \text{Var} \implies \llbracket a \rrbracket^{M,g} = g(a)\)
    * We need to add the assignment function \(g\) to get an interpretation with respect to the model and variable
  * Using assignment functions allow us to use the same model with a different interpretation for variables
    * This is similar to pronouns
    * What is part of the model is representing the fixed representation of the real world
    * Variables can vary much more than the model with regards to the sentence
    * If we don't have an assignment function we can not reason about variable letters without varying the model 
* Quantifiers
  * Lexicon additions: \(\exists, \forall\)
  * Syntactically, if \(\phi\) is well formed, and \(\u \in \text{Var} \implies \exists u.\phi, \forall u.\phi\) is well formed. 
  * We also need to consider values that can be independently assigned to some variable \(x\) of the assignment function \(g\).
    * Hence we have \(g[u \to k]: \text{Var} \to D, g[u \to k](x) = \{ u \to k, g(x) \text{ otherwise} \}\)
    * \(\llbracket \exists u.\phi\rrbracket^{M, g} = 1 \iff \exists d \in D. \llbracket \phi \rrbracket^{M, g[u \to d]} = 1\)
    * \(\llbracket \forall u.\phi\rrbracket^{M, g} = 1 \iff \forall d \in D. \llbracket \phi \rrbracket^{M, g[u \to d]} = 1\)