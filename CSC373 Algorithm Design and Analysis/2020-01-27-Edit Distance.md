# 2020-01-27 Edit Distance
[KT 6.6, DPV 6.3]
* Notes based on Vassos Hadzilacos's CSCC373 Lectures in Fall 2019. Lectures 11

* Given two strings \(x[1..m]\) and \(y[1..m]\), how similar is \(x\) to \(y\)? We define similarity by the minimum number of edits required to transfer \(x\) to \(y\).
* What is an edit?
  * Mutate a character at \(n\) 
  * Delete a character
  * Insert a character
* Some alignment will result in a lesser number of edits.
* This alignment requires 4 edits
  ```
  boarder-
  -barbers
  --------
  DM  M  I
  ```
* This alignment requires 3 edits
  ```
  boarder-
  b-arbers
  --------
   D  M  I
  ```
* This is the optimal alignment problem:
  * Input: Two strings \(x\) and \(y\) of length \(m\) and \(n\).
  * Output: Edit distance between \(x\) and \(y\).
* Consider an optimal alignment of \(x\) and \(y\). 
  There are 3 cases. In the following, let \(c(s, j)\) be the cost of transforming the character \(s\) to \(j\), including where \(s\) or \(j\) is the null character - or \(\emptyset\). 
  1. \(x[m]\) and \(y[n]\) line up at the end
     ```
     x [0, 1, ..., m-1] x[m]
     y [0, 1, ..., n-1] y[n]
     ```
     This is also an optimal alignment for `x[m-1]` and `y[n-1]`.
     This is not necessarily the case that \(m = n\), as we could have dashes in between.
     This case is \(ED(m, n) = ED(m-1, n-1) + \delta(m, n)\)
     Where \(\delta\) is the diff function, that is \(c(x[m], y[m])\) if \(x[m] \neq y[n]\), and 0 otherwise.
  2. \(x[m]\) lines up with a dash at the end
     ```
     x [0, 1, ..., m-1] x[m]
     y [0, 1, ..., n]     -
     ```
     This is also an optimal alignment for `x[m-1]` and `y[n]`.
     This case is \(ED(m, n) = ED(m-1, n) + c(x[m], \emptyset)\)
  3. \(y[n]\) lines up with a dash at the end.
     ```
     x [0, 1, ..., m]     -
     y [0, 1, ..., n-1] y[n]
     ```
     This is also an optimal alignment for `x[m]` and `y[n]`.
     This case is \(ED(m, n) = ED(m, n -1) + c(\emptyset, y[n])\)
  * Hence we can have our recurrence for the edit distance DP by taking the min of all three cases. 
  * From now on, we analyze the algorithm if \(c(s, j) = 1\) for all \(s, j\).
  * Trivially, we then have \(ED(0, n) = n\), and \(ED(m, 0) = m\). That is, to get a string of length \(n\) from the empty string is to insert every character, and from a string of length \(m\) to 0 is to delete every character.
  * The subproblems we have is to compute \(ED(i, j)\) for all \(i\) to \(m\), and \(j\) to \(n\).
  * Finally the original problem is \(ED(m, n)\).
  * The algorithm is as follows.
  ```python
  def edit_distance(x: str, y: str):
    for i in range(0, m):
        ED[i, 0] = i
    for j in range(1, n):
        ED[0, j] = j
    for i in range(1, m):
        for j i range(1, n):
            ED[i, j] = min([
                ED[i-1, j-1] + diff(i, j),
                ED[i-1, j] + 1
                ED[i, j-1] + 1
            ])
    return ED[m, n]
  ``` 
  Alternatively with cost function
  ```python
  def edit_distance(x: str, y: str):
    m = len(x)
    n = len(y)
    for i in range(0, m):
        ED[i, 0] = i
    for j in range(1, n):
        ED[0, j] = j
    for i in range(1, m):
        for j i range(1, n):
            ED[i, j] = min([
                ED[i-1, j-1] + diff(x[i], y[j]),
                ED[i-1, j] + cost(x[i], None)
                ED[i, j-1] + cost(None, y[j])
            ])
    return ED[m, n]
  ``` 
  * We can recover the optimal alignment as follows
  ```python
  def opt_align(x: str, y: str):
    i = len(x)
    j = len(y)
    while i != 0:
        while j != 0:
            if ED[i, j] = ED[i-1, j-1] + diff(x[i], y[i]):
                yield (x[i], y[j]) # x[i] and y[j] are aligned
                i, j -= 1
            else if ED[i, j] = ED[i-1, j] + cost(x[i], None):
                yield (x[i], None) # Deletion
                i -= 1
            else:
                yield (None, y[j]) # Insertion
                j -= 1
  ```