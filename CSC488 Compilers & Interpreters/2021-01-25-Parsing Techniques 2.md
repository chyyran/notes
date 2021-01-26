# 2021-01-25 Parsing Techniques 2

* Given a grammar, we should be able to predict the next action

* Consider this grammar
  * ```
    S -> d S A
      -> b A c
    A -> d A
      -> c
    ```
  * Consider the rule `S -> d S A`
    *  d is terminal, so the output is not nullable. 
    *  Predict set is `{d}` 
  * For terminals, if the terminal on the stack matches the terminal we expect, we pop, otherwise we error. 
  * Order of rewrite rules matter. 
    * input d b c c d c matches
    * input d c c does not match
      * match S, push dSA
      * match d, SA remains on stack
      * match S, fails parsing
* Top down parser issues
  * grammar rules that have common prefixes
    * A -> B C D x Y z
    * A -> B C D w U v
    * break up into two parts
      * A -> AHead ATail
      * AHead -> B C D
      * ATail -> x Y z | w U v 
  * Left-recursive grammars are impossible
    * A -> A B C
    * causes top-down parser to infinitely search for A
    * remove left recursion by introducing new non terminals
      * ```
        E -> E + T
          -> T
        T -> T * P
          -> P
        P -> ID 
        ``` 

      * Rewrite the rule to be right-recursive (may be on exam)
        ```
        E -> T Etail
        Etail -> + T Etail
              -> 
        T -> P Ttail
          -> * P Ttail
          -> 
        P -> ID
        ```  
      * In ANTLR4, we have automated engines to resolve non-complicated left recursion 
  * Fix predict set conflicts
    * Predict sets for each non-terminal must be disjoint for grammar to be LL(1)
    * Non-disjoint predict sets can be fixed by introducing extra non-terminals to give more context (locally increasing amount of lookahead)
    * All production rules must have non-terminal predict sets
* LL(*)
  * LL(k) for k > 1
  * ANTLR4 can handle direct left recursion automatically
* Recursive Descent parsing
  * A set of mutually recursive functions that act as parser for the language
  * One function means one rue
  * RD parsers can make decisions anywhere in a rule, not just at the start
  * Backtracking possible if each function is written to fail purely if recognition fails
  * Can implement k-token lookahead selectively (only when necessary)
* Shift-reduce parsing (Bottom Up LR(k))
  * Parser actions
    * Shift: Push next input symbol onto stack
    * Reduce: Sequence of symbols starting at the top of the stack reduced using a production rule to replace symbol with one non-terminal
    * Accept: End of parse
    * Error: Recovery routine to handle syntax error
  * Choice of actions based on content of stack and the next k input tokens (k-symbol lookahead)
  * A *handle* is the RHS of some rule in the grammar.
  * Bottom-up parsing allows more than one rule to have the same RHS iff the rules can be distinguished using the left context, and k-symbol lookahead
    * Efficiently solving same-prefix problem
  * Deciding which action to perform
  * Detecting when a handle is present on top of parse stack
  * LR(k)
    * Contents of parser stack represents a string from which past input can be derived
    * Inputs stacked until top elements in the stack (handle) are a complete alternative (RHS) for some rule
    * When rule is recognized, stack elements are popped, and replace by nonterminal of rule (LHS)
  * input pointer does not move when we do reduction
  * Next input symbol narrows number of possible alternatives
  * if input symbol stacked, then the language is not LR(k)
  * We need k input symbols, if theyre not enough then the language is not LR(k)
  * LL(k) happen at the start of the alternative, and LR(k) parsings do rightmost derivation in reverse.
  * \(LL(k) \subset LR(k)\), because LR(k) naturally uses more information than LL(k) for fixed k.
  * LR parsers keep very complicated state
    * SLR(1) combines states that share the same rule and use follow set to select right reduce action to apply
    * LALR(1) differs from LR(1) in that states with identical reductions but different lookahead sets are merged in LALR(1), which are kept distinct in full LR(1)
      * YACC is a LARL(1) parser developed at Bell Labs
      * Bison is a YACC clone from GNU
* Summary of parsing
  * A parser that can determine correct derivation/reduction at each stage when scanning stream in one direction is *deterministic*
  * Grammar is LL(k) if parseable scanning L-R using L-derivations with k-symbol lookahead deterministically
  * Grammar is LR(k) if parseable scanning L-R using R-reductions with k-symbol lookahead deterministically
  * Recursive descent is the most versatile technique, but the parser must be written manually
* Relationship
  * \(L(LL(1)) \subset L(LL(k))\)
  * \(L(LR(1)) \subset L(LR(k))\)
  * \(L(LL(k)) \subset L(LR(k))\)
  * In practice after eliminating L-recursion, LL(k) parsers can parse most CFGs