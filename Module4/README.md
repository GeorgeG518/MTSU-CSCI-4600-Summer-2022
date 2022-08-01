
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
I first heard of Julia on reddit as being an interesting language to stick your toes into. It seemed like once I heard
about it, I heard about it every waking day. I figured it would be interesting to learn as an alternative to Fortran
or python. 

------------------------------------------------------------------------------------------------------------------

# Final Thoughts
Julia is easily a top three language for me now. It has been able to do everything I need it to do, and it has been fast while doing it.
It's got some strange quirks when it comes to type annotations and array slicing, but I have a feeling i am just not well versed enough in the
language yet to know the best ways to go about it. I was pleased with the performance and want to tinker with it some more to see if I can get it
even faster...because as far as Julia code goes mine is sloppy. I think if you enjoy Fortran, and also enjoy python, Julia might be a nice inbetween
that would be interesting to tinker with. I personally want to get involved with the community and wouldn't mind making my own packages. One that comes
to mind is doing something with graphics. Of course, Julia is open source so I could always do a merge request for an open issue as well. It is also not out of the
question to make tutorials or something like that once I got good enough.

I do still feel like I need to do more with Julia. I've come up with a shortlist of things I need to do:
* Interpolation
* GPU OFfloading
* ODE calculation
* Machine Learning

I can't imagine that they would be too bad, but I don't have the time to get all of them in before the end of the study [the next few days]. I am very glad that 
I ended up finding a nice Julia book that had the same general rigor of Python Programming and Numerical Methods. That other one just was not doing it for me.

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

### 7/28/2022 
Felt like I needed to do some more number crunching exercises so I figured I would implement the Gauss seidel method of
solving systems of equations. I meant to do it during the python math module but I did not. In order to do that I needed to
take some more notes on Linear Algebra methods, so I went ahead and made a third scratch notebook. Not sure what I need to do now,
I figured something reading in files would be neat and useful. Getting down to the wire here

### 7/31/2022
Finishing up my last few projects in Julia. I decided I needed to do something with File I/O so i implemented a more general case
of the Gauss method. While working on making it general, I actually caught a mistake from the Python implementation that I 
derived the Julia method from. The values being converged to in the book were not the correct values of the actual system because it
was dividing by the wrong value. The more general method works for the input file I used. 

I had heard Julia's plotting capabilities were pretty similar to python's so I figured i would give it a crack. I basically reimplemented a 
javascript program I did in CSCI 4250 and plotted the stuff in Julia's module and not a gl context. Turned out pretty good!


------------------------------------------------------------------------------------------------------------------

# File List
### T?
All of the test files for running the Julia code and comparing its timings to C

### scratchpt....
The three scratch notebooks act as note keeping locations for all my major Julia learning. 

### mod2injulia.jl
Exactly what it says. It is the Module 2 shortest distance script implemented in Julia, no multicore 

### gauss-seidel.jl
Julia implementaiton of Gauss Seidel method, fairly simple. Based off of a mix of the Python book's implementation
and also the Numerical methods of Scientific Computing  book I have.

### fern.jl
A Julia program that creates a Fern and plots it in a window.

### fileio.jl
More general method of gauss-seidel but now it supports file input for the matrix.


