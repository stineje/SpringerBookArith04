****************************************************************************
* Perl Scripts for Parallel Multiplier Generation
****************************************************************************

***************************************************************************
Designed by James E. Stine and Olivier M. Duverne
Illinois Institute of Technology
jstine@ece.iit.edu
***************************************************************************

VLSI Computer Architecture and CAD Research Group
Department of Electrical and Computer Engineering
Illinois Institute of Technology

This following files are included in the distribution:

Main Files:

array_v_CCT.pl  Perl generator for creating carry-save array multipliers using
                Constant Correction Truncated Multipliers in Verilog
array_v_VCT.pl  Perl generator for creating carry-save array multipliers using
                Constant Correction Truncated Multipliers in Verilog
array_v_HCT.pl  Perl generator for creating carry-save array multipliers using
                Hybrid Correction Truncated Multipliers in Verilog

Dadda_v_CCT.pl  Perl generator for creating Dadda multipliers using
                Constant Correction Truncated Multipliers in Verilog
Dadda_v_VCT.pl  Perl generator for creating Dadda multipliers using
                Constant Correction Truncated Multipliers in Verilog
Dadda_v_HCT.pl  Perl generator for creating Dadda multipliers using
                Hybrid Correction Truncated Multipliers in Verilog

tadders.v       Lower-level Verilog files to instantiate full and half 
                adders 

Testing Files:

trunc.c         C file to test implementation of truncated multipliers and 
	        its associated error

***************************************************************************

Run-time Arguments

Input parameters:
    -x <bits> the number of x bits
    -y <bits> the number of y bits (x \geq y)
    -z <bits> the number of output bits
    -k <int> number of columns to keep
    -r <float> percentage of variable correction to use
    -m <string> module name (optional)







