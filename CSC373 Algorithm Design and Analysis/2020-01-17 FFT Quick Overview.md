# 2020-01-17 FFT

* Coefficient representation of a polynomial:
  * A(x) = a_0 + a_1x + a_2x^2 ...
    * Can be represented as a vector `[a0, a1, a2, a3, ..., an]`
  * B(x) = ...
* We can evaluate at \(x\) in `O(n)` by just adding all the vectors using the previous value of \(x\) in each next evaluation step.
  * This is Horner's Rule:
    ```python
    def horner(a, n, x):
      result = poly[0]
      for i in range(1, n):
        result = result * x + poly[i]
      result
    ```
    ```haskell
    horner :: Num a => a -> [a] -> a
    horner x = foldr (\a b -> a + b * x) 0
    ```
* Addition can be done by adding all the coefficients
    ```haskell
    add :: [a] -> [a] -> [a]
    add = zipWith (+)
    ```
* Can we do multiplication in \(n log n\)?
  * Divide coefficients into even and odd-indexed vectors
    * These vectors are also polynomials \(A_e\) and \(A_o\)
    * We can combine by evaluating \(A_e\) and \(A_o\) at \(x^2\), then \(A(x) = A_e(x^2) + xA_o(x^2)\).
  *   