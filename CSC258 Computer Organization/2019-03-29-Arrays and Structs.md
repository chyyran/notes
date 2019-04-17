# 2019 03 29

* A pointer is an address to data
* Used to pass by reference


Consider the for loop

```c
for (int i = 0; i < 100; i++) {
    A[i] = B[i] + 1;
}
```

We need an index `i`, the arrays `A`, `B`, and an *offset* to tells the difference between the first element and the ith element.
    
