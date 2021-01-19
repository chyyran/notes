# 2021-01-11

## Course Goals
* Design and implement compiler for 'MiniC', a subset of C
* Based on LLVM, written in C++
* 6 phases, assignment
* Individual
* ~1-2k LOC total for all assignments
* 75% of final mark
* Linux

## Assignments
1. Environment setup (4%) (due 1/25)
2. Revise grammar and build parser (10%) (due 2/1)
3. Build AST (11%) (due 2/11)
4. Symbol tables and semantic checking (12%) (due 2/22)
5. LLVM IR generation (22%) (due 3/15)
6. IR Optimization (16%) (due 4/1)
7. Final Exam (25%) 

* Total grace period of 96 hours, 2% penalty applied per hour after grace period
* Sample solutions & hidden test cases 4 days after deadline
* Must complete 2 of the last 4 assignments to pass
* allows second submission within 7 day after deadline to fix bugs based on related text cases
* incremental assignments
* retain 75% of marks loss on test cases
* freedom to choose to continue future assignments based on own codebase or released sample code

## Content
* Introduction
* Parsing Techniques (lexing, syntax analysis)
* AST and symbol tables
* Semantic analysis
* LLVM IR
* IR Codegen
* Optimizations
* Runtime and backend codegen

## Overview
* compiler techniques used in many places besides compilers
* anywhere that structured text needs to be processed
  * command script s
  * HTML parsing
  * JS/flash interpreters
  * query processing
    * twitter uses ANTLR for processing
  * program analysis
  * software testing
* compiler's job
  * checks souce program for correctness
  * lexically well formed (spellcheck)
  * syntactically well formed (grammar check)
  * semantic checks (type check, usage correctness)
  * transform source into object
* compiler implementors design mapping from source language to target machine 
* analyze a programming language for potential problems
* determine if language can be processed during lexical analysis, syntax analysis, semantic analysis
* must be able to analyze target machine and determine best way to implement construct in plang
* knowledge of backend is important for optimization
* ideal compiler
  * good UI
    * precise and clear diagnostic 
    * easy to use oprocessing
  * correctly implements entire language
  * detects all statically detectable errors
  * generates highly optimized code
  * compiles quickly
  * good softeng practices
* LLVM compiler infrastructure
  * workflow
    1. parse source program into AST
    2. semantic check AST into symbol tables
    3. IR codegren from symbol tables and AST
    4. optimize pass on LLVM IR
    5. IR -> machine code backend codegen
* AST
  * `if (x * x > 100) y = 0; else y = 1`
  * `[IfStmt if. [BinOp. [BinOp. [VarRef. x] * [VarRef. x]] > [IntLit. 100]] [Assign. [VarRef. y] = [IntLit. 0]] [Assign. [VarRef. y] = [IntLit. 1]]]`
  * ```llvm
    %4 = load i32, i32* %x, align 4
    %4 = load i32, i32* %x, align 4
    %6 = mul nsw i32 %4, %5
    %7 = icmp sgt i32 %6, 100
    br i1 %7, label %then, label %else

    then:
    store i32 0, i32* %y, align 4
    br label %out

    else:
    store i32 1, i32* %y, align 4
    br label %out

    out:
    ```` 
  * virtreg and labels start with `%`
  * number of virtregs are unlimited
  * regs only stored once
  * %4 and %5 have equa values so we can eliminate
  * optimization at the IR level
    * not yet architecture specific
    * can be reused across backends
    * can be reused across languages
  * can quickly build compilers that generate fast code
  * interpretive systems
* compiler generates pseudo machine code
* pseudo machine code executed by another interpreter
* interpreters useful for porting programs between envs
* implementing ugly language features
* dynamic program modifications
* languages with less strict typing cant be semantically analyzed
* JIT interpreter
  * JVM 
    * Java compiles to JVM bytecode
    * designed to make Java portable to many platforms
  * Python
    * official implementation is an interpreter (CPython) 
  * LLVM IR
    * can be directly executed with JIT interpreter (LLI)