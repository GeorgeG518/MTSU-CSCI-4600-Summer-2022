/*
	George Gannon
	Project 3
	Parallel computation of min max distance problem
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <unistd.h>
#include <math.h>
#include <sys/time.h> // here to shut the compiler up about implicit function
#define GEN_RAND_3D_PT(MIN,MAX,X,Y,Z)                 \
  X = (MAX-MIN) * ((double)rand()/RAND_MAX) + MIN;  \
  Y = (MAX-MIN) * ((double)rand()/RAND_MAX) + MIN;  \
  Z = (MAX-MIN) * ((double)rand()/RAND_MAX) + MIN;

struct point{
	double x;
	double y;
	double z;
};

struct args{
	// should be aligned properly, sorted by bytes; helps with performance 
	struct point *points; // 8
	double * MAX; // 8
	double* MIN; // 8
	int startIndex; // 4 
	int numpoints;  // 4
};

// retrieved from rmb timedemo.c
double time1()
{
    struct timeval tv;

    gettimeofday( &tv, ( struct timezone * ) 0 );
    return ( (double) (tv.tv_sec + (tv.tv_usec / 1000000.0)) );
}

// global var to keep track of threads instead of passing it as a parameter
int threadCount;
//void calcMinMaxOfThread(struct point *points, int startIndex, int numpoints, double * MAX, float* MIN)
// kept here for sanity check


// IN: Params, which is of type arg defined above.
// OUT: Nothing, but does set the arrays of maxes and mins to max or min values at the given thread's index
void *calcMinMaxOfThread(void *params){
	int start = ((struct args*)params)->startIndex;
	// Pretty much the same exact process as p1, just we increment by threadcount so that way we don't overlap work.
	for(int i=start ; i<((struct args*)params)->numpoints;i+=threadCount) // needs to increment by thread count for balancing
	{
		for(int j=i+1; j<((struct args*)params)->numpoints;j++){
			double xsqrd = powf( ((struct args*)params)->points[i].x - ((struct args*)params)->points[j].x,2);
			double ysqrd = powf(((struct args*)params)->points[i].y - ((struct args*)params)->points[j].y,2);
			double zsqrd = powf(((struct args*)params)->points[i].z - ((struct args*)params)->points[j].z,2);
			double distance = xsqrd+ysqrd+zsqrd ;// ideally this would be something larger in size 
				
			if( ((struct args*)params)->MAX[start] <distance){
				((struct args*)params)->MAX[start] =distance;
			}else if( ((struct args*)params)->MIN[start]>distance){
				((struct args*)params)->MIN[start]=distance;
			}
			
		}
	
	}
}
int main(int argc, char*argv[]){
	alarm(90);// required by the project
	if(argc != 4){
		printf("%s\n","Error! Syntax: ./exe srand_seed num_points thread_count");
		return 1;
	}
	int seed = atoi(argv[1]); // srand seed
	srand(seed);
	int numpoints = atoi(argv[2]); // num of points for genRand macro
	threadCount = atoi(argv[3]);
	struct point points[numpoints]; // The array of our points...might get intense

	for(int i =0;i<numpoints;i++)
	{
		double x, y,z;
		GEN_RAND_3D_PT(0,10000,x,y,z);
		struct point pointA = {x, y, z};
		points[i] = pointA;
	}
	/*
	AS we create threads, fill two arrays that are n-threads long that will represent out MAX and MIN
	Find the max and min of these, and we have our final max an min.

	We will need to create the threads, and then join them together
	*/
	double MAXI[threadCount];
	double MINI[threadCount]; // holds our max and min vals
	for(int i =0; i< threadCount; i++){	
		MAXI[i] =0;
		MINI[i]=SIZE_MAX;
	}	
	double t1 = time1();
	pthread_t threads[threadCount];
	struct args *arr[threadCount];
	for(int i=0; i<threadCount; i++){
		struct args *passer = (struct args*)malloc(sizeof(struct args) );
		arr[i] = passer;
		passer->points = points;
		passer->MAX = MAXI;
		passer->MIN = MINI;
		passer->startIndex =i;
		passer->numpoints = numpoints;
		//{points, &MAX[i], &MIN[i],i, numpoints};	
		pthread_t tid1;
		pthread_create (&tid1, NULL, calcMinMaxOfThread, (void *) passer);
		threads[i] = tid1;
	}
	double trueMAX= 0;
	double trueMIN= SIZE_MAX;
	for(int i=0; i<threadCount; i++){
		pthread_join(threads[i], NULL);
		if(MAXI[i]>trueMAX){
			trueMAX = MAXI[i];
		}
		if(MINI[i]<trueMIN){
			trueMIN = MINI[i];
		}
	}
	for(int i=0; i<threadCount; i++){
		if(MAXI[i]>trueMAX){
			trueMAX = MAXI[i];
		}
		if(MINI[i]<trueMIN){
			trueMIN = MINI[i];
		}
	}
	for(int i=0; i<threadCount; i++)
		free(arr[i]);
	double t2 = time1();

	printf("%.3f ",sqrtf(trueMIN)); // expensive to do square root, so we leave it here at the end
	printf("%.3f\n",sqrtf(trueMAX));
	printf("%s %.6f\n", "TIME", t2-t1); 
	return 0;
}


