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

    SUBROUTINE getfile()
        print *, ""
        print *, "Enter the name of the file: "
    END SUBROUTINE
    
    SUBROUTINE ERROR()
        print *, "Something went wrong...try again please"
    end subroutine

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

        arow = size(a,1)
        acol = size(a,2)
        brow =size(b,1)
        bcol = size(b,2)

        DO i=1, arow 
            DO j =1, bcol
                accumulator=0
                do k=1, acol
                    C(I,J)=C(I, J)+A(I,K)*B(K,J)
                end do

            END DO
        END DO
    END SUBROUTINE

    SUBROUTINE gaussianelim(a,b,c)
        real, dimension(:,:),intent(in)::a,b
        real,dimension(:,:), intent(inout)::c
        integer:: i, j , k
        print *, 'yup'

    END SUBROUTINE

    SUBROUTINE checkfile(inputfile)
        character(128), intent(inout)::inputfile
        logical::exists
        inputfile=''
1010    continue
        CALL getfile() 
        READ(*,*) inputfile
        INQUIRE(file=trim(inputfile),exist=exists)
        IF(exists .eqv. .false. ) THEN
            CALL ERROR()
            GOTO 1010          
        end if

    END SUBROUTINE
END MODULE matrix_ops

PROGRAM MAIN
    use matrix_ops
    implicit none
    integer::i,j,k, ierr
    character::CHOICE
    real, allocatable:: mat1(:,:), mat2(:,:), resultmat(:,:), tempmat(:,:)
    character(128)::filename

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

        CALL checkfile(filename)
        OPEN(20, file=filename) 
        READ(20, *) i, j
        allocate(tempmat(j,i))
        allocate(mat1(i,j))
        READ(20, *) tempmat
        mat1 = transpose(tempmat)      
        deallocate(tempmat)
        filename=''

        CALL checkfile(filename)
        OPEN(21, file=filename)
        READ(21, *) j, k
        allocate(tempmat(k, j))
        READ(21, *) tempmat
        allocate(mat2(j,k))
        mat2 = transpose(tempmat)
        deallocate(tempmat)

        allocate(resultmat(i,k))


        CALL MYMATMUL(mat1, mat2, resultmat)
        allocate(tempmat(k,i))
        tempmat = transpose(resultmat)
        print *, "The resulting matrix (Column based) is: "
        do j=1, size(resultmat,1)
            print *, tempmat(:,j)
        end do

        deallocate(tempmat)
        CLOSE(20)
        CLOSE(21)
    ELSE IF(CHOICE .eq. 'g' .or. CHOICE .eq. 'G') THEN

        CALL checkfile(filename)
        OPEN(20,file=filename)
 
        CALL gaussianelim(mat1,mat2,resultmat)
    ELSE
       GOTO 1000
    END IF 
    deallocate(mat1)
    deallocate(mat2)

END PROGRAM

