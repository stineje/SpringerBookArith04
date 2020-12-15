Digital Computer Arithmetic Datapath Design Using Verilog HDL
James E. Stine

Code and associated files for use with book published with
Kluwer Academic Publishers.  

Additional Useful files are the following:

C/C++ files
-------------
disp.c	Various routines to do round-to-nearest even in C/C++
qst.c	C program to print out QST so it can be input into
	a Boolean minimizer such as Espresso
qst2.c	C program to print out QST except use CPA to save memory
tl.c	C program to generate normal table lookup for sin (coule be 
	adapted for any function)
trunc.c C program to figure out error with Truncated Multipliers
asap2.c	C++ program to print out SBTM values and associated error
	(required recip8.in for 8-bit reciprocal approximation)
	(see args.txt for explanation of format of recip8.in)

Consult your compiler's manual for procedure in compiling.

Matlab Files
--------------
areadelay.m	Matlab file to print area/delay plots in book
cordic.m	Matlab file to figure out scaling factor 
linear.m	Matlab file to print linear approximation plot

Espresso Files
--------------
qst.in		Espresso file for use with qst.c (see qst.out for eqns)
qst2.in		Espresso file for use with qst2.c (see qst2.out for eqns)

Perl Files
--------------
array_v_CCT.pl  Perl file to generate Truncated CSAM using CCT
array_v_VCT.pl  Perl file to generate Truncated CSAM using VCT
array_v_HCT.pl  Perl file to generate Truncated CSAM using HCT
dadda_v_CCT.pl  Perl file to generate Truncated Dadda multipliers using CCT
dadda_v_VCT.pl  Perl file to generate Truncated Dadda multipliers using VCT
dadda_v_HCT.pl  Perl file to generate Truncated Dadda multipliers using HCT

see Description.perl and Readme.perl for more information on these
files.  Note: these Perl scripts can be utilized to invoke regular
non-truncated array or Dadda multipliers.  The scripts can be modified to
handle RA and Wallace as well.

Verilog Compilation
--------------

Utilized various Varilog compilers to compile and synthesize code.  All
worked.  For a free Verilog compiler for use with this book visit the
Verilog Icarus project at http://www.icarus.com/eda/verilog/.  There is
no guarantee that this free program will work and the best bet is to
utilze a commerical Verilog compiler.  

For each verilog file, each file is separated.  All Verilog files should
be compiled together so that they may be compiled correctly.  For example,
to compile the full adder code and test bench, the following should be
utilized:

<compiler> ha.v fa.v test_fa.v

Some compilers work differently and its best to consult your manual for
any information regarding the functionality of your compiler.

Any questions, feel free to contact me at jstine@ieee.org

Note:  All files created on Unix domain.  Therefore, there is a possibility
that the CR/LF might not be addressed properly.  Please convert using
public-domain programs.

James E. Stine
October 1, 2003
