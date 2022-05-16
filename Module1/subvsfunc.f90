! George Gannon
! CSCI 4600
!
! This program is designed to show the major differences between 
! subroutines and functions. 

! Subroutines are 
SUBROUTINE subcube(num, answer, somethingelse)
        integer, intent(in):: num
        integer, intent(out):: answer
        Character(len=16), intent(out) :: somethingelse

        answer = num**3
        somethingelse = "Something Else\n"
END SUBROUTINE

FUNCTION funccube(num) result(answer)
        integer, intent (in):: num
        integer             :: answer

        answer = num**3
END FUNCTION


PROGRAM main
        implicit none ! saving some hurt
        integer :: ans
        Character(len=16) :: k

        external subcube ! kind of like a function header
        call subcube(8, ans, k)
        print *, "i^3 = ", ans
        print *, "here is ", k
end program


