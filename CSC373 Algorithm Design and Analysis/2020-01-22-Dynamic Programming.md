# 2020-01-22 Dynamic Programming

Consider the weighted interval scheduling problem.
Greedy algorithm doesn't work, because we need to consider weights.

Instead, we sort the based on finish time. Pick a job \(i\), then let \(p(j)\) the largest index \(i < j\) such that \(i\) is compatible with \(j\).
