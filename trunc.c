/* 


   This program simulates truncated multiplication.  By default
   it calculates CCT, VCT, and HCT methods.  However, to limit the
   output, options at run time can be input to allow limited runs
   or only certain truncation methods.

   To compile: gcc -o trunc_mult trunc_mult.c -lm
   
   Usage: trunc_mult m, n, r, k, q, lower, upper, out_file, t, z

                 m = Multiplicand size
                 n = Multiplier size
                 r = Product size
                 k = Columns to keep
                 q = Hybrid Percentage

                 upper = Input Range (start) 
                 lower = Input Range (end)

                 out_file = Output File

                 t = 0 Print data and statistics 
		 t = 1 Print statistics only

                 z = 0 Run all correction methods
                 z = 1 Run constant correction method
                 z = 2 Run variable correction method
                 z = 3 Run hybrid correction methods
                 z = 4 Run constand and variable correction methods
*/

#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include <math.h>

/* Prototyping */
double trunc_mult(double a, double b, double corr_const, int m, int n, 
		  int r, int k);
double ccm(double a, double b, int m, int n, int r, int k);
double vcm(double a, double b, int m, int n, int r, int k);
double hcm(double a, double b, int m, int n, int r, int k, double q);
double ccm_const(int m, int n, int r, int k);
double vcm_const(double a, double b, int m, int n, int r, int k);
double hcm_const(double a, double b, int m, int n, int r, int k, 
		 double q, int nbitsvar);
void disp_bin(double x, int bits_to_left, int bits_to_right, FILE *out_file);
double rnd_near(double x, double bits);

FILE *out_file = NULL;


/*
  Rounding Calls
*/

double rnd_near(double x, double bits) {
  double scale, x_round;
  scale = pow(2.0, bits);
  x_round = rint(x * scale) / scale;
  return x_round;
}

double rnd_down(double x, double bits) {
  double scale, x_round;
  scale = pow(2.0, bits);
  x_round = floor(x * scale) / scale;
  return x_round;
}

double rnd_up(double x, double bits) {
  double scale, x_round;
  scale = pow(2.0, bits);
  x_round = ceil(x * scale) / scale;
  return x_round;
}

double rnd_zero(double x, double bits) {
  if (x < 0) 
    return rnd_up(x, bits);
  else
    return rnd_down(x, bits);
}


/*
  Floor function
*/

double flr(double x, double precision) {
  double scale, x_round;
  scale = pow(2.0, precision);
  x_round = floor(x * scale) / scale;
  return x_round;
}


/*
  Binary Conversion
*/

void disp_bin(double x, int bits_to_left, int bits_to_right, FILE *out_file) {
  double diff;
  int i;
  if (fabs(x) <  pow(2.0, -bits_to_right)) {
    for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
      fprintf(out_file,"0");
    }
    return;
  }
  if (x < 0.0) {
    x = pow(2.0, ((double) bits_to_left)) + x;
  }
  for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
    diff = pow(2.0, -i);
    if (x < diff) {
      fprintf(out_file, "0");
    }
    else {
      fprintf(out_file, "1");
      x -= diff;
    }
    if (i == 0) {
      fprintf(out_file, ".");
    }
  }
}


/* 
   Constant Corection Method : constant calculation
*/ 

double ccm_const(int m, int n, int r, int k) {
  int q;
  double err_red, err_rnd, err_tot, cor_tot;
  err_red = 0.0;
  for (q = r+k+1; q <= m+n; q++) {
    err_red += (m+n+1-q)*pow(2.0,-q);
  }
  err_rnd = pow(2.0,-r)*(1.0 - pow(2.0,-k));
  err_tot = 0.25*err_red + 0.5*err_rnd;
  cor_tot = rnd_near(err_tot, r+k);
  return cor_tot;
}


/* 
   Variable Correction Method : constant calculation
*/ 

double vcm_const(double a, double b, int m, int n, int r, int k){
  int q, j, one_count, b_start;
  long a_int, b_int;
  double cor_tot = 0.0;
  j = m + n - r - k - 1;
  if(n<r+k){
    b_start=n;
  }
  else{
    b_start=r+k-1;
  }
  one_count = 0;
  a_int = (long) (a * (1 <<  m));
  b_int = (long) (b * (1 << n));
  for (q = n-b_start+1; q < n; q++) {
    if (((1 << q) & b_int) && ((1 << (j - q) & a_int)))
      one_count++;
  }
  cor_tot = one_count*pow(2.0, -r-k);
  return cor_tot;
}


