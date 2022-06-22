cdef extern from "p3.c":
    void *calcMinMaxOfThread(void *params)

    struct point:
        double x 
        double y
        double z

    struct arg:
        point *points
        double * MAX
        double* MIN
        int startIndex 
        int numpoints

