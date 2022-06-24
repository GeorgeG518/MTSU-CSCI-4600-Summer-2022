import cython

cdef extern from "p3.c":
    void *calcMinMaxOfThread(void *params)

    cdef struct point:
        double x 
        double y
        double z

    cdef struct args:
        point *points
        double * MAX
        double* MIN
        int startIndex 
        int numpoints

def calculateMinMax(points, max, min,start,numpoints):
    cdef pyarg temp = pyarg(points,max,min,start,numpoints)
    cdef void *ptr
    ptr = <void *>temp 
    calcMinMaxOfThread(ptr) 
    return temp.max, temp.min

cdef class pnt:
    cdef point p
    def __cinit__(self,double x, double y, double z):
        self.p = point(x,y,z)
    @property
    def x(self):
        return self.p.x
cdef class pyarg:
    cdef args obj
    def __cinit__(self,point[:] pnts,double maxptr, double minptr, int strt, int numpts):
        self.obj= args(&pnts, &maxptr, &cmin, strt,numpts)
