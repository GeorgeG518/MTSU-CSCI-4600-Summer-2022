#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <unistd.h>
#include <math.h>

#define GEN_RAND_3D_PT(MIN,MAX,X,Y,Z)                 \
  X = (MAX-MIN) * ((float)rand()/RAND_MAX) + MIN;  \
  Y = (MAX-MIN) * ((float)rand()/RAND_MAX) + MIN;  \
  Z = (MAX-MIN) * ((float)rand()/RAND_MAX) + MIN;
struct point{
	float x;
	float y;
	float z;
};

int main(int argc, char*argv[]){
	if(argc != 3){
		printf("%s\n","Error! Syntax: ./exe srand_seed num_points");
		return 1;
	}
	int seed = atoi(argv[1]); // srand seed
	srand(seed);
	int numpoints = atoi(argv[2]); // num of points for genRand macro

	struct point points[numpoints]; // The array of our points...might get intense

	for(int i =0;i<numpoints;i++)
	{
		float x, y,z;
		GEN_RAND_3D_PT(0,10000,x,y,z);
        printf("%f\n", x);
        printf("%f\n", y);
        printf("%f\n", z);

        struct point pointA = {x, y, z};
		points[i] = pointA;
	}

	float MAX, MIN; // holds our max and min vals
	MAX =0;
	MIN=SIZE_MAX;

	for(int i=0; i<numpoints;i++)
	{
		for(int j=i+1; j<numpoints;j++){
			float xsqrd = powf(points[i].x - points[j].x,2);
			float ysqrd = powf(points[i].y - points[j].y,2);
			float zsqrd = powf(points[i].z - points[j].z,2);
			float distance = xsqrd+ysqrd+zsqrd ;
			if(MAX<distance){
				MAX=distance;
			}else if(MIN>distance){
				MIN=distance;
			}
		}
	
	}
	printf("%.3f ",sqrtf(MIN));
	printf("%.3f\n",sqrtf(MAX));

	return 0;
}
