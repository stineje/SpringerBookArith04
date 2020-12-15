/*
    
  Program Name: asap2.cpp

  Programmer: James Stine

  Date: July 1, 1997

  Description:  This program produces tables for the bi-partitite 
  table method for approximating a function f(x). This method takes 
  as inputs n0, n1, n2, and n3, which correspond to the number of bits 
  in x0, x1, and x2, and where x = x0 + x1 + x2 + x3.  It also takes 
  as input the number of guard digits, ng, and a variable, f, 
  which indicates the function to be implement. The program 
  computes the coefficients produced by this approximation method. 
  And reports on the maximum and average error of the approximations.

  Usage:  Input File:  n0          = Number of bits - n0
                       n1          = Number of bits - n1
		       n2          = Number of bits - n2		       
		       ng          = Number of Guard Bits  
		       p           = Precision
		       f           = Function (see case statement)
		       rnd         = rounding method (e.g. Round-to-Nearest)
		       iter        = Number of iterations
		       start_value = Start Value
		       stop_value  = Stope Value

  Compile Arguments:  g++ -o asap asap2.cpp -lm

*/

#include "funcs.h"
#include <iostream>
#define ARR_SIZE 100000

main(int argc, char* argv[]) {
   double step;                    // Step of operand  
   double x;                       // Input Operand
   double x_seg[6];                // Used for partitions of input operand
   double err;                     // Absolute Error
   double y_true;                  // Accurate value
   double y_approx;                // Approximate Value
   double tot_err;                 // Total Error -- tot_err+=err
   double max_err;                 // Maximum (absolute value) error
   double x_max_err;               // Where maximum error occurs for x
   double bits_max_err;            // Number of bits to represent max_err
   double delta[6];                // Delta -- Equation 9
   double delta_add;               // Delta -- Delta(2):Delta(m)
   double p2[6];                   // Used to Calculate Delta's
   double ppg;                     // Total Number of Bits + Guard Digits
   double a[6][ARR_SIZE];          // Table's -- First Index indicates table
   double bits_a0;                 // Bits of a0 table for a given operand
   double max_bits_a0;             // Maximum Number of bits for a0 table
   double max_bits_a0_x;           // Where max value in a0 table occurs in x
   double max_bits_a0_y;           // Where max value in a0 table occurs in y
   double bits_a1;                 // Bits of a1 table for a given operand 
   double max_bits_a1;             // Maximum Number of bits for a1 table
   double max_bits_a1_x;           // Where max value in a1 table occurs in x
   double max_bits_a1_y;           // Where max value in a1 table occurs in y
   double avg_err;                 // Average error   
   double start_value;             // Start value for f(x)
   double stop_value;              // Stop  value for f(x)
   double eps;                     // Used for rounding
   int c[6];                       // Used for looping in each table  
   int c_index[6];                 // Index for each table
   int max_c00;                    // Maximum Table Size of a0 table
   int max_c01;                    // Maximum Table Size of a0 table
   int max_c02;                    // Maximum Table Size of a1 table
   int m;                          // Input operand partioned into m+1 parts
   int index_d;                    // FIXME
   int n;                          // Total number of bits in x
   int nu[6];                      // Sizes of input operands partitioning   
   int ng;                         // Number of Guard Digits
   int num_vals;                   // Number of values for input operand
   int rnd;                        // Rounding method   
   int num_iter;
   int i;
   int f;
   int j;
   int q;
   int p;
   PDF func = NULL;
   PDF deriv_func = NULL;
   PDF deriv2_func = NULL;
   FILE *in_file= NULL;
   FILE *out_file = NULL;
   FILE *data_file = NULL;

   open_files(argc, argv, in_file, out_file, data_file);
   fscanf(in_file,"%d%d%d%d%d%d%d\n", &nu[0], &nu[1], &nu[2], 
	  &ng, &p, &f, &rnd);
   fscanf(in_file,"%lg%lg\n", &start_value, &stop_value);
   fprintf(out_file,"n0 = %d, ", nu[0]);
   fprintf(out_file,"n1 = %d, ", nu[1]);
   fprintf(out_file,"n2 = %d, ", nu[2]);
   fprintf(out_file,"ng = %d, p = %d, f = %d, rnd = %d \n", ng, p, f, rnd);
   fprintf(out_file,"start_value = %lg, stop_value = %lg\n\n", 
	   start_value, stop_value);

   /* Initialization */
   max_err = 0.0;
   tot_err = 0.0;
   max_bits_a0 = 0.0;
   max_bits_a1 = 0.0;
   max_bits_a0_x = 0.0;
   max_bits_a1_x = 0.0;
   max_bits_a0_y = 0.0;
   max_bits_a1_y = 0.0;
   bits_a0 = 0.0;
   bits_a1 = 0.0;
         
   /* Choose function from Case Statement */
   choose_func(f, func, deriv_func, deriv2_func);
      
   /* Calculate Number of bits from Input Operand */
   n = nu[0] + nu[1] + nu[2];

   /* Calculate Total Number of Bits n + total number of guard bits */
   ppg = double(n+ng);
   
   /* Place start and stop values into Accurate Bit Notation */ 
   start_value = flr(start_value,double(n));
   stop_value = flr(stop_value,double(n));
   
   /* Calculate total number of values */
   step = pow(2, double(-n));
   num_vals = (int) ((stop_value - start_value)/step);

   /* Calculate Values for n0, n1, and n2 that minimize memory requirements*/
   int p1[7];
   int w1[7];
   int mem[7];
   int mem_tot;
   int k;
   int lead_deriv_bits;
   int lead_deriv2_bits;
   unsigned mem_size;
   unsigned min_mem_size;
   unsigned standard_mem_size;
   double comp;

   /* Calculate Delta's */
   m        = 2;
   p2[0]    = nu[0];
   delta[0] = 0;
   for (i=1;i<= m;i++) {
     p2[i] = p2[i-1] + nu[i];
     delta[i] = pow(2.0,double(-p2[i-1]-1)) - pow(2.0,double(-p2[i]-1));     
   }

   // Calculate Epsilon which is 2^-(Epsilon+1)
   eps = pow(2.0, - p - ng - 1);

   // Calculate delta_add -- 2 <= i <= m 
   delta_add = 0;
   for (i=2;i <= m;i++) 
     delta_add += delta[i];	        
       
   /* Obtain the original coefficients -  START CALCULATION*/
   for (c[0] = 0, x = start_value; x < stop_value; c[0]++) {

     /* Calculate x1 */
      x_seg[0] = flr(x, double(nu[0]));
            
      for (c[1] = 0; c[1] < (1 << nu[1]) && x < stop_value; c[1]++) {

	/* Increment array for table */
	c_index[0] = (c[0] << nu[1]) + c[1];

	/* Calcuate x1 */
	x_seg[1] = flr(x, double(nu[0]+nu[1]));
	
	// Calculate a0 table
	a[0][c_index[0]] = func(x_seg[1]+delta_add);
	
	for (c[2] = 0; c[2] < (1 << nu[2]) && x < stop_value; c[2]++, 
	       x+=step) {
	  
	  // Increment array 
	  c_index[1] = (c[0] << nu[2]) + c[2];
	  
	  // Calculate x2 
	  x_seg[2] = x - x_seg[1];
	  
	  // Calculate a1 table
	  a[1][c_index[1]] = deriv_func(x_seg[0]+delta[1]+delta_add)*
	    (x_seg[2] - delta[2]);
	  
	  /* Calculate true value - used for error */
	  y_true = func(x);
	  
	  /* Determine Rounding Method */
	  if (rnd == 0) 
	    y_approx = a[0][c_index[0]] 
	      + a[1][c_index[1]];
	  else if (rnd == 1 ) {
	    a[0][c_index[0]] = round(a[0][c_index[0]], p+ng);
	    a[1][c_index[1]] = flr(a[1][c_index[1]], p+ng) + eps;	       
	    y_approx = a[0][c_index[0]] + 
	      a[1][c_index[1]];
	  }
	  else {
	    a[0][c_index[0]] = round(a[0][c_index[0]], p+ng);
	    a[1][c_index[1]] = flr(a[1][c_index[1]], p+ng) + eps;
	    y_approx = round(a[0][c_index[0]]  
			     + a[1][c_index[1]], p);
            } 
	  
	  /* Calculate Error */
	  err = y_true - y_approx;
	  
	  /* Sum Total Error */
	  tot_err += err;	          
	  
	  /* If Data File argument is present, output to file */
	  if (data_file) {
	    /*
	      fprintf(data_file, "x = %1.15lg\n", x);
	      fprintf(data_file, "err = %1.15lg\n", err);
	      fprintf(data_file, "y_true = %1.15lg\n", y_true);
	      fprintf(data_file, "y_approx = %1.15lg\n", y_approx);
	      fprintf(data_file, "a[0][%d] = %lg\n", c_index[0], a[0][c_index[0]]);
	      fprintf(data_file, "a[1][%d] = %lg\n", c_index[1], a[1][c_index[1]]);
	      fprintf(data_file, "x = ");
	      disp_bin(x, 1, nu[0] + nu[1] + nu[2], data_file);
	      fprintf(data_file, "\n");
	    */
	    fprintf(data_file, "y_approx = ");
            disp_bin(y_approx, 1, int (p), data_file);
	    fprintf(data_file, "  ");
	    fprintf(data_file, "y_true = ");
            disp_bin(y_true, 1, int (p), data_file);
	    fprintf(data_file, "\n");
	    /*
	    fprintf(data_file, "a0 = ");
	    disp_bin(a[0][c_index[0]], 1, int (ppg+1), data_file);
	    fprintf(data_file, "\n");
	    fprintf(data_file, "a1 = ");
	    disp_bin(a[1][c_index[1]], 1, int (ppg+1), data_file);
	    fprintf(data_file, "\n\n");
	    */
	  }

	  err = fabs(err);
	  
	  /* Calculate total number of bits for error */
	    if (err > max_err) {
	      max_err = err;
	      x_max_err = x;
	      bits_max_err = -log(max_err)/log(2.0);
	    }
	    
	    // Calculate total number of bits for a0 
	    bits_a0 = p+ng + log(fabs(a[0][c_index[0]]))/log(2.0);
	    if (bits_a0 > max_bits_a0) {
	      max_bits_a0 = bits_a0;
	      max_bits_a0_x = x;
	      max_bits_a0_y = a[0][c_index[0]];
	    }
	    
	    // Calculate total number of bits for a1 
	    bits_a1 = p+ng+1 + log(fabs(a[1][c_index[1]]))/log(2.0);
	    if (bits_a1 > max_bits_a1) {
	      max_bits_a1 = bits_a1;
	      max_bits_a1_x = x;
	      max_bits_a1_y = a[1][c_index[1]];
	    }
	 	 	 	 	  
	}
	
      }
      
   }

   max_c01 = c_index[0];
   max_c02 = c_index[1];

   if (data_file) {
     fprintf(data_file, "------ a1[x0, x1] -------------\n");
     for (q=0; q <= max_c01; q++) {
       disp_bin(q, (nu[0]+nu[1]), 0, data_file);
       fprintf(data_file, " | ");
       disp_bin(a[0][q], 1, int (p+ng+1), data_file);
       fprintf(data_file,"  = %1.25lg", a[0][q]);
       fprintf(data_file, "\n");
     }
     fprintf(data_file, "------ a2[x0, x2] -------------\n");
     for (q=0; q <= max_c02; q++) {
       disp_bin(q, (nu[0]+nu[2]), 0, data_file);
       fprintf(data_file, " | ");
       disp_bin(a[1][q], 1, int (p+ng+1), data_file);
       fprintf(data_file,"  = %1.25lg", a[1][q]);
       fprintf(data_file, "\n");
     }
   }

   fprintf(out_file,"num_vals = %d\n", num_vals);   
   fprintf(out_file,"a0 table = %d words\n", max_c01+1);
   fprintf(out_file,"a1 table = %d words\n\n", (max_c02+1)/2);   
   fprintf(out_file, "max_err = %lg  ", max_err);
   fprintf(out_file, "x_max_err = %lg  ", x_max_err);
   fprintf(out_file, "bits_max_err = %lg\n\n", bits_max_err);
   fprintf(out_file, "avg_err = %lg\n\n", tot_err/double(num_vals));
   fprintf(out_file, "max_bits_a0 = %lg\n\n", max_bits_a0);
   fprintf(out_file, "max_bits_a0_x = %lg\n\n", max_bits_a0_x);
   fprintf(out_file, "max_bits_a0_y = ");
   disp_bin(max_bits_a0_y, 1, int (p+ng+1), out_file);
   fprintf(out_file, "\n");
   fprintf(out_file, "max_bits_a0_y = %lg\n\n",max_bits_a0_y);   
   fprintf(out_file, "max_bits_a1 = %lg\n\n", max_bits_a1);
   fprintf(out_file, "max_bits_a1_x = %lg\n\n", max_bits_a1_x);
   fprintf(out_file, "max_bits_a1_y = ");
   disp_bin(max_bits_a1_y, 1, int (p+ng+1), out_file);
   fprintf(out_file, "\n");
   fprintf(out_file, "max_bits_a1_y = %lg\n\n",max_bits_a1_y);   
      
}


