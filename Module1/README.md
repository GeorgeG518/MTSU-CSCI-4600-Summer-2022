# Getting Started
If not built, run the following cmake commands:
```console
cmake CMakeLists.txt
make
```
All of the fortran codes were compiled with GNU fortran so unexpected behavior may occur with other compilers.

-----------------------------------------------------------------------------------------------------------------

# A Few Things About the Module
I really enjoyed getting familiar with Fortran. It was suprisingly easy to do a lot of operations that I thought were
going to be a pain in the butt. I was especially suprised with how simple reading in arrays was from a file. 

Here are a few lessons I learned in this project.
If i had to rank my languages that I have coded in from my most favorite to least favorite, this would be the list:
1. Python
2. C
3. Javascript
4. Fortran
5. C++
6. HTML
7. VBA
8. Assembly
As you can see, Fortran is actually pretty high in the list and I want to keep learning it. I imagine when I learn Julia at the end of the summer, 
this will change. A lot of work still needs to be done as far as learning more modern coding construct goes...Fortran 2003+ has a lot of new features that
would probably be really nice to learn, but I did not have time to do so. 

There were a few things about the language that I really enjoyed: the lack of case sensitivity was very useful and quite easy to adjust to. I enjoyed the fact
I did not really have to care about cases. I also enjoyed how its arithmetic was very similar to what I already knew, and you could also apply said arithmetic to entire arrays
in one big swoop. I enjoy the simplicity of its data types and operators, although they are a bit odd (mainly like the .ne. stuff when I mean odd).
On a personal note, tt felt nice to finally be able to code in this sort of mythical language. I remember being in High School watching Hidden Figures in 
AP Calculus and hearing about a character who was learning Fortran. I thought to myself "wow. that is pretty interesting sounding. It would be neat to see what that
code looked like" (I was oblivious to the fact that it was still around, and also that they coded it on punch cards). Now I can say I can somewhat code in Fortran.

There are a few things I did not really enjoy about Fortran:
Fortran's column based, 1 indexed arrays really hurt my work. It was very difficult to adjust to that workflow. I found it was much harder to wrap my head around how
my loops and arithmetic needed to work. I encountered the most resistance when i did my work with array multiplication as i had to rewire my head to stepping through
columns instead of rows. It did not help that I was trying to write fast code, so I found myself often stopping to see if I was stepping through my arrays in the right
order to ensure I did not cause cache misses. Eventually I just kind of put it out of my mind to think about later.

I was not a fan of the loop constructs in Fortran. I could have gone for some container for loops such as for each in container: dostuff()
They may be later additions to fortran that I just did not know about.

As a sort of wrap up statement, I think it was worthwhile learning fortran. There are a few things I had to learn the hard way while coding. More than a few times I was getting
compiler errors pertaining to my data block statements being after commands, or forgetting to put an implicit none...but that is part of the learning experience. 
I feel much better equipped to face any legacy code that is written in fortran in the future while I am working at the base.

------------------------------------------------------------------------------------------------------------------

# Daily Log
## 5/16
Had to change to the WSL environment because oneAPI wasn't cooperating. 
Once I got WSL working, I started scratch.f90 and also subvsfunc.f90. I took some basic notes on Fortran

## 5/19
Today I took even more notes on fortran datatypes, finished my subvsfunc.f90 file, and also started a build system.
I had to add build files to the .gitignore.
Today's focus was datatypes, arrays, array slicing, array allocation

## 5/24
Worked on some control flow stuff, loops, logic, relational operators,
and just a tiny bit of Input reading. Input reading from files works the exact same as from console,
but I change the handle from whatever the console's is to whatever my opened file's is. 
 
## 5/29
Started working on the capstone project. Got matrix addition working, but stepping through the array in fortran
is a bit weird to get used to. Going to come back to it with a fresh set of eyes tomorrow.

## 5/30
Finished the capstone project. Matrix multiplication was very easy to fix. Gaussian elimination proved to be much more 
difficult than I anticipated. For times sake, I copied an algorithm and adapted it to what I had...I know that may be cheating but
in my eyes it's valid because its common practice to borrow code like that. 

------------------------------------------------------------------------------------------------------------------

# File List
## scratch.f90
All my notes on fortran as I am learning. I try to organize it into sections via the !!! comment headers. 

## subvsfunc.f90
This file basically is a quick demonstration of the differences between functions and subroutines.

## CMakeLists.txt
This is my build system. It does require you to have Cmake installed, but you can run the following to build the module:
```console
cmake CMakeLists.txt
make
```
## arrayops.f90
Array operations in fortran...kind of like a beginning groundwork for the project I do later

## lostsatellite.f
Some fun toy code to demonstrate how Fortran's freedom can be a little destructive and downright evil..

## matrixops.f90
Capstone project. Has the ability to multiply arrays or find the Guassian elimination of an array. Also adds arrays
but that isn't really that impressive...
