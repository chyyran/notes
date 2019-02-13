# 2019-02-13


Recall the state table from last week

|State|FF|Transition|Result|FF|
|---|--|----------|------|--|
|D|000|0|000|D|
|D|000|1|001|D1|
|D1|001|0|001|D1|
|D1|001|1|011|D2|
|D2|011|0|011|D2|
|D2|011|1|111|A|
|A|111|0|111|A|
|A|111|1|110|A1|
|A1|110|0|110|A1|
|A1|110|1|100|A2|
|A2|100|0|100|A2|
|A2|100|1|000|D|

Now we need to turn this into a Karnaugh Map. \(F*\) denotes the next input for a flipflop given a set of inputs. 



## \(F_2*\)
| | \(F_0'Click'\)|\(F_0'Click\)|\(F_0Click\)|\(F_0Click'\)|
|------|---------|---------|---------|------|
|\(F_2'F_1'\)| 0 | 0 | 0 | 0
|\(F_2'F_1\) |X|**X**|**1**|0|
|\(F_2F_1\)  |*1*|**1**|**1**|*1*|
|\(F_2F_1'\)|*1*|0|X|*X*|

* Grouping rule of thumb
  * look for the corners, the isolate groups
  
After grouping the middle square, and a wraparound on the bottom left \(F_2* = F_1Click + F_2Click'\). This is the formula for the (most significant bit.)


We continue with K-maps for each flip flop.
## \(F_1*\)

| | \(F_0'Click'\)|\(F_0'Click\)|\(F_0Click\)|\(F_0Click'\)|
|------|---------|---------|---------|------|
|\(F_2'F_1'\)| 0 | 0 | **1** | 0 |
|\(F_2'F_1\) |*X*|X|**1**|*1*|
|\(F_2F_1\)  |*1*|0|**1**|*1*|
|\(F_2F_1'\)|0|0|**X**|X|

\(F_1* = F_0Click + F_1Click'\)

## \(F_0*\)
| | \(F_0'Click'\)|\(F_0'Click\)|\(F_0Click\)|\(F_0Click'\)|
|------|---------|---------|---------|------|
|\(F_2'F_1'\)| 0 | *1* | *1* | **1**|
|\(F_2'F_1\) |X|*X*|*1*|**1**|
|\(F_2F_1\)  |0|0|0|**1**|
|\(F_2F_1'\)|0|0|X|****X**|


\(F_0* = F_2' + F_0Click'\)


One way of doing this is like so, with 2 ANDs fed to an OR
```
Click --+
  |  +--| +
  +--&--+ |  +-----+
  |     O----| F_2 |----+
  ~-=&--+ |  |>    |    |
     |    |  +-----+    |
     +------------------+   
          +-----------+
            +-----+   |
            | F_1 |---+
            |>    |
            +-----+

            +-----+
            | F_0 |---
            |>    |
            +-----+
```



Or we could use a mux

```
Click --+                             CLK_50
    +---|-----------------+            |
    |  +-+     +-----+    |           +V-----------+
  +-+--|0|-----| F_2 |----+-------EN--|Rate Divider|---Bomb
  |  +-|1|     |>    |                +------------+
  |  | +-+     +-----+    
  |  +---------------------+   
  |  |  C                  |
  |  | +-+  +-----+        |
  |  +-|0|--| F_1 |--------+
  |  +-|1|  |>    |
  |  | +-+  +-----+
  |  +----------------------+
  |  |  C                   |
  |  | +-+   +-----+        |
  |  +-|0|---| F_0 |--------+
  +---~|1|   |>    |
       +-+   +-----+
```


..and so hooked up with a mux instead. Notice that the click is hooked up in such a way that \(F_0\) is always the opposite of \(F_2\), thus we have the NOT going to the 1. Note that C denotes a connection to click (that is the select signal for the mux).