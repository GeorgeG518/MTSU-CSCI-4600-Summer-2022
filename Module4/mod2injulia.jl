
function genrand3dpt(MIN, MAX)
    X=(MAX-MIN)*(float(ccall((:rand, "libc.so.6"), Int32 , () ) ) /2147483647) +  MIN
    Y=(MAX-MIN)*(float(ccall((:rand, "libc.so.6"), Int32 , () ) ) /2147483647) +  MIN
    Z=(MAX-MIN)*(float(ccall((:rand, "libc.so.6"), Int32 , () ) ) /2147483647) +  MIN
    return X,Y,Z
end

function main()
    ccall((:srand, "libc.so.6"), Int32 , (Int32,), 7 )
    x,y,z = genrand3dpt(0, 10000)
    println(x)
    println(y)
    println(z)
end

main()
