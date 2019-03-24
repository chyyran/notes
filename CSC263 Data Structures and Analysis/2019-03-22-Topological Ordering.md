# 2019 03 22

Consider this directed graph

```
Wake Up ---> Open Eyes
   |         /   |
   |        /    |     
   V       V     V   
Check Phone     Get out of bed -> Go to school
```

What order should we do these things so we can eventually go to school

1. Wake Up
2. Open Eyes
3. Check Phone
4. Get out of bed
5. Go to school

This is one such ordering that we can eventually finish all the tasks

What if we have a cycle?


```
Wake Up ---> Open Eyes  Motivated <--> Not Depressed
   |         /   |     /
   |        /    |    / 
   V       V     V   v
Check Phone     Get out of bed -> Go to school
```

Now we can't solve the problem.

However, we can always solve the problem if there is a cycle!H

We find the node that has no dependencies, and we delete it from the graph, and repeat. The order where we delete thing things is the order.

Or we can do a DFS on the graph. We basically DFS(G) for v in G do DFS(v). Then the finish time gives us a topological order.

What happens if we can not do it? 

Proof 1.

We need to do u first, but somehow we end up doing v first. That means f[v] > f[u]..

What color is `u`?

1. v is white then f[v] < f[u]
2. v is grey X (G acyclic)
3. v is black f[v] < f[u]

We consider every possible edge, and v finishes first after u. 

Then we take the reverse order

Proof 2.

Tree edge f[u] > f[v]
forward
back X (G is acyclic)
cross

Recall a property of DFS

