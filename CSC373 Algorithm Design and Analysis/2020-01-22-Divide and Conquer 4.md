# 2020-01-22 Divide and Conquer 4

## In palace partition
The naive algorithm is as follows

```python
def partition(A, p, r):
    x = A[r]
    i = p - 1
    for j = p to r - 1
        if A[j] <= x:
            i = i + 1
            A[i], A[j] = A[j], A[i]
    A[i+1], A[r] = A[r], A[i+1]
    return A[r]
```

We randomize to avoid chance of O(n^2) to obtain n log n average time.

```python
def randomized_partition(A, p, r):
    i = randomize(p, r)
    A[r], A[i] = A[i], A[r]
    return partition(A, p, r)
```
```python
def randomized_quicksort(A, p, r):
    if p < r:
        p = randomized_partition(A, p, r)
        randomized_quicksort(arr, p-1, r)
        randomized_quicksort(arr, p+1, r)
```

## Divide and conquer i-th smallest element in array
Naive algorithm is to sort, then pick the \(i\)th on the left. Then we have \(O(n \log n)\) time from the sort. 


We can do this with D&C in linear time.
```python
def randomized_select(A, p, r, i):
    if p == r:
        return A[p]
    q = randomized_partition(A, p, r)
    k = q - p + 1
    if i == k: # pivot is target
        return A[q] 
    else if i < k:
        return randomized_select(A, p, q - 1, i)
    return randomized_select(A, q + 1, r, i - k)
```

The idea is to pick a pivot at random, then count how many are put in the left partition (everything to the left is smaller than the pivot). If \(k\) items are put into the left partition, but we're trying to find the \(i > k\)th smallest element, we only need to look at the right partition, and vice versa. 