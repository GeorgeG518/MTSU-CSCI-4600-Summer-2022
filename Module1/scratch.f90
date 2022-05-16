! George Gannon
! CSCI 4600
! This file will act as a sort of notes document, or "scratch" pad.
! It is not really supposed to be compiled or ran, it just has my notes
! and is placed into a f90 file so I have syntax highlighting!
PROGRAM MAIN
!!! FORMS
! Fortran has two different 'forms': fixed and free form.
! They are specified by the file extension. f90, f95 will result in free, f, .for or F will be (F)ixed form
! It is worth mentioning that F or F90 will lead to the code being preprocessed like C code

! Fixed form is a result of standards before Fortran 90 (Released in 1990)
! Fixed form was originally intended to be punch card compatible, so there are a few rules:
!
! Col. 1 Blank/comment gutter
! Col 1-5: Intended for Statement Labels
! Col 6 Continuation of Previous line
! Col 7-72 actual code statements
! Col 73-80: Sequence number (not often used)
!
! After punch cards fell out of use (for obvious reasons), free form code became more common
! All the above rules are gone. Code tends to look more modern.
! I will be using free form for the duration of my study. I need to be aware of fixed form though
! because many legacy codes use it and haven't been modernized.
!
! Here are a few fortran standards: f66, f77, f90, f96, f2003, f2015, f2018


!!! COMMENTS
! As you can see, fortran has comments delimited by !, however
! a few other chars are allowed:
c This is allowed
C This is also allowed
* This is allowed too
! Some standards allow for D or d to represent debug statements


!!! NAMING CONVENTIONS
! Fortran is case insensitive in its keywords, variables and function headers.
      
      X = x 
      print = Print = PRINT = pRinT 
      do whiLe = do WHILE = dO wHiLe
      in = IN = iN = In
      function doStuff()
      end function
      
      function doSTUfF() ! Will throw an error because we redefined it.
      end function

! I find this to be pretty funny

!!! BASIC Program Structure
! Entry points are defined by PROGRAM. There can only be ONE program
! Fortran also has Subroutines and functions. There is a distinct difference between these


END PROGRAM
