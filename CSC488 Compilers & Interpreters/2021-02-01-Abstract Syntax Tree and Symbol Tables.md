# 2021-02-01 Abstract Syntax Tree and Symbol Tables

* Internal compiler data structures
  * parse tree
    * output of syntax analysis. syntax structure of the program
    * complete representation of the syntactic structure according to some grammar
  * abstract syntax tree
    * modified parse tree. 
    * most compilers share same structure as the parse tree, but describes program structure
    * only describes essential program structure
    * basic building process
      * leaf nodes are constants and idents
      * interior nodes are built as needed to represent language constructs
        * interior nodes contain links to one or more child nodes
    * processing
      * process AST depth first to guarantee child nodes processed before parent nodes
      * parent nodes do processing using info from already processed child nodes
    * ast nodes are typically custom designed for each of the major constructs in the language
    * very general node
      * parent
      * leftmost sibling
      * leftmost child
      * right sibling
    * generic node in MiniC compiler
      ```cpp
      struct SourceLocation {
          int line, row;
      }

      class ASTNode {
          std::vector<ASTNode*> children;
          ASTNode* parent;
          SourceLocation srcLoc;
          Program* root;
      }
      ``` 
      * `SourceLocation` used to error messages
      * `Program` is the top-level AST node 
  * symbol tables
    * data structures to maintain semntic and codegen information for var/func/type idents
  * intermediate representation
    * architecture independent assembly, a la LLVM IR
    * used for complicated compiler optimizations
    * some compilers generate asm straight from AST
    * single-static assignemnt form is only one property that IR ha 
      * every var assigned once, every var defined before use
* Assignment 2
  * attach compiler actions to each rule
  * actions perform follwing tasks
    * allocate new AST class based on type of processing grammar
    * parse subgrammars (non-terminals) and collect resulting AST node result
    * push resulting AST nodes as the children of new AST class in order
    * collect necessary information for diagnosis such as source locations
* compiler tables
  * symbol tables
    * contains information about declared things (idents)
    * typical entry
      * item name
      * item kind (constant, var, type, proc, func)
      * item type (index into type table)
      * associated props or attrs
      * item size (derivable of type)
      * runtime address (base reg, offset)
      * item value
      * links to related symbols (paramlists, enum constants struct fields)
    * symbol table ops
      * create
      * enter new scope
      * exit scope
      * lookup in current scope
      * lookup with scope rule
      * enter new symbol in scope
      * enter new symbol in given scope
      * delete symbol
      * retain symbol
      * get/set symbol fields
  * type tables
    * records info about builtin and declared types
    * necessary for langs that allow arbitrary user types
    * types are weird, most langs have composite types 
    * typical entry
      * type name (often omitted)
      * type kind (typedef, enum, scalar, array)
      * associated type attrs or props 
      * size, alignment of type objects
      * type definition (links to embedded components)
    * for many languages type tables are DAGs
  * table management is major perf issue in compiler design
  * table search is the dominant operation
  * table lookup follows scope rules
    * decl processing: add entries for declared idents and types
    * semantic analysis: look up idents to determine attributes, lookup types to validate program usage
    * codegen: lookup idents to determine attributes
  * optimizations
    * global table for entire program
      * simple
      * tricky to handle variables with same name in diff scope
        * need to lookup scope IDs 
    * separate linked tables for each major scope
      * more jumps to look up scopes
  * storage
    * fixed sized memory resident
      * limits program size
    * statically or dynamically allocated in memory
    * partially memory resident, remainder on disk
      * LRU caching works well for this
* values
  * compiler needs to be able to represent any kind of value in tables
  * to conserve space, often unions are used
  * large constant values (array inits or structs) often require special storage
* scopes and declartions
  * assume program consists of some nested scope of decls
  * idents declared in one or more scopes
  * scope rule determines visibility of symbols
  * mosy common scope rule is to allow idents declared in a scope to be visible in child scopes
  * major scopes
    * construct with special significance
    * main program
    * class body
    * routine body
  * minor scopes
    * less significant, occurs within major scopes
    * statements, `{` `}`
  * recommended strat
    * merge symbol table entries for minor scopes into symbol table for nearest enclosing major scope
    * carefully handle name conflicts
    * visibility of idents declared in minor scopes controlled by lookup algorithms
    * keep major scopes separate
  * rules
    * programs usually partitioned into possibly overlapping scopes of decls
    * scope rule for a language specifies the algo use to search compiler tables
    * each scope of declaration is logically a separate set of symbol table entries
    * commonly scopes are properly nested and symbol table behaves like a stack
    * most compilers distinguish symbol visibility from symbol storage
* retained symbols
  * formal params of funcs and procedure need special symbol table handling
  * sym entries created when prototype of actual def of routine is processed
  * entries used when processing routine body
  * after processing, symbol entries for formal params need to be retained to  process calls of routine
  * usual technique is to leave formal paramater (function arguments) entries linked to routine entries. params wont be visible in ordinary symbol lookup.
* symbol table perf
  * hashtables most common choice for O(1) insert and lookup
  * look up in scopes 
    * iteratively fetch parent scopes until it finds target symbol
    * return null when reaching root program scope without finding
  * cache lookup 
    * cache lookup results locally for samevar lookup
* minic symbol table entry
  ```cpp
  struct VarSymbolEntry {
      Type VarType;
      llvm::Value *LLVMValue;
  }
  class VarSymbolTable {
      std::map<std::string, VarSymbolEntry> Table;
  }
  struct FuncSymbolEntry {
      Type RetType;
      std::vector<Type> ParamTypes;
      bool HasBody;
  }
  class FuncSymbolTable {
      std::map<std::string, FuncSymbolEntry> Table;
  }
  ``` 
  * var syt maps each variable to type and corresponding IR object (used during codegen)
  * func syt maps each funcname to return type and list of param types
    * contains flag to indicate whether we have seen definition yet 
  * contains get/set syt entries for new variables/funcs
* MiniC SymbolTable
  * does not allow forward reference
    * can construct symbol table when we visit AST tree to perform semantic analysis
  * valid variable decl => add variable with type info into the variable symbol table
    * one-pass semantic analysis + symbol table
  * valid func decl => add function with signature type info into func syt
  * when checking semantic correctness (i.e. typeck), query symbol table