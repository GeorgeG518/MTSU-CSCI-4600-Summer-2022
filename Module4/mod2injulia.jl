# george gannon
#
# Module 2 C script implemented in Julia
#
struct point
    x::Float64
    y::Float64
    z::Float64    
end

function genrand3dpt(MIN, MAX)
    X=(MAX-MIN)*(float(ccall((:rand, "libc.so.6"), Int32 , () ) ) /2147483647) +  MIN
    Y=(MAX-MIN)*(float(ccall((:rand, "libc.so.6"), Int32 , () ) ) /2147483647) +  MIN
    Z=(MAX-MIN)*(float(ccall((:rand, "libc.so.6"), Int32 , () ) ) /2147483647) +  MIN
    return X,Y,Z
end

function main()
    srandseed, num_points = parse(Int64,ARGS[1]), parse(Int64,ARGS[2])
    ccall((:srand, "libc.so.6"), Int32 , (Int32,), srandseed )
        
    points =  Array{point,1}(undef, num_points)
    for i = 1:num_points
        x,y,z = genrand3dpt(0, 10000)
        points[i]=point(x,y,z)
    end

    loopMAX =0
    loopMIN =1.7976931348623157e+308

    for i=1:num_points, j=i+1:num_points
        xsqrd = (points[i].x-points[j].x)^2
        ysqrd = (points[i].y-points[j].y)^2
        zsqrd = (points[i].z-points[j].z)^2
        distance = xsqrd+ysqrd+zsqrd
        
        if loopMAX<distance
            loopMAX=distance
        elseif loopMIN > distance
            loopMIN=distance
        end
    end
    println( round(loopMIN^0.5,digits=3), " ", round(loopMAX^0.5,digits=3))
end

main()
