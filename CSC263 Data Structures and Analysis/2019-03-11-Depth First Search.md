# Depth First Search

The algorithm keeps track of

```typescript
color(v) : White | Grey | Black 
p(v) = u iff u discovered v
d(v) = time when v is discovered
f(v) = time when v exploration is completed
```

Initially, all the nodes are white, and we have a global time counter variable.

Setup 

```python
Time = 0
for node in nodes:
    Color[v] = [W, W, W, W, ..., W]
    d[v] = MAX_INT
    f[v] = MAX_INT
    pv[v] = NIL
```

For each node that is white, call `DFS_Explore(G, v)`.

```python
for node in nodes:
    if node.color is White:
        DFS_Explore(G, node)
```

`DFS_Explore` is a recursive function, so just one call may turn a bunch of nodes black. The outer loop finds the next white node. 

```python
def DFS_Explore(G, u):
    u.color = Grey
    time += 1
    u.d = time
    for edge(u, v) in G.edges:
        if v.color is White
            v.p = u
            DFS_Explore(G, v)
    u.color = Black
    time += 1
    u.f = time
```


## Tree edge
* u is the parent of v
## Forward Edge
* u is an ancestor of v in the DFS forest
