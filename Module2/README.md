# Getting Started
If not built, run the following cmake commands:
```console
cmake CMakeLists.txt
make
```
All of the code was compiled using gcc, using another compiler may yield different speeds and such.
For consistency sake, I am using Python 3.9.7 and conda 4.10.3 


-----------------------------------------------------------------------------------------------------------------

# A Few Things About the Module
------------------------------------------------------------------------------------------------------------------
Python is a beautiful language in my honest opinion. It was very welcoming when I first became a programmer-the 
syntax was easy to understand, it was easy to write, and it was not overly complicated to get started writing programs
that were more than just toys. All that praise aside though, she is a bit slow at times. I remember Dr. Untch demonstrated
to us one time at the end of CS1 just how slow python was in comparison to C++ when performing an identical program
instruction.

A few years later, I now understand that python does not have to be slow *if you know what you are doing*. My intention
is to try out a few different speed up techniques/practices and record their times. I have heard a few things thrown around 
that can improve speed:
-numpy arrays [kinda obvious]
-multiprocessing/threading [how are they different/are they?, also-how do?]
-numba [JIT compiled python]
-cython [cdef stuff to make things a bit faster]
-cython wrapper to C[automatically generated C\/Python wrapper code]
-calling C code from python, returning values to python
-GPU offloading [I have a graphics card that I can abuse]

I am sure a few more things will come up during my module that I either hear at work or read about online.


# Daily Log
6/2/2022
First real day of working on this module. Layed out the repo, got a build system going. Started this README and fleshed it out.
I also pulled down my code from my personal MTSU linux account for the sake of having something I can test the speed of and 
know what to expect. I ran into an interesting problem...p1.c uses randomly generated points, but I had no way of knowing if
the python and c random generation functions worked the same. Turns out they don't so I already did some trickery-I imported
the C code shared object and called srand from python and got identical points to what I was getting in my C code.
I am hoping it doesn't bite me in the butt down the line, but it seemed okay. I intend to start the Module by rewriting the
C code into vanilla python then timing it. It may already be fast but we will see...


------------------------------------------------------------------------------------------------------------------

# File List
## srandtest.py 
Demonstrates the cimport into python but also shows how I am going to make arrays of points identical although they 
use different random generation functions.

## p1.c
Original C code I wrote for 3240 for the minimum maximum distance problem. Takes a seed and a number of points. 

## pythontiming.ipynb
I will be doing all of my timing code in here and marking it up as I go. It will serve a similar purpose to scratch.f90

## T? 
All of the original Butler test files. I expect these to differ by a few thousandths because of the disparity in how
C and python handle floating point arithmetic.

 
