# 2020-01-22 Dynamic Programming

Consider the weighted interval scheduling problem.
Greedy algorithm doesn't work, because we need to consider weights.

Instead, we sort the based on finish time. Pick a job \(i\), then let \(p(j)\) the largest index \(i < j\) such that \(i\) is compatible with \(j\).

* Just watch 6.046 for this lecture :(

Bruteforce algorithm is as follows

> Bruteforce:
>   Sort jobs by finish time and renuber so that \(f_1 \leq f_2 \leq ... \leq f_n\)
> Compute `p[1], p[2], ..., p[n]`

* Using DP, we can do this in n log n, and computing the optimal value is in linear time.