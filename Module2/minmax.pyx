import minmax
from minmax cimport point, calcMinMaxOfThread, arg 
import cython

def calculateMinMax(points, max, min,start,numpoints):

    calcMinMaxOfThread(& pyarg(points,max,min,start,numpoints)) 
    return

cdef class pnt:
    def __cinit__(self,double x, double y, double z):
        self.cpoint = point(x,y,z)

cdef pyarg(pnts, double maxptr, double minptr, int strt, int numpts):  
    cdef double * cmin = & minptr
    return arg(& pnts, &maxptr, cmin, strt,numpts)
