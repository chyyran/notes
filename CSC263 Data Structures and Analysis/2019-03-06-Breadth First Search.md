# 2019-03-06 Breadth First Search
* Breadth first search computes the shortest path to each node.
* Can we prove this? Why is it correct?
* Recall the algorithm for bread first search.
  * We use a FIFO queue.
  * When we discover a new node, we color it grey, and put it into the queue. 
  * Once we've discovered all children for a nodes, color it black
  * Discover the next node in the queue.

The claim is that the discovery path to a node `v` is the shortest path.

* Recall that for a node `v`, `d(v) = d(u) + 1`, where `u` is the parent node of `v`.

Let \(D: =s \to u_1 \to u_2 \to ... \to u \to v\) be the discovery path.
Define \(\delta(s, v) := |s \to v_1 \to v_2 \to ... \to v_R \to v|\). that is \(\delta\) is the shortest path from \(s\) to \(v\). By definition, \(\delta(s, v) \leq d[v] = d[u] + 1\) (since \(\delta\) is the shortest path by definition.)

Thence, we have the lemma

> After BFS(S), \(\forall v \in V. d[v] \geq \delta(s, v)\). 

We would like to show
> After BFS(S), \(\forall v \in V. d[v] = \delta(s, v)\). That is, \(d[v]\) *is* a shortest path.

Before that we need a lemma,

> If a node \(u\) enters the queue \(Q\) before another node \(v\), then \(d[u] \leq d[v]\). That is, that if a node enters before another node, the first node has a shorter or equal path to the root than the node that entered after. **The distance is monotonically increasing**. 

We have to prove this first.

> Suppose for contradiction that the lemma is false. That is if a node \(u\) enters the queue \(Q\) before a node \(v\), then \(d[u] > d[v]\). Let \(v\) be the first node that violates the lemma. That is, \(v\) is a the first node that \(d[u] > d[v]\) for some previous \(u\) that entered \(Q\) before \(v\).

Can \(v = s\)? Well if so, then \(u\) can not exist, since nothing goes inside the queue before \(s\). Hence \(v \neq s\). Is it possible that \(u = s\)? Then \(d[u] = d[s] = 0 \implies 0 > d[v]\). Which would mean that \(d[v]\) is negative, which is impossible since \(d[v] \geq 0\). 

Neither \(u\) nor \(v\) are the source node \(s\). The source is the only node that enters the queue for free.

Hence \(u\) and \(v\) entered \(Q\) during exploration of \(u'\) and \(v'\). \(d[u'] = d[v'] + 1\). As well, \(d[v] = d[v'] + 1\). 

By assumption, \(u' \neq v'\), since \(v\neq u\). Hence we have two different nodes. \(u'\) discovers \(u\), and \(v'\) discovers \(v\). We know that \(u\) is in \(Q\) before \(v\) is. Hence \(u\) is discovered first. 

Since \(u\) discovered by \(u'\), before \(v\) was discovered by \(v'\). \(u'\) was explorer before \(v'\) was discovered. \(u'\) entered \(Q\) before \(v'\) entered \(Q\)

```
[u', ..., v', ..., u, ... v]
```

And \(d[u] > d[v]\). By definition, \(v\)is the first node that violates the lemma. Hence \(d[u'] \leq d[v']\), **by definition**! If we add one to both, we have \(d[u'] + 1 \leq d[v'] +1\ \iff d[u] \leq d[v]\). Which is a contradiction!


Suppose for contradition, that \(\exists v \in V. d[x] \neq \delta(s, x)\). That is the algorithm made a mistake. Out of all the nodes where the algorithm made the mistake, take \(v\) to be the closest node to \(s\) such that \(d[v] \neq \delta(s, v)\). By the lemma, we have \(d[v] > \delta(s, v)\). It can not be smaller than the shortest path. 


```
S
|
|
|
|
u
|
|
v
```

Since \(v\) is the closest node to \(s\) for which there was a mistake, \(\delta(s, u) = d[u]\), that is that the parent of \(v\) has discovered path exactly the shorted path of \(u\). Also note that \(\delta(s, v) = \delta(s, u) + 1\)

Thus by assumption, we can see that \(d[v] > \delta(s, v) = \delta(s, u) + 1 = d[u] + 1\). 

Thence, \(d[v] > d[u] + 1\). We want to show this is impossible. 

Suppose \(v\) is white.
* When we begin to explore \(u\), we have an edge \(u \to v\). Hence we discover \(v\). Then \(d[v] = d[u] + 1\) is set. Hence \(d[v] > d[u] + 1\) is impossible.

Suppose \(v\) is black
* If \(v\) is already black then it was taken out of the queue first. Then \(v\) entered the queue first! By lemma 1, \(d[v] \leq d[u]\). Which is a contradiction.

Suppose \(v\) is grey
* Then \(v\) was discovered by somebody, but not by \(u\). Lets say \(w\) discovered \(v\) in the past. Then \(d[w] \leq d[u]\). Then \(d[v]] = d[w] +1\). But \(d[w] + 1 \leq d[u] + 1 = d[v] \leq d[u] + 1\). But then that contradicts \(d[v] > d[u] + 1\). 

Hence it must be so that \(d[v] = \delta(s, v)\).