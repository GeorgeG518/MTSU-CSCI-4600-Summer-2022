! George Gannon
!
! This is a screwaround file for working with arrays in fortran. It helps me get a feel
! for how arrays work and also their operations
PROGRAM arrayops
    real, dimension(50) :: numbers
    real, dimension(25,1) :: numbersmod ! like a giant column
    real, dimension(2,25) :: numberstable, values
    real, dimension(2,5):: fivebyfivearray
    real, dimension(2,1) :: matmuled

    numbers(1) = 50 ! sets the first element of numbers to 50 numbers(0) would lead to an error.
    numbers(1:50) = 0.1 ! sets all elements in numbers to 0.1
    numbers(:)=1 ! equivalent to above
    numbers(2:50:2) = 2 ! sets every even numbered index to 2 start:end:stride

    print *, "Shape from SHAPE() function = ", SHAPE(numbers) 
    print *, "Calling reshape() on numbers..."   
    numberstable =reshape(numbers, SHAPE(numberstable)) 
    print *, "reshaped = ", SHAPE(numberstable)
    values(:,:)=10

    numberstable = numberstable*5 ! that is really stinking cool
    numberstable = numberstable+10
    print *, numberstable 

    numberstable = numberstable * values ! major note...this iS NOT matrix multiplication. It is multiplying element by element
    print *,"Multiplication piece by piece = ", numberstable
    numbersmod(:,:)=0.1
    
    matmuled = MATMUL(numberstable, numbersmod)
    print *,"Matrix multiplication = ", matmuled

END PROGRAM
