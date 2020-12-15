#include <stdlib.h>
#include <math.h>
#include <stdio.h>

typedef double (*PDF) (double);

void choose_func(int func_spec, PDF &func, PDF &deriv_func, PDF &deriv2_func);

void open_files(int argc, char** argv, FILE *&in_file, FILE *&out_file,
		FILE *&coeff_file);

void open_files(int argc, char** argv, FILE *&in_file, FILE *&out_file,
		FILE *&data_file, FILE *&err_file);

double round(double x, double precision);

double flr(double x, double precision);

double ceiling(double x, double precision);

void disp_bin(double x, int bits_to_left, int bits_to_right, FILE *out_file);

double fmax(double x, double y) {
   if (x > y) return x;
   return y;
}


double round(double x, double precision) {
   double scale, x_round;
   scale = pow(2.0, precision);
   x_round = rint(x * scale) / scale;
   return x_round;
}

double flr(double x, double precision) {
   double scale, x_round;
   scale = pow(2.0, precision);
   x_round = floor(x * scale) / scale;
   return x_round;
}

double ceiling(double x, double precision) {
   double scale, x_round;
   scale = pow(2.0, precision);
   x_round = ceil(x * scale) / scale;
   return x_round;
}

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

inline double recip (double x) {
   return ( 1.0/x );
}

inline double deriv_recip(double x) {
   return ( -1.0/(x*x) );
}

inline double deriv2_recip(double x) {
   return ( 2.0/(x*x*x) );
}

inline double deriv_sqrt(double x) {
   return ( 0.5/sqrt(x) );
}

inline double deriv2_sqrt(double x) {
   return ( -0.25*pow(x,-1.5) );
}

inline double rsqrt (double x) {
   return ( 1.0/sqrt(x) );
}

inline double deriv_rsqrt (double x) {
   return ( -0.5*pow(x,-1.5) );
}

inline double deriv2_rsqrt (double x) {
   return ( 0.75*(pow(x,-2.5)) );
}

inline double deriv_cos (double x) {
   return ( -sin(x) );
}

inline double deriv2_sin(double x) {
   return (-sin(x));
}

inline double deriv2_cos(double x) {
   return (-cos(x));
}
inline double deriv_atan(double x) {
   return ( 1.0/(1.0 + x*x) );
}


inline double deriv2_atan(double x) {
   return ( -2.0*x /  (1.0 + 2.0*x*x +x*x*x*x) );
}

inline double log2(double x) {
   return log(x)/log(2.0);
}

inline double deriv_log2(double x) {
   return ( M_LOG2E/x );
}

inline double deriv2_log2(double x) {
   return ( -M_LOG2E/(x*x) );
}

inline double exp2(double x) {
   return ( pow(2.0,x) );
}

inline double deriv_exp2(double x) {
   return ( pow(2.0,x)*M_LN2 );
}

inline double deriv2_exp2(double x) {
   return ( pow(2.0,x)*M_LN2*M_LN2 );
}

inline double square(double x) {
   return ( x*x );
}

inline double deriv_square(double x) {
   return ( 2.0*x );
}

inline double deriv2_square(double x) {
   return ( 2.0 );
}

inline double sinc(double x) {
   return ( sin(x)/x );
}

inline double deriv_sinc(double x) {
   return ( (cos(x)/x) - (sin(x)/pow(x,2.0)) );
}

inline double deriv2_sinc(double x) {
   return ( (-sin(x)/x) - ((2.0*cos(x))/pow(x,2.0)) 
	    + ((3.0*sin(x))/pow(x,3.0)) );
}

inline double four(double x) {
  return ( pow(x,4.0) );
}

inline double deriv_four(double x) {
  return ( 4.0*pow(x,3.0) );
}

inline double deriv2_four(double x) {
  return ( 12.0*pow(x,2.0) );
}


