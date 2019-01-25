# Logical Devices

* Combinational circuits are purely functional: The outputs rely strictly on the inputs. 

## Multiplexer (`mux`)
When you have multiple inputs, and a single input, you can switch between them.

```
     S
     | 
     +---+
X -n-|1  |
     |   |--n->M
Y -n-|0  |
     +---+
```

The output `n` bytes of `M` is the output of `X` or `Y` depending on the value of `S`.


|X|Y|S|M|
|-|-|-|-|
|0|0|0|0|
|0|0|0|1|
|0|1|0|0|
|0|1|1|1|
|1|0|0|1|
|1|0|0|1|
|1|0|1|0|
|1|1|0|1|
|1|1|1|1|

We can have at most \(2^n\) inputs for \(n\) select bits.

## Demultiplexer (`demux`)

Does the opposite of a muxer, sending input according to a select bit.
```
     S
     | 
     +---+
     |  1|-n->X
M -n-|   |
     |  0|-n->Y
     +---+
```

## Decoder

Something that can translate outputs of one circuit to the input of another.
