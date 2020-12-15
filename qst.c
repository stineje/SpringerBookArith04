/*
  Program:      qst.c
  Description:  Prints out QST (assumes shifted w[i] in Carry/Save)
  User:         James E. Stine

*/

#include <stdio.h>
#include <math.h>

#define DIVISOR_SIZE 3
#define CARRY_SIZE 7
#define SUM_SIZE 7

void disp_binary(double, int, int);

struct bits {
  unsigned int divisor : DIVISOR_SIZE;
  int carry : CARRY_SIZE;
  int sum : SUM_SIZE;
  int total : SUM_SIZE;
} pla;

/* 

   Function:      disp_binary
   Description:   This function displays a Double-Precision number into
                  four 16 bit integers using the global union variable 
		  dp_number
   Argument List: double x            The value to be converted
                  int bits_to_left    Number of bits left of radix point
		  int bits_to_right   Number of bits right of radix point
   Return value:  none

*/
void disp_binary(double x, int bits_to_left, int bits_to_right) {
  int i; 
  double diff;

  if (fabs(x) <  pow(2.0, ((double) -bits_to_right)) ) {
    for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
      printf("0");
    }
    if (i == bits_to_right+1) 
      printf(" ");
    
    return;
  }

  if (x < 0.0) 
    x = pow(2.0, ((double) bits_to_left)) + x;

  for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
    diff = pow(2.0, ((double) -i) );
    if (x < diff) 
      printf("0");
    else {
      printf("1");
      x -= diff;
    }
    if (i == 0) 
      printf(" ");
    
  }

}


int main() {

  int m;
  int n;
  int o;
  pla.divisor = 0;
  pla.sum = 0;
  pla.carry = 0;

  for (o=0; o < pow(2.0, DIVISOR_SIZE); o++) {
    for (m=0; m < pow(2.0, CARRY_SIZE); m++) {
      for (n=0; n < pow(2.0, SUM_SIZE); n++) {
	disp_binary((double) pla.divisor, DIVISOR_SIZE, 0);
	disp_binary((double) pla.carry, CARRY_SIZE, 0);
	disp_binary((double) pla.sum, SUM_SIZE, 0);

	/*
	  4 bits for Radix 4 (a=2)
	  1000 = +2
	  0100 = +1
	  0000 =  0
	  0010 = -1
	  0001 = -2
	  
	*/

	pla.total = pla.carry + pla.sum;

	switch (pla.divisor) {

	case 0:
	  if ((pla.total) >= 12)
	    printf(" 1000");
	  else if ((pla.total) >= 4)
	    printf(" 0100");
	  else if ((pla.total) >= -4)
	    printf(" 0000");
	  else if ((pla.total) >= -13)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 1:
	  if ((pla.total) >= 14)
	    printf(" 1000");
	  else if ((pla.total) >= 4)
	    printf(" 0100");
	  else if ((pla.total) >= -6)
	    printf(" 0000");
	  else if ((pla.total) >= -15)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 2:
	  if ((pla.total) >= 15)
	    printf(" 1000");
	  else if ((pla.total) >= 4)
	    printf(" 0100");
	  else if ((pla.total) >= -6)
	    printf(" 0000");
	  else if ((pla.total) >= -16)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 3:
	  if ((pla.total) >= 16)
	    printf(" 1000");
	  else if ((pla.total) >= 4)
	    printf(" 0100");
	  else if ((pla.total) >= -6)
	    printf(" 0000");
	  else if ((pla.total) >= -18)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 4:
	  if ((pla.total) >= 18)
	    printf(" 1000");
	  else if ((pla.total) >= 6)
	    printf(" 0100");
	  else if ((pla.total) >= -8)
	    printf(" 0000");
	  else if ((pla.total) >= -20)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 5:
	  if ((pla.total) >= 20)
	    printf(" 1000");
	  else if ((pla.total) >= 6)
	    printf(" 0100");
	  else if ((pla.total) >= -8)
	    printf(" 0000");
	  else if ((pla.total) >= -20)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 6:
	  if ((pla.total) >= 20)
	    printf(" 1000");
	  else if ((pla.total) >= 8)
	    printf(" 0100");
	  else if ((pla.total) >= -8)
	    printf(" 0000");
	  else if ((pla.total) >= -22)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	case 7:
	  if ((pla.total) >= 24)
	    printf(" 1000");
	  else if ((pla.total) >= 8)
	    printf(" 0100");
	  else if ((pla.total) >= -8)
	    printf(" 0000");
	  else if ((pla.total) >= -24)
	    printf(" 0010");
	  else
	    printf(" 0001");
	  break;
	default:
	  printf (" XXX");
	  
	}
	  
	printf("\n");
	(pla.sum)++;
      }
      (pla.carry)++;
    }
    (pla.divisor)++;
  }


}

