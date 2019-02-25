# Processor Components

* motivate what the rest of the course is like

* what is a computer
* After ALUs and FSMs, 
  * a device that does math on some data, and store it, and
    does some more data

High level

```
        Controller Unit
               ^
               |
Storage Unit <-+-> Arithmetic Unit

```

* **datapath** is where all data computations take place
  * often a diagram version of *real wired connections*
* **control unit** manipulates the datapath to make an operation happen.

For example, let's try to calculate \(x^2 + 2x\).
We need a 
* ALU (to +, -, * values)
* Muxes (to determine what inputs feed to the ALU)
* Registers (to hold intermediary values in the calculation)


What are the steps do we need to be able to move the data back and forth to calculate the value?

* Load X into RA and RB
* Multiply RA RB
* Add X to RA 
  * store in RA
* Add X to RA
  * RA now contains X^2 + 2X

To store something in RA, we need to turn the load signal `ldRA` on.

Who sends this signal?

The control unit, that is synchronized to the system-wide `clock`, and `resetn`.

* Outputs the *datapath control signals*
* Some architectures output a done signal.
  

## Microprocessors
* How things work in the datapath?
  * Combination of the units of these things so far