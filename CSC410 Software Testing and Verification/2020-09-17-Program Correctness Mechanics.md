# 2020-09-17 Program Correctness: Mechanics
  
* goal: specifying and proving props of programs
* model: control flow graph or program
* specifications: first order logic
* proof methods: inductive assertions, ranking functions
  * including termination args for total correctness
* program annotation is a first order logic formula \(F\) whose free variables only include program variables
* any annotation \(F\) is associated with a location \(L\) of the program.
  * \(F\) holds when control flow reaches \(L\)
* in dafny, annotations can be expressed as asserts
* precondition is true upon entering the function, free vars are function params
* postcondition is true upon exiting the function, free vars are function params, and `rv` which refers to the return value
* loop invariants hold at the beginning of each iteration
  * when we enter the body: \(F\) and the loop condition holds
  * when we exit the body: \(F\) and the negation of the loop condition holds
* code is partially correct if the function's precondition is satisfied on entry, and postcondition is satisfied on return (if it does)
> **def'n program states**
> an asignment of values (of the proper type to the program variables)
> \(s: \{pc \leftarrow L_1, l \leftarrow 1, u \leftarrow 3, a \leftarrow [4;5;7], rv \leftarrow []\}\)
> We assign a variable to the program counter to access the location the program is.
> We know precisely where we are in the program, and the state of the program.
>
> We can then define a set of states that are valid, and states that are not valid.
>
> Given conditions \(F_{pre}, F_{post}\), where the start state is at the beginning of the function \(s_0[pc] = L_0\), and \(s_0 \vDash F_{pre}\) (satisfies), ignoring all starting states that are not valid.
>
> Execution is then modelled as a sequence of states. This can be a finite or infinite path.
* Now we can define partial correctness
> **def'n partial correctness**
> If for every finite path of \(s\) \(s_0 \vDash F_{pre} \implies s_n \vDash F_{post}\)
>
> For each finite path, starting with the precondition implies it ends with the postcondition.
* How do we prove every program path satisfies the specification?
* **inductive assertion method**
  * for each function, we generate a finite set of verification conditions (VC)
  * if all VC are correct, program is partially correct
  * we prove finitely many paths, and then the infinite paths are induced to be correct
* a **basic path** starts at a precondition or loop invariant, ends at a loop invariant, an assert or a post condition