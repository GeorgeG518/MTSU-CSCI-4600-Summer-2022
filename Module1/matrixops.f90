! George Gannon
! 5/29/2022
!
! This is the capstone project for Module 1. I intend to work with some matrix operation type
! stuff to get a feel for number crunching and also feel how to step through using loops.
MODULE matrix_ops
    implicit none
    integer::MAX_ROW, MAX_COLS = 10 
    integer::rowcnt,colcnt = 0

    contains
    SUBROUTINE showoptions()
        print *, ""
        print *, "Please pick an operation from the below choices:"
        print *, "  (a/A) for Addition/Subtraction of a matrix"
        print *, "  (m/M) for multiplying two matrices"
        print *, '  (g/G) to perform Gaussian Elimination on a matrix'
        print *, ""
    END SUBROUTINE

    SUBROUTINE addition(a,b,c)
        real, dimension(:,:), intent(in):: a,b
        real, dimension(:,:), intent(inout):: c 
        c= a + b
    END SUBROUTINE

    SUBROUTINE mymatmul(a,b,c)
        real, dimension(:,:), intent(in):: a,b
        real, dimension(:,:), intent(inout):: c 
        integer::i,j,k, arow,acol, brow,bcol=0
        real :: accumulator

        arow = size(a,2)
        acol = size(a,1)
        brow =size(b,2)
        bcol = size(b,1)
        print *, arow, acol, brow, bcol

        DO i=1, arow 
            DO j=1, bcol
                accumulator=0
                do k=1, acol
                    C(I,J ) = C(I,j)+A(k,i)*B(j,k)
                end do

            END DO
        END DO
    END SUBROUTINE
END MODULE matrix_ops

PROGRAM MAIN
    use matrix_ops
    implicit none
    integer::i,j,k
    character::CHOICE
    real, allocatable:: mat1(:,:), mat2(:,:), resultmat(:,:)


1000 continue   
    CALL showoptions()

    READ(*,*) CHOICE
    IF (CHOICE .eq. 'a'.or. CHOICE .eq. 'A') THEN
        OPEN(20, file='in1.dat') 
        OPEN(21, file='in2.dat')
 
        READ(20, *) i, j
        allocate(mat1(j,i))
        READ(20, *) mat1
        
        READ(21, *) i, j
        allocate(mat2(j,i)) 
        READ(21, *) mat2
       
        allocate(resultmat(j,i)) 
        CALL addition(mat1, mat2, resultmat)
        PRINT *, resultmat

        CLOSE(20)
        CLOSE(21)
    ELSE IF(CHOICE .eq. 'm' .or. CHOICE .eq. 'M') THEN
        OPEN(20, file='in1.dat')
        OPEN(21, file='in3.dat')
 
        READ(20, *) i, j
        allocate(mat1(j,i))
        READ(20, *) mat1
        
        READ(21, *) j, k
        allocate(mat2(k,j))  
        READ(21, *) mat2
        allocate(resultmat(k,i))
        CALL MYMATMUL(mat1, mat2, resultmat)
        PRINT *, resultmat

        CLOSE(20)
        CLOSE(21)
    ELSE
       GOTO 1000
    END IF 
    deallocate(mat1)
    deallocate(mat2)

END PROGRAM

