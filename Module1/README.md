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
 
## 5/30
Started working on the capstone project. Got matrix addition working, but stepping through the array in fortran
is a bit weird to get used to. Going to come back to it with a fresh set of eyes tomorrow.

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
