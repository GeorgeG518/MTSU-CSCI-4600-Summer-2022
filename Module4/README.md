
# Getting Started

1. First, you will need to download Julia Lang from the official website: https://julialang.org/downloads/
2. After you download it, you will have the Julia REPL which is notionally similar to the interactive python interpreter.
    Go ahead and open it up. You will see something like this:
    
    ![image](https://user-images.githubusercontent.com/58047574/179636398-d23912da-e297-41bf-ae81-ebbdddefc8c2.png)

3. If you want Julia Jupyter Notebook Interactivity, enter these commands into the Julia REPL:
    ```console 
    using Pkg
    Pkg.add("IJulia")
    ```

4. You are done. Now when you create a new jupyter notebook, you will have the option of creating a Julia notebook.

-----------------------------------------------------------------------------------------------------------------

# A Few Things About the Module
------------------------------------------------------------------------------------------------------------------

# Final Thoughts
# Daily Log
### 7/18
Started the Julia notebook. REally enjoy it! I have covered some variable assignment stuff and a whole lot of operator stuff
and math functions. Hopefully next session I will do file I/O, loops, and arrays.

### 7/20
Decided it would be best to break up that scratch notebook because it was starting to get too cumbersome to navigate. 
I started the second scratch and talked about data types along with function decorators. Didn't get to work on too much though.

### 7/24
Finished up my scratch part two notebook. I think I am in a good spot to start doing some
actual julia programs. I want to rewrite a few that I have done in the study as it would make for easy comparison.
I think my first one I will look at is the min max distance program from the speeding up python module. that would let me get some practice
calling C code from Julia, but also it would allow me to show the speed Julia has.

### 7/26/27 and 7/27/2022
I reimplemented that one function from Module 2 in Julia so that way I can compare it to C timings. Out of the box,
Julia is only slightly slower than C. Very pleased with it. Also, there were only a few things I had to look up:
ARGS stuff was new to me and also preallocating arrays of structs. Overall though, the code ended up being really readable. 
The only thing I wasn't really pleased about was the cumbersome function call needed to call that C lib. I didn't find anything
quikcly about how to do it in the pythonic way where you can have a handle to a library and call it that way. The syntax
just ended up looking clunky

------------------------------------------------------------------------------------------------------------------

# File List
### T?
All of the test files for running the Julia code and comparing its timings to C

### scratchpt....
Both of the scratch notebooks act as note keeping locations for all my major Julia learning. 

### mod2injulia.jl
Exactly what it says. It is the Module 2 shortest distance script implemented in Julia, no multicore 

