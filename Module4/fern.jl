#=
Fern program

Generates a fern using a program
=#

using LinearAlgebra
using Plots


ITERATIONS = 10000

function generateFernPoints()
	xpoints = []
    ypoints=[]
    push!(xpoints,0 ) # push our starting point
    push!(ypoints,0 ) # push our starting point
    for i=2:ITERATIONS
        prob = rand(Float64)

        # x(n+1) = a * xn + b* yn + e
        # y(n+1) = c * xn + d * yn + f

        if prob <= 0.08
            a = 0.2
            b = -0.26
            c = 0.23
            d = 0.22
            e = 0
            f = 1.6
        elseif prob<=0.16
            a = -0.15
            b = 0.28
            c = 0.26
            d = 0.24
            e = 0.0
            f = 0.44
        elseif prob<=0.26
            a = 0.0
            b = 0.0
            c = 0.0
            d = 0.16
            e = 0
            f = 0
        elseif prob<=1
            a = 0.75
            b = 0.04
            c = -0.04
            d = 0.85
            e = 0.0
            f = 1.6
        end

        xplusOne = (a * xpoints[i-1]) + (b * ypoints[i-1])+ e
        yplusOne = (c * xpoints[i-1])+ d*ypoints[i-1] + f

        push!(xpoints, xplusOne)
        push!(ypoints, yplusOne)
    
    end

    return xpoints, ypoints
end

columns(M) = [ slice(M,:,i) for i in 1:size(M, 2) ]

xpts,ypts=generateFernPoints()
p1=scatter(xpts, ypts,color="green")
display(plot(p1))