/* 
   Hybrid Correction Method : constant calculation
*/

double hcm_const(double a, double b, int m, int n, int r, 
		 int k, double q, int nbitsvar) {

  /* Calculation of the value of the constant correction */
  int t, j, one_count,b_start;
  long a_int, b_int;
  double err_red, err_rnd, err_tot, cor_tot, var_cor;
  err_red = 0.0;
  for (t = r+k+1; t <= m+n; t++) {
    err_red += (m+n+1-t)*pow(2.0,-t);
  }
  var_cor = 0.25 * (double)nbitsvar*pow(2.0,-r-k);
  err_rnd = pow(2.0,-r)*(1.0 - pow(2.0,-k));
  err_tot = 0.25*err_red + 0.5*err_rnd - var_cor;
  cor_tot = rnd_near(err_tot, r+k);
  
  /* Calculation of the value of the variable correction */
  j = m + n - r - k - 1;
  if(n<r+k){
    b_start=n;
  }
  else{
    b_start=r+k-1;
  }
  one_count = 0;
  a_int = (long) (a * (1 << m));
  b_int = (long) (b * (1 << n));
  for (t = n-b_start+1; t < n-b_start+1+nbitsvar; t++) {
    if (((1 << t) & b_int) && ((1 << (j - t) & a_int)))
      one_count++;
  }
  cor_tot = cor_tot + one_count*pow(2.0, -r-k);
  return cor_tot;
}


/* 
   Simulate Truncated Multiplication
   
   It is assumed that a and b are unsigned fractions with 0 <= a < 1
   and 0 <= b < 1. The input r corresponds to the number of bits in
   the rounded product and k is the number of columns that are kept
   after the rounding point. The output p, corresponds to the 
   rounded product. 
*/ 

double trunc_mult(double a, double b, double corr_const, 
		  int m, int n, int r, int k) {
  int i;
  double p = 0;
  for (i = 0; i < n; i++) {
    b = 2*b;
    a = 0.5*a;
    if (b >= 1.0) {
      p = rnd_down(p + a, r + k);
      b = b - 1.0;
    }
  }
  p = rnd_down(p + corr_const, r);
  return p;
}


/* 
   Constant Corection Method : main routine
*/

double ccm(double a, double b, int m, int n, int r, int k) {
  double corr_const;
  corr_const = ccm_const(m, n, r, k);
  return trunc_mult(a, b, corr_const, m, n, r, k);
}


/* 
   Variable Corection Method : main routine
*/

double vcm(double a, double b, int m, int n, int r, int k) {
  double corr_const, err_rnd;
  err_rnd = pow(2.0,-r-1)*(1.0 - pow(2.0,-k+1));
  err_rnd = rnd_zero(err_rnd, r+k);
  corr_const = vcm_const(a, b, m, n, r, k);
  corr_const = corr_const + err_rnd;
  return trunc_mult(a, b, corr_const, m, n, r, k);
}


/*
  Hybrid Corection Method : main routine
*/

double hcm(double a, double b, int m, int n, int r, int k, double q) {

  /* Calculation of the number of bits required for the variable correction */
  int i,j;
  double corr_const, err_rnd;
  int nbitsvar = 0;
  for(j = 0; j < n; j++) {
    for(i = 0; i < m; i++) {
      if(i+j == n+m-r-k-1) {
	nbitsvar++;
      }
    }
  }
  nbitsvar=floor(nbitsvar*q);
  corr_const = hcm_const(a, b, m, n, r, k, q, nbitsvar);
  return trunc_mult(a, b, corr_const, m, n, r, k);
}


/*
  Main Test Routine
*/

