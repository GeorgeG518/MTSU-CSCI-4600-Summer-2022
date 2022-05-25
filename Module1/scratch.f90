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
! I go into these difference more in the subvsfunc.f90 file in this Module 1 directory

! 5/19/2022
!!! Data Types/Declarations
! First, let me write about one of the more odd features of fortran: Fortran actually can
! use implicit typing similar to python...although it does it in an odd way.
! ALL variables if undeclared will have their type defined by the first letter of their name.
! i-n are integers, and all others are real.
! e.g. IMAX is an integer, PI is a real, JARULE is an integer
!
! This is kind of neat, but it may lead to type issues. I will almost always use implicit none
! which turns this feature off. 
!
! Variable Rules (f90)
! 1. Begin with a letter
! 2. Can end with letter, digit or underscore
! 3. Case INSENSITIVE
! 4. Up to 32 Chars in length 
! Fortran supports a few data types:
        integer :: defaultinteger, i, j, k
        ! Kind allows you to specify byte width of integer
        integer(kind=4)::fourbyteint
        integer(kind=8)::eightbyteint
        integer(kind=16)::sixteenbyteint
        integer(16) :: alsoworkslikeabove
!
        real :: p ! functions like a single precision real number-kind of like a float in other languages
        double precision :: doublethefun
        real(4) :: singleprecision
        real(8) :: sameasdoubleprecision
!
        complex ::x1,y1,z1 ! These are essentially Real part + (num) * i part e.g. 50 + 4i
        x1 = (0,1); y1 = (0,1) 
        z1=x1 * y1 ! z1 = -1
        complex(8) :: x2 ! Double Precision Complex
!        
        ! Parameter essentially turns the variable into a constant that cannot be modified past its
        ! initial declaration
        real, parameter :: e = 2.718281828459045
!        
        logical:: Boolean, otherBoolean ! How to declare bools [use later]
        character:: letter ! only one letter
        character(5)::word ! can only hold 5 characters 
        character(*)::otherword ! The length is determined somewhere else. ??? what is this
! I learned this through experience: the above types of data  declaration statement must be placed before all
! statements. They cannot be put in the middle of a function or subroutine or program

!!! ARRAYS
! Arrays are declared with this method:
! lets say I want to declare an array called numbers that is 50 long and is filled with floats
        real, dimension(50) :: numbers
!
! make a 2 x 5 2d array of floats
        real, dimension(2,5):: fivebyfivearray
!
! It's worth mentioning a few things here. First, fortran arrays are stored column based and one indexed.
! C arrays are row based and zero indexed. 
! REAL*4 is arr(20,10) is the same as float arr[10][20]
! Dimension can be thought of as allocating 20 columns of length 10, while C 
! can be thought of as allocating 10 rows of length 20.
! This is important when doing matrix operations because if you step the wrong way,
! you will DESTROY your performance by having a bunch of cache misses.
!
! Arrays can be indexed via these methods or accessed
    numbers(1) = 50 ! sets the first element of numbers to 50 numbers(0) would lead to an error.
    numbers(1:50) = 1 ! sets all elements in numbers to 1
    numbers(:)=1 ! equivalent to above
    numbers(2:50:2) = 2 ! sets every even numbered index to 2 start:end:stride
!
! Arrays have a few intrinsic functions that support operations:
! Transpose, pack, reshape
! Transpose finds the transpose (imagine that) of a matrix. It flips everything over the diagonal
! In the event of two different dimensioned arrays, the shape will change from n x m to m x n
! This is probably useful in the event of fortran c interfacing
    real, dimension(3,4) :: a
    real, dimension(4,3) :: b

    b= transpose(a)
!
! Pack basically functions like numpy.flatten...it takes a 2d array and makes it one dimensional.
    real, dimension(12)::c
    c = pack(b, .true.) ! the mask part is a bit weird to me
!
! Reshape takes a one dimensional array and converts it into the shape specified (if it can)
    a = reshape(c, shape(a))

!!! Program Control Flow
! There are a few program control flow statements I should know about, namely loops, conditionals
! and the ever dreaded GOTO which shows up all the time in classic fortran code
! The simplest way to do this would be to start with the for loop, and then do to the while loop, but neither really exist in terms of a keyword
! instead, there are do loops and do while loops which can serve the purpose of both
! the general form of do loops are the following:
! do var = start, stop [,step]
!    stuff and operations
! end do

  do i = 1, 10
    print *,numbers(i) 
  end do
! While loops are done using do while loops which have the following form:
! do while(logical expr
!    some stuff, things, and operations
! end do


 !!! MINI SECTION: Logic
! logic in fortran is...odd. I wil use the Booleans defined at the top for my work
! relational operators are not done with > or < == or anything like that, and T or F are not in their normal state.
! Why did they choose dots...I am not sure.
! Setting something true or false
    Boolean = .TRUE.
    otherBoolean = .false.
! relational operators cannot be used on booleans
    (5 .gt. 3) ! true, greater than
    (5 .lt. 4) ! false, less than
    (6 .ge. 5) ! True, greater than or equal to
    (6 .le. 7) ! True, less than or equal to.
    (5 .eq. 3) ! false
    (5 .ne. 3) ! true

! logical operators
    Boolean .and. otherBoolean ! False
    Boolean .or. otherBoolean ! True
    .not. otherBoolean  ! True
! boolean == and != are done this way.
    Boolean .eqv. .True. ! True
    Boolean .neqv. .False. ! True
!
! now that that is out of the way...
 do while (Boolean)
    print *, "Printing forever!"
 end do  
!
! it is worth noting that there are a few special loop keywords.
    Exit ! like break
    CYCLE ! like continue
!
!!! CONTROL FLOW CONTINUED
! If statements
IF Boolean THEN
    i =5
ELSE
    j = 8
END IF

! ELSEIF
IF (GRADE<50) THEN
    letter = 'F'
ELSE IF (GRADE < 60) THEN
    letter = 'D'
ELSE IF (GRADE < 70) THEN
    letter ='C'
ELSE IF (GRADE<80) THEN
    letter = 'B'
ELSE
    letter = 'A'
END IF

! Switch cases
SELECT CASE (I)
    CASE(1)
        letter = 'Y'
    CASE(2)
        letter = 'L'
    CASE DEFAULT
        LETTER = 'P' ! Still think its hilarious that i can just change cases half way through
END SELECT
END PROGRAM
