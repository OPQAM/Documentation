Just some random notes on BrainFuck, which I have recently learned about and seems very interesting.

BrainFuck is a very minimalistic Turing-Complete programming language with only 8 different operations.

**Operations:**

+            ---->  add 1
-            ---->  subtract 1
,            ---->  user input
.            ---->  output value in cell
>            ---->  move one cell to the right
<            ---->  move one cell to the left
[            ---->  if byte at data pointer is zero, move to matching ]
]            ---->  if byte at data pointer is nonzero, move back to [

I'm "making up" arythmetic operations in BF.

These won't be optional or great for now - merely just a hobby and part of my learning of memory management and programming 101.

**Addition:**

4 + 3 = 7

++++>+++<[>+<-]>.

**Subtraction:**

4 - 3 = 1

++++>+++[-<->]<.

**Multiplication:**

2 * 5 = 10

++[>+++++<-]>.

Note: add more if you want, and make the process cleaner/more reasonable