void test_err(double lower, double upper, int m, int n, int r, int k, 
	      double q, int t, int z) {
  
  double step_a, step_b;
  double ans_true;
  double ans_true_r;
  double a;
  double b;
  double ans_trunc;
  double ans_const;
  double ans_eric;
  double ans_hyb;
  double a_max, b_max, true_max;
  double err, avg_err, sqr_err, max_err, abs_err, max_ans;
  double num;
  
  double err_const, avg_err_const, sqr_err_const, max_err_const;
  double abs_err_const, max_ans_const;
  double max_a_const, max_b_const, max_true_const;
  
  double err_eric, avg_err_eric, sqr_err_eric, max_err_eric;
  double abs_err_eric, max_ans_eric;
  double max_a_eric, max_b_eric, max_true_eric;
  
  double err_hyb, avg_err_hyb, sqr_err_hyb, max_err_hyb;
  double abs_err_hyb, max_ans_hyb;
  double max_a_hyb, max_b_hyb, max_true_hyb;
  
  
  step_a = pow(2.0, -m);
  step_b = pow(2.0, -n);
  a_max = b_max = 0.0;
  max_a_const = max_b_const = 0.0;
  max_a_eric = max_b_eric = 0.0;
  max_a_hyb = max_b_hyb = 0.0;
  
  max_err = sqr_err = avg_err = 0.0;
  max_err_const = sqr_err_const = avg_err_const = 0.0;
  max_err_eric = sqr_err_eric = avg_err_eric = 0.0;
  max_err_hyb = sqr_err_hyb = avg_err_hyb = 0.0;
  
  for (a=lower; a < upper; a += step_a) {
    for (b=lower; b < upper; b += step_b) {
      
      ans_true  = a*b;
      ans_trunc = trunc_mult(a, b, 0.0, m, n, r, k);
      if ((z == 1) || (z == 0) || (z == 4))
	ans_const = ccm(a, b, m, n, r, k);
      if ((z == 2) || (z == 0) || (z == 4)) 
	ans_eric  = vcm(a, b, m, n, r, k);
      if ((z == 3) || (z == 0))
	ans_hyb   = hcm(a, b, m, n, r, k, q);
      
      err = ans_true - ans_trunc;
      abs_err = fabs(err);
      sqr_err += err*err;
      avg_err += err;
      if (abs_err > max_err) {
	a_max = a;
	b_max = b;
	true_max = ans_true;
	max_err = abs_err;
	max_ans = ans_trunc;
      }
      
      if ((z == 1) || (z == 0) || (z == 4)) {
	err_const = ans_true - ans_const;
	abs_err_const = fabs(err_const);
	sqr_err_const += err_const*err_const;
	avg_err_const += err_const;
	if (abs_err_const > max_err_const) {
	  max_a_const = a;
	  max_b_const = b;
	  max_true_const = ans_true;
	  max_err_const = abs_err_const;
	  max_ans_const = ans_const; 
	}
      }
      
      if ((z == 2) || (z == 0) || (z == 4)) {
	err_eric = ans_true - ans_eric;
	abs_err_eric = fabs(err_eric);
	sqr_err_eric += err_eric*err_eric;
	avg_err_eric += err_eric;
	if (abs_err_eric > max_err_eric) {
	  max_a_eric = a;
	  max_b_eric = b;
	  max_true_eric = ans_true;
	  max_err_eric = abs_err_eric;
	  max_ans_eric = ans_eric;
	}
      }
      
      if ((z == 3) || (z == 0)) {
	err_hyb = ans_true - ans_hyb;
	abs_err_hyb = fabs(err_hyb);
	sqr_err_hyb += err_hyb*err_hyb;
	avg_err_hyb += err_hyb;
	if (abs_err_hyb > max_err_hyb) {
	  max_a_hyb = a;
	  max_b_hyb = b;
	  max_true_hyb = ans_true;
	  max_err_hyb = abs_err_hyb;
	  max_ans_hyb = ans_hyb;
	}	 
      }
      
      ans_true_r=rnd_near(ans_true,r);

      /*
	t is a toggle that either prints the output or doesn't.  Its
	a good idea not to print the data unless you are trying to
	make sure that the data is correct.  For large values of 
	the multiplicand and multiplier, the data file may be huge
	and prohibitive!.
      */
      if (!t) {
	disp_bin(a, 0, m, out_file);
	fprintf(out_file, " ");
	disp_bin(b, 0, n, out_file);
	fprintf(out_file, " | ");
	disp_bin(ans_true, 0, m+n, out_file);
	fprintf(out_file, " | ");
	disp_bin(ans_true_r, 0, r, out_file);
	fprintf(out_file, " ");
	disp_bin(ans_const, 0, r, out_file);
	fprintf(out_file, " ");
	disp_bin(ans_eric, 0, r, out_file);
	fprintf(out_file, " ");
	disp_bin(ans_hyb, 0, r, out_file);
	fprintf(out_file, " ");
	fprintf(out_file, "%d", ans_true_r==ans_const);
	fprintf(out_file, " ");
	fprintf(out_file, "%d", ans_true_r==ans_eric);
	fprintf(out_file, " ");
	fprintf(out_file, "%d", ans_true_r==ans_hyb);
	fprintf(out_file, "\n");
      }
      
    }
  }
  
  num = (floor((upper - lower) / step_a)+1) * 
    (floor((upper - lower) / step_b)+1);
  avg_err /= num;
  avg_err_const /= num;
  avg_err_eric /= num;
  avg_err_hyb /= num;
  sqr_err /= num;
  sqr_err_const /= num;
  sqr_err_eric /= num;
  sqr_err_hyb /= num;
  
  fprintf(out_file,"--------------------------------\n");
  fprintf(out_file,"Simulated values\n\n");
  fprintf(out_file,"Truncation\n");
  fprintf(out_file,"avg_err = %1.25g, sqr_err = %1.25g, max_err = %1.25g\n",
	  avg_err, sqr_err, max_err);
  fprintf(out_file,"maximum bits error = %1.25g\n",
	  log(max_err)/log(2.0));
  fprintf(out_file, "a = %1.25g, b = %1.25g, true answer = %1.25g\n", 
	  a_max, b_max, true_max);
  disp_bin(a_max, 1, m, out_file);
  fprintf(out_file, " ");
  disp_bin(b_max, 1, n, out_file);
  fprintf(out_file, " ");
  disp_bin(true_max, 1, m+n, out_file);
  fprintf(out_file, "\n");
  
  
  if ((z == 1) || (z == 0) || (z == 4)) {
    fprintf(out_file, "\n");
    fprintf(out_file,"Constant Correction\n");
    fprintf(out_file,"avg_err = %1.25g, sqr_err = %1.25g, max_err = %1.25g\n",
	    avg_err_const, sqr_err_const, max_err_const);
    fprintf(out_file,"maximum bits error = %1.25g\n",
	    log(max_err_const)/log(2.0));
    fprintf(out_file, "a = %1.25g, b = %1.25g, true answer = %1.25g\n", 
	    max_a_const, max_b_const, max_true_const);
    disp_bin(max_a_const, 1, m, out_file);
    fprintf(out_file, " ");
    disp_bin(max_b_const, 1, n, out_file);
    fprintf(out_file, " ");
    disp_bin(max_true_const, 1, m+n, out_file);
    fprintf(out_file, "\n");
  }
  
  if ((z == 2) || (z == 0) || (z == 4)) {
    fprintf(out_file, "\n");
    fprintf(out_file,"Variable Correction\n");
    fprintf(out_file,"avg_err = %1.25g, sqr_err = %1.25g, max_err = %1.25g\n",
	    avg_err_eric, sqr_err_eric, max_err_eric);
    fprintf(out_file,"maximum bits error = %1.25g\n",
	    log(max_err_eric)/log(2.0)); 
    fprintf(out_file, "a = %1.25g, b = %1.25g, true answer = %1.25g\n", 
	    max_a_eric, max_b_eric, max_true_eric);
    disp_bin(max_a_eric, 1, m, out_file);
    fprintf(out_file, " ");
    disp_bin(max_b_eric, 1, n, out_file);
    fprintf(out_file, " ");
    disp_bin(max_true_eric, 1, m+n, out_file);
    fprintf(out_file, "\n");
  }
  
  if ((z == 3) || (z == 0)) {
    fprintf(out_file, "\n");
    fprintf(out_file,"Hybrid Correction\n");
    fprintf(out_file,"avg_err = %1.25g, sqr_err = %1.25g, max_err = %1.25g\n",
	    avg_err_hyb, sqr_err_hyb, max_err_hyb);
    fprintf(out_file,"maximum bits error = %1.25g\n",
	    log(max_err_hyb)/log(2.0)); 
    fprintf(out_file, "a = %1.25g, b = %1.25g, true answer = %1.25g\n", 
	    max_a_hyb, max_b_hyb, max_true_hyb);
    disp_bin(max_a_hyb, 1, m, out_file);
    fprintf(out_file, " ");
    disp_bin(max_b_hyb, 1, n, out_file);
    fprintf(out_file, " ");
    disp_bin(max_true_hyb, 1, m+n, out_file);
    fprintf(out_file, "\n");
  }
  
} 


