from ctypes import CDLL
randlib = CDLL("libc.so.6")
randlib.srand(42)

def genrand3dpt(MIN, MAX):
    X = (MAX-MIN)*(float(randlib.rand())/2147483647)+MIN
    Y = (MAX-MIN)*(float(randlib.rand())/2147483647)+MIN
    Z = (MAX-MIN)*(float(randlib.rand())/2147483647)+MIN
    return X,Y,Z
X, Y, Z = genrand3dpt(0, 10000) 
print(X,Y,Z)

