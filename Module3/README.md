
# Getting Started
No outside requirements here. 

-----------------------------------------------------------------------------------------------------------------

# A Few Things About the Module
------------------------------------------------------------------------------------------------------------------
My intention with this module is to do some independent math learning. I am familiar with the idea of ODEs and PDEs
but not really too knowledgeable on how they play into programming.
I am not taking numerical analysis, but I feel like it would be a good idea to at least touch on some concepts from it
so I can better understand the codes that are given to me at work.

I also want to touch on interpolation, Fourier transformations, and Taylor series. 

Really this module is going to be just looking around and trying to round out my math knowledge that I didn't get from class.
My vision is that I will have a bunch of jupyter notebooks that are made from me following along with videos or chapters from 
my book. 

I want to create jupyter notebooks that serve as examples of how to code the math concepts, but also serve as a reference for them. 

# Final Thoughts
Without a shadow of a doubt, this feels like my most rewarding module that I have done so far. Having these notes in the jupyter notebooks
will be so so helpful in the future as a quick reference.

I started with the linear algebra notebook as that was where I felt like I needed
to know the most. I took notes on vectors and norms and then figured out how to program it all. My biggest issue was I knew most of the theory but I didn't actually know how to program most of it. Matrix multiplication for example...didn't know you could use np.dot. That was
actually the source of my revelation: matrix multiplication really is just dotting each row by each column of the matrices. So helpful
in memorization of how to do that. Knowing how to solve the systems of equations by something besides Gaussian Elimination really helped too.
Working out the LU factorization by hand felt like a good use of my time as I have seen that pop up countless times but never knew what it 
actually meant. I also took notes on some useful numpy array slicing use cases [elementary row operations]: swapping rows, swapping columns, scalar multiplication, row summation.

After finishing that, I went to the ODE notebook. Most of this was just note taking on concepts because I've never had Differential Equations class.
I watched a lot of youtube, did a lot of reading and took some notes in my notebook [the digital one]. I also worked some stuff out by hand
which I haven't had to do since Calc 3 back in Spring of 2020. I was a little rusty with my arithmetic but once I got past that I started
enjoying myself. After taking sufficient notes to make sure I understood the basic concepts, I used the MTSU COMS-REU notebook as a reference on  how to solve things symbollically using sympy, and then I used this video [https://www.youtube.com/watch?v=MM3cBamj1Ms&t=708s&ab_channel=Mr.PSolver] for the numerical methods. I actually suggest this channel very much because he's relatively
small in terms of subscribers and views, but his content is fantastic. He also knows what he's talking about because he has a Master's degree
so that really helps out in taking him serious. I didn't cover Euler's Method or Range Kutta in this notebook, but I did end up covering
Euler's Method in the Numerical Analysis module. Range Kutta seems like a cool thing to implement in Julia as a capstone project [along with Gauss-Seidel Method].


The final notebook I did was the numerical analysis notebook. I started by talking about Interpolation because that shows up all the time
at work. I also took notes on each of the methods I used by having these huge blocks of their documentation straight in the notebook. That will come in handy. After talking about interpolation, I went to Numerical Methods. It is kind of interesting to see how related they all are. Newton Raphson, Finite Differences, and Euler's Method all seem extremely similar in terms of general concepts
In addition to taking notes about a lot of math, I also got exposed to LaTeX as I could put them straight into my markdown blocks.
That had always been one of my more "ehh idk a lot about that" skills. Now I feel like I can do basic equations so that was a great
skill to pick up. 

I am very pleased with the results of this Module, hopefully I will be able to keep up with more of the things they talk about when solving
these complex engineering problems.



# Daily Log

## 6/27/2022 
Started math module officially. Created linalgnotebook.ipynb

## 6/28
Worked my way through vectors, nearly half way done with matrices. Taking simple ELI5 notes, and also cells showing how to program the operations
I am talking about

## 6/30
Finished up some matrix terminology and also sent off my progress report. I am trying to keep up a lesson, example, code format for the notebook.
Unrelated to the module, but I also setup Julia lang on my WSL

## 7/1/2022 - 7/8/2022
Worked on pretty much linalg stuff the whole timeperiod. My git logs are a bit better at showing what I did day by day, but basically I worked
on July 4th the most. That day I added the most content and got to solving systems of equations. On the 7th I finished some definitions and started the
LU decomposition, and today I finished that and the inverse matrix stuff. Also started the ODE notebook

## 7/11/2022
Worked a little bit on taking notes about Differential Equations, worked out an example by hand to add to my notes so that way I can see the work a bit better. 

## 7/12/2022
Today's focus is talking about 4 fundamental models and then going into my first solving implicity/numerically

## 7/14/2022-7/16/2022
Officially finished up my math module. Completed the numericalanalysis notebook in pretty much one sitting.
I had to come back to Euler's Method as it was getting late and I wanted to go into it with a clear mind. 


------------------------------------------------------------------------------------------------------------------

# File List

## linalgnotebook.ipynb
Jupyter notebook that contains all of the linear algebra stuff that I think is important.

## numericalanalysis.ipynb
Kind of sporadic, but has some interpolation methods and also some numerical methods. I have a method of root finding, differentiating and approximating ODEs

## ODEnotebook.ipynb
ODE notes and also how to programmatically solve them.