int main (int argc, char** argv) {
  
  int m;
  int n;
  int r;
  int k;
  int t;
  int z;
  double q;
  double a;
  double b;
  double lower, upper;
  double ans_const, ans_eric, ans_hyb, ans_true;

  /*
     Default case: only summary and run all methods
  */

  if (argc == 9) {
    z = 0;
    t = 1;
  }

  else if (argc != 11) {
    fprintf(stderr,
	    "Usage: trunc_mult m, n, r, k, q, lower, upper, out_file, t, z\n");
    fprintf(stderr,
	    "\t\t m = Multiplicand size\n");
    fprintf(stderr,
	    "\t\t n = Multiplier size\n");
    fprintf(stderr,
	    "\t\t r = Product size\n");
    fprintf(stderr,
	    "\t\t k = Columns to keep\n");
    fprintf(stderr,
	    "\t\t q = Hybrid Percentage\n");
    fprintf(stderr,
	    "\t\t upper = Input Range (start) \n");
    fprintf(stderr,
	    "\t\t lower = Input Range (end)\n");
    fprintf(stderr,
	    "\t\t out_file = Output File\n");
    fprintf(stderr,
	    "\t\t t = Print data and statistics or just statistics\n");
    fprintf(stderr,
	    "\t\t z = 0 Run all correction methods\n");
    fprintf(stderr,
	    "\t\t z = 1 Run constant correction method\n");
    fprintf(stderr,
	    "\t\t z = 2 Run variable correction method\n");
    fprintf(stderr,
	    "\t\t z = 3 Run hybrid correction methods\n");
    fprintf(stderr,
	    "\t\t z = 4 Run constand and variable correction methods\n");
    exit(1);
  }

  sscanf(argv[1],"%d",&m);
  sscanf(argv[2],"%d",&n);
  sscanf(argv[3],"%d",&r);
  sscanf(argv[4],"%d",&k);
  sscanf(argv[5],"%lg",&q);
  sscanf(argv[6],"%lg",&lower);
  sscanf(argv[7],"%lg",&upper);

  if (argc == 11) {
    sscanf(argv[9],"%d",&t);
    sscanf(argv[10],"%d",&z);
  }

  /*
    run-time checking : simple (yet dumb) lexing
  */
  if ((z > 4) || (z < 0)) {
    fprintf(stderr, "Error: z out of bounds\n");
    exit(1);
  }
  
  if ((t != 0) && (t !=1)) {
    fprintf(stderr, "Error: t out of bounds\n");
    exit(1);
  }

  out_file = fopen(argv[8], "a");
  if (out_file == NULL) {
    fprintf(stderr,"Unable to create %s\n", argv[8]);
    exit(1);
  }
  if ((ftell(out_file) != 0) && (t == 0)) {
    fprintf(stderr,"overwrite %s? ", argv[8]);
    if ('y' == getchar()) {
      fclose(out_file); 
      out_file = fopen(argv[8], "w");
    }
    else {
      exit(1);
    }
  }
  else if ((ftell(out_file) != 0) && (t == 1)) {
    fclose(out_file); 
    out_file = fopen(argv[8], "w");
  }
  
  a = rnd_near(lower, n);
  b = rnd_near(upper, n);
  
  if (r+k > n+m || k+r < 0) {
    fprintf(stderr, "Error: Need 0 <= k+r <= m+n\n");
    exit(1);
  }
  
  if (lower < 0 || lower >= 1 || upper < 0 || upper >= 1) {
    fprintf(stderr, "Error: Need 0 <= lower < 1 and 0 <= upper < 1\n");
    exit(1);
  }
  test_err(lower, upper, m, n, r, k, q, t, z);
}
