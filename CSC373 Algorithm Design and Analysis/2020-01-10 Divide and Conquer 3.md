# 2020-01-10 Divide and Conquer 3

## Adding to n-bit integers 

Adding two n-bit integers is in O(n). Naive multiplication is O(n^2), can we use D&C to improve the time?

1. Split each integer into two n/2-bit integers
2. Multiply for n/2 bit initegers 4T(n/2)
3. Add two n/2-bit integers O(n)
4. Shift (1)
5. T(n) = 4T(n/2) + O(n) => a = 4, b = 2, d = 1, so by the master theorem, T(n) is \(O(n^{\log_2 4}) = O(n^2)\)


## Karatsuba multiplication

Let \(x = 2^{n/2} x_1 + x_0\)
Let \(y = 2^{n/2} y_1 + y_0\)

Then \(xy = 2^{n}(x_1 y_1) + 2^{n/2}(x_1y_0 + x_0y_1) + x_0 y_0\) which simplifies to \(2^n x_1 y_1 + 2^{n/2} ((x_1 + x_0)(y_1 + y_0) 0 x_1 y_1 - x_0 y_0) + x_0y_0

Then we only have three multiplications
* \(A = x_1 y_1\)
* \(B = (x_1 + x_0)(y_1+y_0)\)
* \(C = x_0 y_0\)


```haskell
karatsuba :: Num a => a -> a -> a
karastuba x y 1 = x * y
karatsuba x y n = 
    let 
        m = ceil $ n / 2
        x_1 = floor $ x / 2^m
        x_0 = x mod 2^m
        y_1 = floor $ y / 2^m
        y_0 = y mod 2^m
        A = karatsuba $ x1 y1 m
        B = karatsuba $ (x1 + x0) (y1 + y0) m
        C = karatsuba $  x0 y0 m
    in
        (2^2m) * A + (2^m)(B - A - C) + C
```

Each recursive call is \(T(n/2)\), so by the master theorem

\[
 T(n) \leq 3T(n/2) + O(n)
\]

So \(a = 3, b = 2, d=1\) which is \(O(n^{\log_2 3})\).


## Matrix multiplication

If `A` and `B` are two n-by-n matrices, the bruteforce algorithm is \(n^4\)

Can we use divide and conquer?

* Divide: partition A and B into 1/2n blocks
* Conquer: multiply 8 of these matrices recursively
* Combine: add appropriate products using 4 matrix additions

The recurrence relation is 

\(T(n) = 8T(n/2) + \theta(n^2) \implies O(n^{\log_2 8}) = O(n^3)\)

Can we improve this?

In **Strassen's algorithm**, the key idea is to multiply 2-by-2 block matrices using 7 multiplications.

\[
\left[\begin{matrix}
 C_1,1 & C_1,2 \\
 C_2,1 & C_2,2
\end{matrix}\right] 
= 

\left[\begin{matrix}
 A_1,1 & A_1,2 \\
 A_2,1 & A_2,2
\end{matrix}\right]

\times 

\left[\begin{matrix}
 B_1,1 & B_1,2 \\
 B_2,1 & B_2,2
\end{matrix}\right]
\]

He defined 7 matrices

* \(P_1 = A_1,1 \times (B_1,2 - B_2,2)\)
* \(P_2 = (A_1,1 + A_1,2) \times B_2,2\)
* \(P_3 = (A_2,1 + A_2,2) \times B_1,1\)
* \(P_4 = A_2,2 \times (B_2,1 - B_1,1)\)
* \(P_5 = (A_1,1 + A_2,2) \times (B_1,1 + B_2,2)\)
* \(P_6 = (A_1,2 - A_2,2) \times (B_2,1 + B_2,2)\)
* \(P_7 = (A_1,1 - A_1,2) \times (B_1,1 + B_1,2)\)

Notice we here have 7 multiplications instead of 8!

The block matrix \(C\) is calculated as follows

* \(C_1,1 = P_5 + P_4 - P_2 + P_6)
* \(C_1,2 = P_1 + P_2\)
* \(C_2,1 = P_3 + P_4\)
* \(C_2, 2 = P_5 + P_1 - P_3 - P_7\)

Then our recurrence relation is

\(T(n) = 7T(n/2) + O(n^2) = O(n^{\log_2 7} = O(n^{2.81})\)