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
  * We can represent polynomials as a vector of coefficients \(<a_0, a_1, ..., a_i>\), a vector of roots, or **a vector of samples \((x_0, y_0), ... (x_i, y_i)\)**.
  * With samples, addition and multiplication is \(O(n)\), by adding/multiplying all the \(y_i\)s, but evaluation is \(O(n^2)\)
  * Remember that \(A_e(x) = \Sigma^{\frac{n}{2}}_{k=0}a_{2k}x^k\) and \(A_o(x) = \Sigma^{\frac{n}{2}}_{k=0}a_{2k+1}x^k\)
  * Then \(C(x) = C_e(x^2) + xC_o(x^2)\), where \(C = A \cdot B\). The \(x^2\) makes the index of the \(k\) equal.
  * The recurrence for this algorithm is \(T(n, |X|) = 2T(\frac{n}{2}, |X|) + O(n + |X|)\) Without any other information, this is \(O(n^2)\).
  * We need to find some way so that every time we square the members in \(X\), the size of \(X\) become smaller.
  * This is where we need the roots of unity. Every time we square, the number of roots collapse.
  * Hence, \(|X| = m \implies |X^2| = \frac{m}{2}\).