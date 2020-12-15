#include "disp.h"
#include <math.h>

#define SIZE 4

int main() {

   double step, X, N;
   int num_iter, i;

   step = pow(2.0, -SIZE);
   X = 0.0;
   for (i=0; i < (pow(2.0, SIZE)); i++) {
     N = sin(X);   
     printf("X =  ");
     disp_bin(X, 1, (int) SIZE, stdout);
     printf(" N = ");
     N = rne(N, SIZE);
     disp_bin(N, 1, (int) SIZE, stdout);
     printf("\t%lg\t%lg\n", X, N);
     X = X + step;
   }


}
