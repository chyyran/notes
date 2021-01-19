# 2021-01-18 Parsing Techniques

* 2 steps
  * Lexical analysis chops programs into tokens
    * Input: Character stream
    * Output: Token stream
    * Recognizes potential incorrect tokens
  * Syntax Analysis parses tokens into a parse tree
    * Input: token stream
    * Output: parse tree of the program
* Lexical analysis
  * Steps
    * Delete irrelevant information (whitespace, comments)
    * Determine token boundaries in source stream
    * Transmit tokens to syntax pss
    * Deal with ill-formed tokens, recover from lexical errors
    * Process literals and macros, preprocessor (in some cases)
    * We may want to transmit source coordinates to the next pass
  * Objects
    * Identifiers
    * Reserved words or keywords
    * Literal constants
    * Comments
    * Special characters
  * We should design a language so lexical token boundaries can be done easily
  * Want to avoid backtrack
  * Example:
    * `const x = 1`
    * `ConstVar(x)` `IntLiteral(1)`
  * Describe lexical structure of the language using regular expressions
  * Parsing tools (ANTLR, Flex, JFlex) will
    * Generate NFA that recognizes sets specified by regex
    * Converts NFA to DFA
    * Implement DFA using a table-driven algorithm
  * MiniC ANTLR4
    * Identifiers: `[a-zA-z][a-zA-Z0-9_]*`
    * Digits: `[0]|([1-0][0-9]*)`
    * WhiteSpaceBlock: `[\t\r\n]+`
  * Convert regex to finite automata
    * If FA has a unique transition for every (state, inputchar) then it is deterministic
  * DFA lexer
    * Input to DFA is the next input to lexical analyzer
    * Main state of DFA uses character to classify type of possible token
    * Once we reach an accepting state, we have a new token
  * Notation in slides
    * `N` -- change to state N
    * `+N` -- change to state N and advance input pointer
  * Need to deal with illformed, and incomplete tokens
    * Incorrectly formed
    * Oversized tokens
    * Numbers out of range
    * Unterminated stream or comment
    * Illegal characters
  * Most common errors will be missing edges, no such transitions
  * Error strats
    * Stop process at lexer
      * Emit error message for lexical error
      * Report source code location
    * Postpone error reporting until we have the AST
      * Important for the parser to keep track of where the parser is
* Syntax anaysis
  * Syntax of language defines sequences of tokens that form legal sentences in the language
  * Tasks
    * Determines which token sequences fit into the grammar
    * MiniC syntax in handout
    * Handle syntax errors in token stream
    * Put token coordinates in AST tree
    * Analyze sequence of tokens to determine its structure
  * Lookahead k-lexical tokens in put stream
  * Most parsers use a stack to record first two items
  * Most simple languages, parses parse token stream LTR without backtracking with 1-lookahead 
  * Top Down parsing
    * Start with a start symbol for language (S) and attempt to find a sequence of production rules that transforms the start symbol into a given sequence of input tokens
    * Builds parse tree from root to leaves
    * A top-down parse is called a **derivation**
    * Recursive descent and LL(k) are top-down parsing techniques
  * Bottom Up parsers start with a sequence of input tokens and attempt to find a sequence of production rules that will reduce the entire sequence of terminal symbols to the start symbol
    * Builds parse tree from leaves to root
    * A bottom-up parse is a **reduction** or reverse derivation
    * LR(k), SLR(k) and LARL(k) are bottom-up parsing techniques
  * Terminology
    * \(\Sigma\) is a finite set of terminal symbols
    * A **String** is a finite sequence of symbols from \(\Sigma\)
    * \(\lambda\) is the empty string
    * $ is EOF on input string
    * Concatenation
      * XY
      * X^i means X concatenated i times
      * X* means zero or more instances of X
      * X+ means one or more instances of X
    * Uppercase letters are non-terminal symbols
    * Lowecase symbols are terminal symbols
    * Greek lowercase are strings of terminal and non-terminal symbols
    * N is a set of non-terminal symbols
    * S is a distinguished non-terminal start symbol
    * Greek letters strings in \((N \cup \sigma)*\)
    * A **language** is any set of strings formed by some vocabulary
  * Production rules
    * The most general context sensitive rule is
      * \(\gamma A \omega \to \gamma a \omega\)
    * For CFGs, \(\gamma\), \(\omega\) are null, so all rules are of the form 
      * \(A \to a\)
    * Compilers do not use CSGs, CFGs are enough to parse programming languages
  * Nonterminal symbols are symbols that represent a big chunk of constants or prgrams
* Informtion definitions
  * The **productions** in  a grammar are a set of rules that define the sequences of terminal symbols that make up sentences in the language defined by the grammar
  * A grammar is **unambiguous** is there is exactly one sequence of rules for forming each legal sentence in the language. A language is ambiguous if all grammars for the language are ambiguous.
  * A grammar is CFG if every rule can be applied independent of it' s surrounding context
  * A language is deterministic if it is always possible to determine which rule to apply next when parsing every sentence in the language
  * Example: order of operations can be ambiguous if not well defined
