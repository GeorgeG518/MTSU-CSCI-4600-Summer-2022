! George Gannon
! While reading about loops, I came across the story of Mariner 1 being lost
! due to improper fortran code. This is the code that caused the issue.
! Press c for the intended behavior, w for wrong.
! Mainly did this to see what this was talking about, but also to feel how 
! keyboard, if statements, and loops worked.
! It is worth mentioning that a lot of people blame the launch error on this
! but it wasn't because of this...it DID happen at nasa though during Project 
! Mercury [slightly more horrific because astronauts were now in the equation]
! http://spiff.rit.edu/classes/phys317/lectures/boom/fortran.txt
      PROGRAM LOSTSATELLITE
      character::choice
1000  continue

      PRINT *, "Enter a choice: (c)orrect, or (w)rong"
      READ(*,*) choice
      
      IF (CHOICE .eq. 'c') THEN
      SUM = 0
      DO 10 I=1,10
10      SUM = SUM + I  
      WRITE(6,*) SUM

      ELSE IF (CHOICE .eq. 'w') THEN
! This block of code is wrong. The comma necssary was replaced by the dot.
! This caused the fortran compiler to say variable DO20I=1.10 bc spaces are ignored

      SUM = 0
      DO 20 I=1 . 10
20      SUM = SUM + I  
      WRITE(6,*) SUM
      WRITE(6,*) "Nefarious... ", DO20I ! wow 
      ELSE
        GOTO 1000 ! LOL 
      END IF
      END PROGRAM
