# Week 3 Review

## Question 1
**How do you write 78 as an 8bit number?**
*64 + 8 + 4 + 2* = 1001110

**What is the 2's complement of 01101101**
*10010010 + 1 = 10011011*

**What is the sum of 01101101 01101101**?

````
   11  1 11
-----------
   01101101 # 109d
 + 01101101 # 109d
----------- 
   11011010 # 218d
````

Notice this is a bit-shift left. Remember that a n-bit shift left multiplies the number by \(2^n\)

## Question 2
Use don't care cases to group

|         |\(C'D'\) |\(CD'\)|\(CD\)|\(C'D\)|
|---------|---------|-------|------|-------|
|\(A'B'\) |1        |1      |x     |1      |        
|\(AB'\)  |1        |0      |0     |x      |
|\(AB\)   |x        |0      |0     |1      |
|\(A'B\)  |1        |0      |0     |x      |

Notice we can group the two edge sides, and the top row thanks to don't care cases.

## Question 3
Implement a half adder in Verilog

## Question 4

```verilog
module sevenseg(Segments, Input);
    output reg [0:7] Segments;
    input [3:0] Input;

    always @(*)
    begin
        case (Input)
            4'b0000: Segments = 7'b0000001; // 0
            4'b0001: Segments = 7'b1001111; // 1
            4'b0010: Segments = 7'b0010010; // 2
            4'b0011: Segments = 7'b0000110; // 3
            4'b0100: Segments = 7'b1001100; // 4
            4'b0101: Segments = 7'b0100100; // 5
            4'b0110: Segments = 7'b0100000; // 6
            4'b0111: Segments = 7'b0001111; // 7
            4'b1000: Segments = 7'b0000000; // 8
            4'b1001: Segments = 7'b0001100; // 9
            4'b1010: Segments = 7'b0001000; // A
            4'b1011: Segments = 7'b1100000; // b
            4'b1100: Segments = 7'b0110001; // c
            4'b1101: Segments = 7'b1000010; // d
            4'b1110: Segments = 7'b0110000; // E
            4'b1111: Segments = 7'b0111000; // F
            default: Segments = 7'b0000000; // default (8)
        endcase
    end
endmodule
```