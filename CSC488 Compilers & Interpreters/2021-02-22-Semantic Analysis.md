# 2021-02-22 Semantic Analysis

* Important to check corner cases!
* Validation of non-syntactic language constraints
  * static -- during compilation
  * dynamic -- during runtime
* Analyses
  * Visibility
  * Typeck
  * Proper usage
  * range/value analysis
  * range/value propagation
  * building symbol table as a side effect of decl proccess
* performed bottom up
  * need to ensure children are valid before we ensure the parent
* types
  * type equivalence
    * conditions under which objects of two types are equivalent
    * address of data objects can be manipulated
    * data layout is completely the same
  * type compatibility
    * conditions where objects of two different types are considered to be compatible
    * required for assignments (float x = 1l);
    * may be unidirectional
    * using subclass ptr in accepting base class ptr
    * autoboxing
  * type suitability
    * when two types are considered suitable to be used together
    * operands in expressions (1f >= 1l)
  * most widely used type equivalence rules are
    * structural equivalence
      * structurally equivalent if their definition have the same structure and corresponding values are equal
      * isomorphism for types
      * parallel walk of two type trees to establish structural equivalence
    * name equivalence
      * two types are **name equivalent** iff they derive from a common definition
      * allows type renaming `type S : T`
      * name equivalence == structural equivalence
  * structural equivalence == memory image equivalence
    * important for pointer semantics
    * done in two cases
      * address of data object assigned to a pointer
      * var passed byref (pointer)
    * memory image equiv guarantees when an address is used to access a type, data fields accessed correctly  
  * memory equivalence
    * layout of two structs/struct instances are exactly the same in memory
  * compatibility checking typically used to check
    * expression on right side can be assigned to the left side
    * expression passed byval can be assigned to a formal param variable
  * suitability checking
    * determine when one or ore values can be used together or with an operator
    * checking both operands of a binop are of suitable types for operator
* minic
  * only has primitive and array types
* visibility analysis
  * accessibility, scoping rules
  * modifiers (`const`)
  * private/public
  * compiler keeps track of how symbols are consistent with scope rules
  * analyzer must track scope structure of the program
* usage analysis
  * is a constant actually constant
  * is a var actually var
  * is a type actually type
  * can we detect potential runtime faults?
* influences
  * semantic analysis is very influenced by plang design
  * PL/I C that do not require decl before use require separate semantic analysis pass
  * languages with weak or non-existant decls (lisp, prolog, APL) require most semantic analysis be done dynamically
  * OOP-langs that allow dynamic object binding require extensive runtime ck
  * dynamically sized objects (arrays, etc) require more runtime ck
* semantic anlysis of decls
  * semananalysis builds symbol taables
  * canonical decl associates idents with type, structure, size according to plang syntax
    * adds this data to symbol table entry
  * processing
    * accumulate declared idents
    * lookup each ident in scope to check for multiple decls
    * add each ident to symbol table for scope
    * assoc attributes, apply language defaults
    * process initial value if one is present
* expression processing
  * semantic analyze expr involves type and usage check
  * assumes ident refs pre-rpocessed
  * stacks used to save type and symbol information duuring expr processing
  * depth-first processing
  * 