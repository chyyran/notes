Let \(P\) be a problem, and \(A\) an algorithm that solves \(P\). Then what is the cost of running \(A\)? That is, what is the cost of the best possible algorithm for solving \(P\)? Rather, there is no better algorithm than \(A\) to solve \(P\). 

For example, the problem of sorting a list. Consider heapsort and merge sort, both take \(n \log n\) worst case comparisons. Are these algorithms optimal?

We will be proving that any **comparison based** algorithm that sorts \(n\) numbers takes \(\Omega(n \log n)\) comparisons. Then this implies that heapsort and merge sort are optimal.

Consider decision tree of insertion sort:

\(a_1\leq a_2 \leq ... \leq a_k | a_{k+1} ... a_n\)

At iteration \(k+1\), when we compare \(a_k, a_{k+1}\), then if \(a_k \leq a_{k+1}\), then \(a_{k+1}\)stays in place. Otherwise we compare \(a_{k-1}, a_{k+1}\). 

Decision trees for `<a1, a2, a3>`


```
           <a, b, c> 

             <a:b>
            /     \
           /       \
          <=        >
          /          \
        <b:c>        <a:c>
        /   \       /    \
       /     \     <=     >
      <=      > <b, a, 3>  \
      /        \            \
 <a, b, c>     <a:c>        <b:c>
               /   \        /   \
              <=    >      <=    >
              /      \ <b, c, a>  \
         <a, c, b> <c, a, b>   <c, b, a>
        
```


Notice that there are \(n!\) leaves. Since we have \(n!\) different permutations, we have at least \(n!\) leaves in its decision trees. Each leaf is an inverse permutation, and there are up to \(n!\) such unique permutations. Since there are \(n!\) distinct permutations in a list, the decision tree \(A\) has at least \(n!\) leaves. Let \(T_A\) be the decision tree that models \(A\). \(|Leafs(T_A)| \geq n!\). Let \(H = Height(T_A\)\), and it is the number of comparisons done in the worse case. Note that the decision tree is a binary tree. Since \(T_A\) is a binary tree, \(2^h \geq |Leafs(T_A)| \geq n! \implies h > \log(n!) \in \log(n \log n) \implies h \in \Omega(n \log n)\)