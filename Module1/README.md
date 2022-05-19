# Daily Log
## 5/16
Had to change to the WSL environment because oneAPI wasn't cooperating. 
Once I got WSL working, I started scratch.f90 and also subvsfunc.f90. I took some basic notes on Fortran

## 5/19
Today I took even more notes on fortran datatypes, finished my subvsfunc.f90 file, and also started a build system.
I had to add build files to the .gitignore.
Today's focus was datatypes, arrays, array slicing, array allocation

------------------------------------------------------------------------------------------------------------------

# File List
## scratch.f90
All my notes on fortran as I am learning. I try to organize it into sections via the !!! comment headers. 

## subvsfunc.f90
This file basically is a quick demonstration of the differences between functions and subroutines.

## CMakeLists.txt
This is my build system. It does require you to have Cmake installed, but you can run the following to build the module:
> cmake CMakeLists.txt
> make

