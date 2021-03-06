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

* numpy arrays [kinda obvious]
* multiprocessing/threading [how are they different/are they?, also-how do?]
* numba [JIT compiled python]
* cython [cdef stuff to make things a bit faster]
* cython wrapper to C[automatically generated C\/Python wrapper code]
* calling C code from python, returning values to python
* GPU offloading [I have a graphics card that I can abuse]

I am sure a few more things will come up during my module that I either hear at work or read about online.

# Final Thoughts
I had way more fun with this module than I did the first one, not because I dislike Fortran, but instead because this module scratched 
my itch for trying things and experimenting. I really enjoyed pushing Python to its limits, and was very overwhelmed by all of the 
different ways you can speed the language up. I didn't quite touch all of the ways I wanted to, but I think with what I learned, I will be
able to significantly make a dent in speed. 

Multiprocessing was *very* easy to get going, and very conceptually similar to C threads. I was pleasantly suprised by how close the syntax
was to the 

I wish I could have coded some things myself with the GPU offloading. I looked into Tensor Flow and PyTorch to do it, but got so wrapped around the axle with cython and testing multiprocessing [which worked, but I did not realize it]that I never got to try it myself.

Cython is kind of a weird situation. I did a project with Cython at work, so I did get exposed to it, but I couldn't get it working on my 
machine because it was a tad bit more niche. I did not want to sink anymore time into it, so I am chucking it for now. 

If I have extra time at the end of the summer, I want to experiment with ctypes to do some calls and also finish the cython implementation.

I am kicking myself for not getting to GPU offloading, but I think I'll be able to squeeze it in at the end of the summer or in a module where I am ahead. Here is to hoping!


# Daily Log
6/2/2022
First real day of working on this module. Layed out the repo, got a build system going. Started this README and fleshed it out.
I also pulled down my code from my personal MTSU linux account for the sake of having something I can test the speed of and 
know what to expect. I ran into an interesting problem...p1.c uses randomly generated points, but I had no way of knowing if
the python and c random generation functions worked the same. Turns out they don't so I already did some trickery-I imported
the C code shared object and called srand from python and got identical points to what I was getting in my C code.
I am hoping it doesn't bite me in the butt down the line, but it seemed okay. I intend to start the Module by rewriting the
C code into vanilla python then timing it. It may already be fast but we will see...

6/4/2022
Implemented the shortest/max distance program in python. It is now in the notebook. Numbers were very close to what I was getting in C
but I needed to change out its float declarations to doubles so that way the two would be more alike. They still differ by a few thousandths,
but I will take it considering we're in a different language and not using datatypes that are identical. After I got it implemented,
I started doing a basic optimization of it for my first speed up project. I will use numpy arrays next to see if they make it even faster.
I am liking this module more than the first one because it feels way easier to get what I want coded up.

6/6/2022 and 6/7/2022
Finished up the first part of the module where I am using libraries and different methods of writing code for speed ups.
I was very suprised by Numba and encourage anybody interested in speeding up python to check it out. It is quite OP. 
This weekend I plan to start the next part of the module which will focused on techniques that apply for most uses cases. 
I plan on calling C code, doing some parallelization, calling C code from python [really already did that with the random function]
and also looking at Cython. Cython may end up bringing me back to the first part of the module, because it may fit better there than in this part.
The plan is to keep it in the python timing notebook and just keep that one going.

6/11/2022
Started multiprocessing notebook and updated build system. Researching the best way to rejoin threads. 
Should not be too bad past this point [famous last words]

6/16/2022-6/20/2022
I have been having trouble getting the speed increases I want from my multiprocessing. I want to get it done so
I can move to the math movement, but I do have some extra time considering I don't have to spend a week writing the
paper, and I can take some time away from the Julia module at the end of the summer. I think getting multiprocessing 
right is much more important than learning another coding language. It is very close and will run, but it doesn't
actually speed anything up. Can't really tell why though. The logic is nearly the same as the C code considering 
it's python, and it is indeed spawning processes. I am going to attempt to run it in as a regular python file tomorrow
and maybe see if it's a jupyter notebook issue. Here's to hoping. Otherwise, I am not sure. I could try switching to threads
if that doesn't work, but I think they suffer from the GIL

6/21/2022
Finished up parallel and jotted down some notes about it all. Turns out multiprocessing was working the whole time, but I couldn't see the effects
of it because the regular python was so slow. Started the cython implementation but it requires some finesse with typing so it needs some more work

6/23/2022
Finished the typing of cython just to say I did it, but I think I am going to have to come back with it. I need to really start the math 
module, and I cannot sit here mucking for days with cython for speed increases that I can get with less effort using numba.
I want to come back to it at some point, but all things considered, I enjoy the progress I have made in this module enough to call it quits.


------------------------------------------------------------------------------------------------------------------

# File List
## srandtest.py 
Demonstrates the cimport into python but also shows how I am going to make arrays of points identical although they 
use different random generation functions.

## p1-normal/p1.c
Original C code I wrote for 3240 for the minimum maximum distance problem. Takes a seed and a number of points. 

## p1-parallel/p3.c
Parallel version of C code I wrote for 3240 for the minimum maximum distance problem. Takes a seed and a number of points. 

## pythontiming.ipynb
I will be doing all of my timing code in here and marking it up as I go. It will serve a similar purpose to scratch.f90

## pythonparallel.ipynb
Contains all of my parallel programming stuff. Used multiprocessing library in combination with numpy.

## T? 
All of the original Butler test files. I expect these to differ by a few thousandths because of the disparity in how
C and python handle floating point arithmetic.

## setup.py
Used to build the cython

## minmax.pyx
Cython "source" file.


