import minmax
from minmax cimport point, calcMinMaxOfThread, arg 

def calculateMinMax(points, max, min,start,numpoints):

    calcMinMaxOfThread(& pyarg(points,max,min,start,numpoints)) 
    return

class pnt:
    def __init__(self,x,y,z):
        self.cpoint = point(x,y,z)

cdef pyarg(self,pnts, maxptr, minptr, strt, numpts):
    cdef double* cmin=minptr    
    return arg(& pnts, &maxptr,cmin, strt,numpts)