void choose_func(int func_spec, PDF &func, PDF &deriv_func, PDF &deriv2_func) {
  switch (func_spec) {
  case 0:
    func = recip;
    deriv_func = deriv_recip;
    deriv2_func = deriv2_recip;
    break;
  case 1:
    func = sqrt;
    deriv_func = deriv_sqrt;
    deriv2_func = deriv2_sqrt;
    break;
  case 2:
    func = rsqrt;
    deriv_func = deriv_rsqrt;
    deriv2_func = deriv2_rsqrt;
    break;
  case 3:
    func = sin;
    deriv_func = cos;
    deriv2_func = deriv2_sin;
    break;
  case 4:
    func = cos;
    deriv_func = deriv_cos;
    deriv2_func = deriv2_cos;
    break;
  case 5:
    func = atan;
    deriv_func = deriv_atan;
    deriv2_func = deriv2_atan;
    break;
  case 6:
    func = log2;
    deriv_func = deriv_log2;
    deriv2_func = deriv2_log2;
    break;
  case 7:
    func = exp2;
    deriv_func = deriv_exp2;
    deriv2_func = deriv2_exp2;
    break;
  case 8:
    func = log;
    deriv_func = recip;
    deriv2_func = deriv_recip;
    break;
  case 9:
    func = exp;
    deriv_func = exp;
    deriv2_func = exp;
    break;
  case 10:
    func = square;
    deriv_func = deriv_square;
    deriv2_func = deriv2_square;
    break;
  case 11:
    func = sinc;
    deriv_func = deriv_sinc;
    deriv2_func = deriv2_sinc;
    break;
  case 12:
    func = four;
    deriv_func = deriv_four;
    deriv2_func = deriv2_four;
    break;
  default:
    fprintf(stderr,
	    "choose_func: An invalid function has been specified (f = %d)\n"
	    , func_spec);
    exit(1);
  };

}
  
	  
void open_files(int argc, char** argv, FILE *&in_file, FILE *&out_file, 
                FILE *&data_file) {
   if (argc < 3 ) {
      fprintf(stderr,"Usage: %s in_file out_file [coeff_file]\n", argv[0]);
      exit(1);
   }
   in_file = fopen(argv[1], "r");
   if (in_file == NULL) {
      fprintf(stderr,"%s not found\n", argv[1]);
      exit(1);
   }
   out_file = fopen(argv[2], "a");
   if (out_file == NULL) {
      fprintf(stderr,"Unable to create %s\n", argv[2]);
      exit(1);
   }
   if (ftell(out_file) != 0) {
      fprintf(stderr,"overwrite %s? ", argv[2]);
      if ('y' == getchar()) {
         fclose(out_file); 
         out_file = fopen(argv[2], "w");
      }
      else {
         exit(1);
      }
   }
   if (argc > 3) {
      data_file = fopen(argv[3], "w");
      if (data_file == NULL) {
         fprintf(stderr,"Unable to create %s\n", argv[3]);
         exit(1);
      }
   }
}
