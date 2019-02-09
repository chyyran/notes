# Bloom filters
* Space efficient "probabilistic dictionary"
  * searches are not 100% accurate
  * space efficient, less than \(n\).
  * uses hashing
  * maintain the fingerprints of the elements of a set \(S\).
 
 `BF_Insert(B, x)` \(: S \gets S \cup \{x\}\)
` BF_Search(B, x)` -> No, or Probably Yes (but maybe not)

  * If BF_Search returns "No", then x is definitely not in S.
    * Otherwise it may be in S.

```rust
trait BloomFilter<T> {
    fn Insert(mut self, x: T) -> Self {
        for let i = 1...t {
            self[h[i](x)] = 1;
        }
        self
    }
    fn Search(self, x: T) -> bool {
        self.reduce(|x, p| p && self[h[i](x)] == 1)
    }
        // None, or Some(Option(x))
}
```
Example: Malicious URLs
  * Huge set \(S\) of malicious URLs
  * Store only a bloom filter of \(S\) userside
  * If the `BF_Search` returns no, then it's safe. If it returns yes, then fall back to a server side?   
  * If \(S\) is 500MB total, we can use a bloom filter of size 10MB, with false positive rate of around 2%. 

* Array `BF[0...m-1]` of `m` bits, initially all 0.
* \(t\) independent hash functions, \(h_1, h_2, ..., h_t\), where \(h_i: U \to \{0, 1, ..., m-1\}\), and each hash function assumes SUHA.

```
BF  | Index
----|-------
0   | 0 
0   | 1
0   | 2
... | ...
0   | m-1
```

## Example

### Insert
Consider this BF of 8 elements, and \(t = 2\) hash functions \(h_1, h_2\).

```
BF  | Index
----|-------
0   | 0 
0   | 1
0   | 2
0   | 3
0   | 4
0   | 5
0   | 6
0   | 7
0   | 8
```

And then \(BF_Insert(x_1)\) has \(h_1(x) = 0, h_2(x) = 3\), so we flip those bits.


```
BF  | Index
----|-------
1   | 0 
0   | 1
0   | 2
1   | 3
0   | 4
0   | 5
0   | 6
0   | 7
0   | 8
```

If \(x_2\) hashes to 5, and 6, for example, flip those as well and vice versa.


```
BF  | Index
----|-------
1   | 0 
0   | 1
0   | 2
1   | 3
0   | 4
1   | 5
1   | 6
0   | 7
0   | 8
```

If \(x_3\) hashes to 0 and 7, only flip 7, since 0 is already set.

```
BF  | Index
----|-------
1   | 0 
0   | 1
0   | 2
1   | 3
0   | 4
1   | 5
1   | 6
1   | 7
0   | 8
```

### Search

Simply hash the element \(x\), and check if **both** (more specifically all of \(t\) hash functions) indices have value 1. If any one of these bits are 0, then we know that it can not have been added. But there can be false positives due to overlap.

The fingerprint of \(x\) are the indices \(h_1(x), h_2(x), ...,h_t(x)\)

### Probabilty
* \(n = 10 000 000\)
* decide to allocate 8 = \(m / n\) bits per URL (much less space required to store 1 URL) Hence \(m = 8m = 8 * 10 000 000 = \text{10 MB}\)
* \(t = 0.69 * 8 = 5.52\) hash functions, so we might have to check if 5 or 6 hash functions gives a lower chance of hash functions
* \(P[\text{false positive}] = 0.62^{8} \approx 2%\)


## Probability of false positive.

* Insert \(x_1, ..., x_n\) into an empty \(BF[0...m-1]\) with \(t\) independent hash functions with SUHA
* Do \(Search(x)\) for \(x \notin x_1, x_2, ..., x_n\)
* \(P[\text{false positive}]\) = \(P[BF_{Search}(x) = Yes]\)

For an arbitrary index \(i\) of BF, \(P[BF[i] = 0]\) after inserting \(x_1, ..., x_n\).

\(P[BF[i] = 0] = \frac{}{} \Pi^{n}_{k=1} \Pi^{t}_{j=1} Pr[h_j(x_k) \neq i] = (1-\frac{1}{m})^{nt}\) 

* \(1-y \approx e^{-y}\) for small \(y = \frac{1}{m}\)

\[e^\frac{-nt}{m}\]

* note that each probability that it will flip a bit to 1 is \(\frac{1}{m}\), and we are doing ](t\) hashes, \(n\) times. by SUHA these are independent events.
 
After each insertion, the probability that it is set to 1 is  \(P[BF[i] = 1] \approx 1 - e^\frac{-nt}{m} = q\). 


Hence \(P[\text{false positive}] = P[BF[h_1(x)] = 1] \cap BF[h_2(x)] = 1 \cap ... \cap BF[h_t(x)] = 1]]\)

These events aren't exactly independent, but its close enough as if we could treat them as independent.

Since we just assigned \(P[BF[i] = 1] \approx q\), then \(P[\text{false positive}] \approx q^t = (1 - e^{-nt/m})^t\)

We're going to fix the ratio \(\frac{m}{n} = \frac{\text{\# bits in the BF}}{\text{\# of elements}}\).

For some fixed value of \(\frac{m}{n}\), we find \(t\) that minimizes false positives, which is \(t = \log_{e} 2 \frac{m}{n} \approx 0.69\frac{m}{n}\). Then the probability of false positives becomes \(\approx 0.62^\frac{m}{n}\) with optimal \(t\).

> midterm/final notes
> * how a bloom filter works
> * what is the optimal \(t\)? for some \(m, n\), what is the false positive rate given optimal \(t\)?

