using LinearAlgebra
using Printf
function main()
    x1::Float32 = 0
    x2::Float32 = 0
    x3::Float32 = 0
    converged::Bool = false
    epsilon = 0.01

    oldx = [x1 x2 x3]
    #=
    Attempting to solve system of equations:
    8x+3y-3z = 14
    -2x-8y+5z= 5
    3x+5y+10z = -8
    =#

    for i=1:50
        x1 = (14-3*x2+3*x3)/8
        x2 = (5+2*x1-5*x3)/(-8)
        x3 = (-8-3*x1-5*x2)/(10)
        x = [x1 x2 x3]

        dx = √(dot(x-oldx, x-oldx)) # finding the square root of the dot product of 
        @printf "%d %.4f %.4f %.4f\n" i x1 x2 x3
        if dx < epsilon
            converged = true
            println("Converged!")
            break
        end

        oldx = x
    end
end

main()