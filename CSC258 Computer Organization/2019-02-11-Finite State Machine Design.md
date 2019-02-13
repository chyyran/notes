# 2019-02-11 Midterm Review


## Q1 
Consider the 4 bit register below


````
         D3 D2 D1 D0
          |  |  |  |
        +------------+
        |            |
Write---|            |
        |  Register  |
Clock---|>           |
        |            |
        +------------+
          |  |  |  |
         Q3 Q2 Q1 Q0
````

What does the *write* signal do?
* When `Write` is high, then on `posedge Clock`, the value will set
* `Clock` is on a regular interval, Write can go high or low asynchronously
* `Clock` is coming from an external signal, `Write` can be controlled 
* `Clock` is when you can, `Write` is if you should
* `Clock` is the synchronization signal
* Allows changes of every value at a time (don't change a single flipflop at a time).
* `Write` tells the entire row to change


## Q2

Given the 4-bit counter below, can you make a signal that goes every 10 clock cycles?

````
Clear----+ D3 D2 D1 D0
         |  |  |  |  |
        +~------------+
        |             |
Enable--|             |
        |             |
Clock---|>            |
        |             |
        +-------------+
            |  |  |  |
           Q3 Q2 Q1 Q0
            | ~&  | ~& # will go high when Q = 4'b1010 = 10d
            +--------+
            |   AND  |
            +--------+
                 |
                 CLOCK10
````

* How do you make a signal that goes high after every clock cycle    
* How do you make a signal that goes high every 100 clock cycles?
    * Take 2 of those connected in series

## Q3

For an FSM with 11 states, how many flipflops do you need to store the states?

* \(\lfloor\log_2(11)\rfloor = 4\) 

## Q4

How do make the exploding pen from *Goldeneye*?

* Pen starts disarmed
* Click 3 times to arm the grenade
* Click 3 more times to disarm

<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<svg width="475" height="425" version="1.1" xmlns="http://www.w3.org/2000/svg" style="background: white;">
	<ellipse stroke="black" stroke-width="1" fill="none" cx="38.5" cy="100.5" rx="30" ry="30"/>
	<text x="32.5" y="106.5" font-family="Times New Roman" font-size="20">S</text>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="128.5" cy="100.5" rx="30" ry="30"/>
	<text x="121.5" y="106.5" font-family="Times New Roman" font-size="20">D</text>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="128.5" cy="317.5" rx="30" ry="30"/>
	<text x="118.5" y="323.5" font-family="Times New Roman" font-size="20">D&#8321;</text>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="252.5" cy="317.5" rx="30" ry="30"/>
	<text x="242.5" y="323.5" font-family="Times New Roman" font-size="20">D&#8322;</text>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="381.5" cy="317.5" rx="30" ry="30"/>
	<text x="374.5" y="323.5" font-family="Times New Roman" font-size="20">A</text>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="381.5" cy="218.5" rx="30" ry="30"/>
	<text x="371.5" y="224.5" font-family="Times New Roman" font-size="20">A&#8321;</text>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="285.5" cy="100.5" rx="30" ry="30"/>
	<text x="275.5" y="106.5" font-family="Times New Roman" font-size="20">A&#8322;</text>
	<polygon stroke="black" stroke-width="1" points="68.5,100.5 98.5,100.5"/>
	<polygon fill="black" stroke-width="1" points="98.5,100.5 90.5,95.5 90.5,105.5"/>
	<polygon stroke="black" stroke-width="1" points="128.5,130.5 128.5,287.5"/>
	<polygon fill="black" stroke-width="1" points="128.5,287.5 133.5,279.5 123.5,279.5"/>
	<text x="113.5" y="215.5" font-family="Times New Roman" font-size="20">1</text>
	<path stroke="black" stroke-width="1" fill="none" d="M 123.373,71.06 A 22.5,22.5 0 1 1 148.749,78.523"/>
	<text x="150.5" y="26.5" font-family="Times New Roman" font-size="20">0</text>
	<polygon fill="black" stroke-width="1" points="148.749,78.523 158.138,77.602 152.035,69.68"/>
	<polygon stroke="black" stroke-width="1" points="158.5,317.5 222.5,317.5"/>
	<polygon fill="black" stroke-width="1" points="222.5,317.5 214.5,312.5 214.5,322.5"/>
	<text x="185.5" y="308.5" font-family="Times New Roman" font-size="20">1</text>
	<path stroke="black" stroke-width="1" fill="none" d="M 106.867,338.116 A 22.5,22.5 0 1 1 98.978,312.87"/>
	<text x="46.5" y="350.5" font-family="Times New Roman" font-size="20">0</text>
	<polygon fill="black" stroke-width="1" points="98.978,312.87 92.996,305.574 89.799,315.05"/>
	<path stroke="black" stroke-width="1" fill="none" d="M 274.731,337.469 A 22.5,22.5 0 1 1 250.173,347.292"/>
	<text x="282.5" y="401.5" font-family="Times New Roman" font-size="20">0</text>
	<polygon fill="black" stroke-width="1" points="250.173,347.292 243.363,353.821 253.058,356.274"/>
	<polygon stroke="black" stroke-width="1" points="282.5,317.5 351.5,317.5"/>
	<polygon fill="black" stroke-width="1" points="351.5,317.5 343.5,312.5 343.5,322.5"/>
	<text x="312.5" y="338.5" font-family="Times New Roman" font-size="20">1</text>
	<polygon stroke="black" stroke-width="1" points="381.5,287.5 381.5,248.5"/>
	<polygon fill="black" stroke-width="1" points="381.5,248.5 376.5,256.5 386.5,256.5"/>
	<text x="386.5" y="274.5" font-family="Times New Roman" font-size="20">1</text>
	<path stroke="black" stroke-width="1" fill="none" d="M 313.478,111.133 A 126.871,126.871 0 0 1 376.782,188.944"/>
	<polygon fill="black" stroke-width="1" points="313.478,111.133 318.253,119.269 322.884,110.406"/>
	<text x="358.5" y="135.5" font-family="Times New Roman" font-size="20">1</text>
	<polygon stroke="black" stroke-width="1" points="255.5,100.5 158.5,100.5"/>
	<polygon fill="black" stroke-width="1" points="158.5,100.5 166.5,105.5 166.5,95.5"/>
	<text x="202.5" y="91.5" font-family="Times New Roman" font-size="20">1</text>
	<path stroke="black" stroke-width="1" fill="none" d="M 411.336,319.172 A 22.5,22.5 0 1 1 398.321,342.199"/>
	<text x="446.5" y="368.5" font-family="Times New Roman" font-size="20">0</text>
	<polygon fill="black" stroke-width="1" points="398.321,342.199 397.093,351.553 406.191,347.402"/>
	<path stroke="black" stroke-width="1" fill="none" d="M 408.297,205.275 A 22.5,22.5 0 1 1 408.297,231.725"/>
	<text x="454.5" y="224.5" font-family="Times New Roman" font-size="20">0</text>
	<polygon fill="black" stroke-width="1" points="408.297,231.725 411.83,240.473 417.708,232.382"/>
	<path stroke="black" stroke-width="1" fill="none" d="M 284.194,70.646 A 22.5,22.5 0 1 1 308.402,81.304"/>
	<text x="317.5" y="29.5" font-family="Times New Roman" font-size="20">0</text>
	<polygon fill="black" stroke-width="1" points="308.402,81.304 317.832,81.595 312.796,72.956"/>
</svg>


Rewrite this diagram in truth table form

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

Note that we can push the NOT of the most significant bit from the right to set this counter on a high input.

Or alternatively, counting in binary...

|State|Transition|Result|
|-----|----------|------|
|000|0|000|
|000|1|001|
|001|0|001|
|001|1|**010**|
|010|0|**010**|
|010|1|**011**|
|011|0|**011**|
|011|1|100|
|100|0|100|
|101|1|110|
|110|0|110|
|100|1|000|

BUT, when we switch from D1 to D2, then you may encounter a race condition from D1 to D2, which may go from 010 to 011 to 010.

The first solution, only one bit changes at time, so no race conditions will be incurred.