* ANTLR4 grammar for MiniC
  * ```antlr4
    expr: '-' expr
        | expr ('*' | '/') expr
        | expr ('+' | '-') expr
        | var
        | ...
    
    var: IDENTIFIER | IDENTIFIER '[' expr ']'
    ``` 
* Grammar design for compiling
  * A typical plang will have two grammars
    * A *reference grammar* is made available to users of the language
    * A *compiler grammar* is used by the implementation of the language
    * The two grammars _should_ describe the same language, but may not be 100% identical in form
    * We may rewrite the parsing in certain way to facilitate easier or more beautiful parsing
  * The design of the compiler grammar
    * Affects the effort to implement semantic analysis and code generation
    * Determines the order in which constructs in the language will be processed for a given parsing algorithm
    * Determines class of parsers that must be used to perform syntax analysis
  * For LL(*) parsers, compiler grammar may try to eliminate left-recursion
  * For LALR(1) and SLR(1) parsers, semantics and/or codegen actions can only be involved when a reduction is applied. Actions may only occur at the right end of a rule.
  * Reference grammar: `params -> params ',' params | var`
  * Compiler Grammar: `params -> var ACTION_NEW_LIST | params ',' var ACTION_LIST_APPEND_VAR`
* Table driven parsing
  * Conceptually there is a table for each parser state
  * Multiple actions per state so tables can be merged to one table for all parser states
  * Final state is accepting or rejecting
  * Top-down: stack represents what we expect to see
  * Bottom-up: stack represents what we have seen so far
* Parsing techniques
  * Recursive descent
    * top-down parsing technique with potential for backtracking
    * manually written parser
    * written as a collection of interacting recursive functions
    * useful for dealing with complicated languages
  * LL(1)
    * table-driven top-down parsing technique
    * deterministic push-down automaton
  * LR(1)
    * table-driven bottom-up parsing technique
    * shift/reduce algorithm to record state of reduction
    * deterministic push-down automaton
    * more complicated, more powerful than LL
  * SLR(1) and LALR(1) are practical versions of LR(1)
    * table may be too big, too complicated for some grammars in LR(1)
* Top-down parsing
  * predictive parsers
  * parse stack represents what the parser expects to see
  * if the top item in the parsers stack is non-terminal A, then a top down parser selects one of the rules defining A as the next target
  * A -> a_1 | a_2 ...
  * Find the correct production rule to replace A
  * Recursive descent LL(k) are two most common top-down parsing techniques
* LL(1) parsing
  * Cans input from the **L** eft, producing a **L**eftmost derivation
  * Controlled by one incoming token and the top item in the parse stack, which is the non-terminal that we want to expand
  * Parse stack represents what the parser expects to see. 
  * Parser encounters a token then the parse stack gets modified
  * Predict sets are the decision making mechanisms
    * Given a non-terminal A, with several rules
    * A -> a_1 | a_2 | ... | a_n
    * The predict set for A -> a_i is
      * Predict(A -> a_i) = First(a_i) if a_i is not nullable (empty)
      * Predict(A -> a_i) = First(a_i) | Follow(A) if a_i is nullable
  * Predict sets for every non-terminal in the grammar must be disjoint for the language to be LL(1)
    * Predict sets for A -> a_1 must be disjoint for A -> a_2
    * If they are not disjoint, we can not make a correct prediction
  * LL(1) parsers must make a parsing decision at the beginning of each rule, i.e. select which a_i to continue
  * If `inToken` is the next incoming lexical token, then the parser searches for the token in the predict sets for the rules that define A. 
    * if `inToken` is in Predict(A -> a), then the rule A- > a should be applied.
    * if `inToken` is not in any of the predict sets, then there is a syntax error
    * `inToken` can not be in more than one Predict set for A in a correctly constructed LL(1) parser.
* Nullability
  * \(\alpha\) is nulable iff \(\alpha\) can derive the empty string \(\lambda\)
  * If \(\alpha\) produces \(\lambda\), it provides no information the parser can use 
  * A grammar can be processed to determine which non terminal can potentially derives \(\lambda\)
* First sets
  * First(a) is the set of terminal symbols that can occur at the beginning of strings derived from a.
  * Defined recusively
    * First(c, \(\beta\)) = { c }
    * First(\(\lambda\)) = { }
    * First(B, \(\gamma\)) = First(B) \(\cup\) First(\(\gamma\))
* Follow sets
  * Follow(A) is the set of terminal symbols that can occur immediately following a non-terminal symbol A
  * For small grammars it can be computed by inspection
  * Much harder to do computationally because nullability must be accounted for