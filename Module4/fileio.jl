using DelimitedFiles
using LinearAlgebra
using Printf
open("in4.dat","r") do io
    mat = readdlm(io, ' ')
    rows,cols = mat[1,1], mat[1,2]
    mat = mat[2:rows+1, 1:cols]

    xtargets = zeros(Float64, cols-1)
    oldx = zeros(Float64, rows)
    old_dx::Float64=0.0

    converged::Bool = false
    epsilon = 0.0001

    for i=1:50
        for (j,row) in enumerate(eachrow(mat))
            xval = last(row)
            for (k,element) in enumerate(row[1:end-1])
                if j==k 
                    continue
                end
                xval+= -element*xtargets[k]
            end
            xval/=mat[j,j]
            xtargets[j]=xval
        end

        dx = √(dot(xtargets-oldx, xtargets-oldx)) # finding the square root of the dot product of 
        @printf "%d %.4f %.4f %.4f\n" i xtargets[1] xtargets[2] xtargets[3]
        if abs(dx-old_dx) < epsilon
            converged = true
            println("Converged!")
            break
        end
        old_dx = dx
    end
end