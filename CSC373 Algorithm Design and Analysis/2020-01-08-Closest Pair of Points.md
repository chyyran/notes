# 2020-01-08 Closest Pair of Points

> Given \(n\) points in the plane, find a pair with the smallest Euclidean distance between them.

This is a fundamental geometric primitive, used in a variety of problems. It's a special case of nearest neighbour/Euclidean MST/Voronoi.

* Brute force: Check all pairs of points \(p\) and \(q\) with O(n^2) comparisons.
* *1D-Version*: O(n log n) easy if points are on a line
* Assumption: no two points have the same \(x\) value.
  

## Algorithm
* Divide: draw vertical line \(L\) so roughly half the points are on each side
* Conquer: Find closest pair in each side recursively
* Combine: find closest pair with one point in each side (is this O(n^2)?)
  * If we assume the distance is \(\delta\), which is the min of the two distances of the each side. We only need to check points within distance delta, since we have already checked distances outside of \(\delta\).
    * We sort points in the \(2\delta\) strip by \(y\) coordinate.
    * Split the section into a boxes of half of \(\delta\). No two points are in the same box, (since otherwise \(\delta\) would be smaller),  \(\delta\)
    * Look at the 8 closest points from the first point. If any distance is smaller than \(\delta\), that is the closest pair.
      * Only need to look at 8 because we only look at the boxes on the other side.
      * Otherwise no closest pairs exist within the strip.
  

Then the steps in our algorithm

* Compute separation line such that half of each points on each side (O(n log n))
* Find deltas recursively (2 T(n/2)) (for both sides)
* Delete points further than delta from the separation line (O(n))
* Sort points in the remaining split (O(n log n))
* Scan points in y order and compare (O(n))

We then have T(n) <= 2T(n/2) + O(n log n)
By the master theorem, (a = 2, b = 2) we have O(n log n). (Use the second case of master theorem, written as \(f(n)=\Theta(n^{\log_b a}\lg^k n)\), then \(T(n) = \Theta(n^{\log_ba}\lg^{k+1} n)\) . More formally (since our term is O(n log n))

