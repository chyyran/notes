# Adversary Approach

Let problem \(P\) be to find both a min and max element of a list of \(n = 2k\) elements.

The naive algorithm is to scan the list twice, where we have \(n-1\) comparisons to find the max, and \(n-2\) to find the min, totaling \(2n-3\) comparisons. 

A better algo is to pair each element with another, and find the min and max. Then we have \(\frac{n}{2}\) comparisons, \(\frac{n}{2}-1\) to find the max, and \(\frac{n}{2}-1\) to find the min. Then \(\frac{3n}{2} - 1\) comparisons total.


Is there an even better algorithm? There answer is no. Any comparison algorithm that solves \(P\) will do at least \(\frac{3n}{2} - 1\) comparisons.

Proof by adversary argument:

Posit a game where we add arrows between nodes by asking an adversary. If `x > y` for some node, we add an arrow from `x` to`y`.

```
    X
   / \
  v  |v
  U  | Y
   \ | ^
    \|/ 
     v
     W
```

The game ends when we have exactly one winner (all arrows coming out of it), one loser (all arrows coming in), and exactly \(n-2\) mixed nodes. The adversary will choose to delay the game for as long as possible, choosing winners and losers so as to force the game to continue if possible.

At any point during the game there are 4 types of nodes.

* \(N\), which was never compared.
* \(W\), which has so far always won.
* \(L\), which has so far always lost.
* \(M\), which has won some and lost some challenges.
  
Initially before the game begins, all the nodes are never compared. 

|Status|Initially|End|
|---|---|---|
|Never Compared \(N\)|\(n\)|0|
|Always Wins \(W\)|0|1|
|Always Loss \(L\)|0|1|
|Mixed \(M\)|0|\(n-2\)|

The adversary can not create cycles when adding edges. The point is to delay the creation of \(n-2\) mixed nodes for as long as possible.

The adversary uses the following strategy
* If the game is between a winner and a non-winner, the winner wins.
* If the game is between a loser and a non-loser, the loser loses.
* For any other comparison, an arbitrary edge can be drawn.
  
The only scenario where we create a mixed node is when we have a challenge between 2 losers or two winners, where the adversary picks an arbitrary edge.

There are 10 types of competitions since there are 4 types of nodes.

* NN -> WL
* NW -> LW
* NL -> WL
* NM -> (W|L)M

* WW -> WM
* WL -> WL
* WM -> WM

* LL -> LM
* LM -> LM
  
* MM -> MM

The only case which we can have cycles is the MM case. For all other cases we can orient an edge to not cause a cycle.

Starting from \(n\) elements of node type \(N\), we need to create \(n-2\) \(M\) nodes. We create mixed nodes when we compare two winners or two losers, so we need to do at least \(n-2\) comparisons to create sufficient mixed nodes. To create a mixed node, we need to create at least \(n-2\) winners or losers that will eventually become mixed. Eventually we also need to create one winner that is the max, and one loser that is the min.

So we need to create at least \(n\) winner or loser. Each comparison creates at most 2 winners or losers (NN).

Since each comparison creates at most two, we need at least \(\frac{n}{2}\) comparisons to create \(n\) winners or losers.

* We need \(\frac{n}{2}\) comparisons to create \(n\) winner or losers to create \(n-2\) mixed nodes
* We need at least \(n-2\) comparisons to create \(n-2\) mixed nodes.

Hence we must use at least \(\frac{3n}{2} -2\) comparisons
