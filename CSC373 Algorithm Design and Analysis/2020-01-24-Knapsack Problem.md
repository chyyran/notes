# 2020-01-24 Knapsack Problem

* List of \(n\) items with integral size \(S_i\), and value \(V_i\)
* Knapsack \(S\). We want to maximize the sum of values, such that the total size is less than or equal to \(S\)

* Guessing: is \(i\) in the subset of chosen items or not
* Subproblems: suffixes of items \(S_[i:]\). 
  * pluck items from the beginning
* \(DP(i) = \max(DP(i+1), DP(i+1) + V_i)\)?
  * We can't represent \(S_i\) here, it's not keeping track of the size bound.
* Subproblem: suffixes of item, and remaining capacity \(X \leq S\).
* Then the number of subproblems is \(\Theta(nS)\)
* \(DP(i, X) = \max(DP(i + 1, X), DP(i+1, X-s_i) + V_i\)
  * In the case where we don't choose \(i\), no remaining capacity is used up (and no value is added).
  * In the case where we choose \(i\), we subtract remaining capacity, (and still consume the item), and also add the value.
* This is "pseudopolynomial" on \(n\), the number of items, and \(S\) the size of the knapsack.
* 
## DP Guessing
