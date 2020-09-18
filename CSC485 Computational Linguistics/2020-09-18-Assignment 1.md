# Assignment 1

* implement a neutral transition based dependency parser

* **What is dependency parsing**
  * Transition based parser
  * Given a sentence, output a dependency parse tree
  * Three things to keep track of
    * stack of words being processed
    * buffer of words to be eventually pushed onto the stack
    * list of predicted dependencies (arcs)
      * where you store results once your predictions
      * once all the arcs are saved you have complete tree
    * Operations
      * **Shift:** removes first word from the buffer and pushes it onto the stack
        * T: Stack: `[ROOT, John, saw]`, Buffer: `[dogs, yesterday]`
        * T+1: `[ROOT, John, saw dogs]`, Buffer: `[yesterday]`
      * **LEFT-ARC**: marks second last item in stack as dependent of the first item in the stack, and removes second item from stack
        * T: Stack: `[ROOT, John, saw]`, Buffer: `[dogs, yesterday]`
        * T+1 Stack: `[ROOT, saw]`, Buffer: `[dogs, yesterday]`
            * Record New Dependency (Arc): `say -> John nsubj (nonsubject)`
      * **RIGHT-ARC**: marks most recent item on stack as dependent of the second item in the stack, and removes firstitem from stack
            * T: Stack: `[ROOT, saw, dogs]`, Buffer: `[yesterday]`
            * T+1 Stack: `[ROOT, saw]`, Buffer: `[yesterday]`
                * New Dependency: `saw -> dogs dobj (direct object)`
    * Consider resulting dependency tree
      * ````
               root
         +------->------++------>---+
         |        nsubj ||          |
         |       +--<--+|+->-+      |
         |       |     |||   |      |
         ^       v     ^v^   v      v
        ROOT    John   saw dogs yesterday
        ````
      * Given a dependency tree, figure out steps
      * Check top of stack to see whether you should create arc
      * After creating an arc, record it, and remove dependent word
      * Figure out exactly what to do
      * npadvmod: NP as an adverb modifier
      * Steps:
         1. S: `[ROOT, John]`, B: `[saw, dogs, yesterday]`
         2. S: `[ROOT, John, saw]` B: `[dogs, yesterday]` (SHIFT)
         3. S: `[ROOT, saw]`, B: `[dogs, yesterday]`, NDP: saw -> John, nsubj (L-ARC)
          * Always choose LEFT-ARC over SHIFT when both are valid and generate the same tree
         4. S: `[ROOT, saw, dogs]`, B: `[yesterday]` (SHIFT)
         5. S: `[ROOT, saw]` B: `[yesterday]` NDP: saw -> dogs, dobj (R-ARC)
         6. S: `[ROOT, saw, yesterday]` B: `[]` (SHIFT)
         7. S: `[ROOT, saw]` B: `[]`, NDP: saw -> yesterday, npadvmod (R-ARC)
         8. S: `[ROOT, saw]` B: `[]`, NDP: ROOT -> saw, root (R-ARC)
* **Gap degree example**
  * Gap degree of a word in a dependency tree is the least k for which the subsequence consisting of the word and its descendents (both direct and indirect) is entirely comprised of k+1 maximally contiguous substrings.
  * look at al its dependents and look at the phrases formed by all of the dependents
    * see how contiguous the phrases are
  * For each word check substring consisting itself and all descendents, all substrings are continuous here so k = 0. Every substring can be represented as a k+1 substring.
    * `ROOT`: `ROOT John saw dogs yesterday`
    * `John`: `John`
    * `saw`: `John saw dogs yesterday`
    * `dogs:` `dogs`
    * `yesterday:` yesterday
  * ROOT always attaches to the head of the parse tree (recall right hand head rule)
    * we won't have a correct analysis 
  * Assume we don't have dependency tree, when do we make decisions
  * Suppose partial parse
    * Stack: [ROOT, John, saw], B: [dogs, yesterday]
    * We need to decide transision
    * `SHIFT`: Shift dogs onto stack
    * `LEFT-ARC` saw -> John
    * `RIGHT-ARC` `John -> saw`
* **PyTorch**
  * Input: word level features (word embeddings)
    * `torch.nn.Embedding(size, shape)`
    * `torch.nn.Embedding.from_pretrained(...)`
      * make sure you don't free pre-trained embedding
  * One linear (fully connected hidden layer)
    * `hidden_layer = torch.nn.Linear(input_size, output_size)`
    * to apply: `hidden_layer(features)`
  * See `torch.nn.relu(...)` and `torch.nn.dropout(...)`
  * Use softmax layer to obtain probability distribution over transitions
    * `torch.nn.CrossEntropyLoss`
    * `torch.nn.functional.CrossEntropy`
  * Suppose NN gave us `LEFT-ARC`.
    * we need to implement the oracle to establish ground truth that peeks into parsed tree and tells us the correct transition
    * what conditions need to be met to make a particular transition
    * how to make process automatic
    * oracle always prefers L-ARC over SHIFT
    * think about preconditions for each transition