! George Gannon
! CSCI 4600
!
! This program is designed to show the major differences between 
! subroutines and functions. 

! Subroutines are distinct from functions in two ways: first is the fact that they can 
! return multiple items while functions can't. Looking at below, one can see that I return
! BOTH answer and somethingelse. The vars do have to be declared as out though. Second,
! is the face that subroutines need to be performed with the call keyword(see Program main)
SUBROUTINE subcube(num, answer, somethingelse)
        integer, intent(in):: num
        integer, intent(out):: answer
        Character(len=16), intent(out) :: somethingelse

        answer = num**3
        somethingelse = "Something Else"
END SUBROUTINE

! Functions are different based on the fact that they can only return one value, and also that they 
! can have a return type defined. Variables are supposed to be passed in as ins. 
! Call is not required here.
INTEGER FUNCTION funccube(num) result(answer)
        integer, intent (in):: num
        ! notice that because of the result keyword and the return type being defined,
        ! I don't have to define what answer's type is. This
        ! was a pain in the butt figuring out while trying to compile
        answer = num**3
        RETURN
END FUNCTION


PROGRAM main
        implicit none ! saving some hurt
        integer :: ans
        Character(len=16) :: k

        external subcube ! kind of like a function header that'd be found in header.h
        integer :: funccube
        call subcube(8, ans, k) ! note the use of call
        print *, "i^3 = ", ans
        print *, "here is ", k
        
        ans = funccube(9)
        print *, "9^3 = ", ans
       
end program


