This will expand as I go, really just a overhead view

# 1. Environment Description:
## Installed Packages:
* git bash
  * Very useful because it gives me git, linux CLI, and linux workflows all on windows
 
* Julia lang [if I have time]
  * If I have time by the end of the semester, I want to learn Julia.
  * It appears that it is in a position to find use at the base if more people know about it...
    * Speed of Fortran but the ease of use of Python? Give it to me, please. 
    * Already being used by NASA as a replacement for Matlab and Simulink, so government is indeed adopting it.

* Anaconda3
  * I will not be using the anaconda installed with oneAPI

* WSL Ubuntu
  * Using this for all of my compilation as well as workflow. 
  * Configured to use bash
 
* gcc
  * I will be using gfortran for all my compilation

## System Information
### Processor: AMD Ryzen 5 5600X w/ 6 cores overclocked to 4.1ghz
### RAM: 32gb of ram
### GPU: Nvidia RTX 3060 graphics card
### Other Notes: <p> AMD has their own compilers optimized for their CPUs, but I will not be using them. They're essentially forks of LLVM anyway. Not sure what this will entail.
<p>

	

# 2. Resources:
	
## Books:
	
### Numerical Recipes in Fortran 77 / DIGITAL Fortran 90
* I will not use fixed form [*thank god*]
* The first book is for algorithm type stuff if I get stuck
* Both were gifts and the only fortran reference I have in book form
			
### Computational Physics by Michael Bestehorn
* Has more fortran code and also an online tar archive of computational physics stuff
* It's a little over my head, but it has some CFD, ODE/PDE and heat transfer problems with it that might be interesting to look at

### Python Programming and Numerical Methods: A Guide for Engineers and Scientists by Kong, Siauw, Bayen
* Not going to use the python programming tutorial in the first half...feel confident that I'm passed that point
* I WILL use the chapters on numerical methods and c interfacing

### Linear Algebra 2nd Edition by Lipschutz
* I got this book at Goodwill a few years ago before I went to college. I haven't had a LA class so it will be used as reference for any kind of stuff pertaining to it that

	
## Online:
	
### Fortran Reference
* https://en.wikibooks.org/wiki/Fortran
* https://www.mathcs.emory.edu/~cheung/Courses/561/Syllabus/6-Fortran/
			
### Markdown Text:
* https://www.markdownguide.org/basic-syntax/
		

	
# 3. General Rundown of Modules and goals by the end of the summer *SUBJECT TO MOST EXPANSION*:
## Every Module will have a README	
<p>The point of these are to learn markdown text formatting as that would be pretty useful, but also make writing the report easier. I want it to be a matter of copy and pasting instead of trying to write a full blown paper at the end of the summer.<p>	
	
These will Require the Following:
* Each file's purpose in that module
* What I learned/how I learned it
* How to run/prerequisites
* Short time/date log of when I worked on things for accountability

## Module Outline (Tentative) May 8th-August 5th
I want to start a week early because I'm bored but also for some wiggle room. Ideally want to be done by July 31st. (12-13 Weeks over 4 modules) to have a week to prepare the paper.
	
### Module One: Fortran (May 8th-May 29th)
Fortran still has its use cases after all of these years, and knowing the syntax and semantics would place me in a good position at work.

I want to cover the following:
* Short history of Fortran
* Syntax
  * Free vs Fixed form, how to specify which is being used
  * Math Expression syntax
  * Strings
* I/O
* Loops
* Logic
* Key Differences from C [arrays, data types, program structure]

This module will be considered "done" with a capstone project. It will essentially be a copy of a project I did for discrete a few years ago
* Read in matrix(ces) with dimensions specified (Through file I/O)
* Read in an operation
  * Operations: Addition/Subtraction, Multiplication, Boolean
  * New Operation: Gaussian Elimination! <- This one will take the most time.
* Output these to a file

Not going to really care about error checking like the other project.
					    
### Module Two: Speeding Up Python (May 29-June 23rd)
                                            
Python is heavily used at work, and one of the most common things done with it is boosting speed.

This module will be more "research" focused. I want to look at all the ways you can boost the speed of python.
* Threading
* Multiprocessing
* C/Fortran Interfacing
* Numba (JIT Compiled Python)
* Cython
* GPU Offloading                                            
* Maybe reading into some MPI stuff as a primer for the fall

The ideal capstone project would be to develop a program that can be ran using every method, and then have their timing results compared. 
Here\'s a few options: https://www.cs.cmu.edu/~scandal/nesl/algorithms.html
                                            
I like the idea of using Dr. Butler\'s ~~convex hull program~~ shortest/greatest distance program we did for systems. I can write up the algorithm from memory [unless I can get my CS account back] then implement it in python. As I research, I can just reimplement it with the new methods and keep them all in one notebook. 
  
### Module Three: The Math/Numerical Analysis Unit (June 23rd-July 14th)
Math is a huge part of my job, and I could definitely go for some improvement. I dread this module.
* Explore some ODE/PDE calculation in python and Fortran
* How does that works with various libraries? 
* Numerical methods like finite differences or Euler\'s Method
* Fourier transformations, interpolation, taylor series
* Use cases for all of these

                                            
### Module Four: Other Useful Stuff (July 14th-July 31st)
This module is still a bit in the air...
* I will be learning Julia

	




