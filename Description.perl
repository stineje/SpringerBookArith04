****************************************************************************
* Scripts for Parallel Multiplier Generation
****************************************************************************

***************************************************************************
Designed by James E. Stine and Olivier M. Duverne
Illinois Institute of Technology
jstine@ece.iit.edu
***************************************************************************

The key advantage to these scripts besides that it produces RTL code
for parallel multipliers is that it can be utilized to generate standard
multipliers. If the product is chosen to be z=n+m, then the file will
be a standard multiplier without truncation. 

Discussion of these multipliers is also discussed in the new textbook
from Morgan Kaufmann Publishers

Digital Arithmetic 
Milos D. Ercegovac and Tomás Lang 
Morgan Kaufmann Publishers 2003
ISBN: 1-55860-798-6

***************************************************************************

Reference for this work:

Constant Correction Truncated Multipliers (CCT)

M. J. Schulte and E. E. Swartzlander, "Truncated multiplication with
correction constant," VLSI Signal Processing, VI, pp. 388-396, 1993.

Variable Correction Truncated Multipliers (VCT)

E. J. King and E. E. Swartzlander, Jr., "Data-dependent truncated
scheme for parallel multiplication," Proceedings of the Thirty First
Asilomar Conference on Signals, Circuits and Systems, pp. 1178-1182,
1998.

Implementation of CCT and VCT in ASIC 

M. J. Schulte and J. G. Hansen and J. E. Stine, "Reduced power
dissipation through truncated multiplication," IEEE Alessandro Volta
Memorial International Workshop on Power Design, pp. 61-69, 1998.

Hybrid Correction Truncated Multipliers (HCT)

J. E. Stine and O. M. Duverne, "Variations on Truncated Multipliers,"
Euromicro Symposium on Digital System Design, pp. 112-119, 2003.

***************************************************************************

Variables presented below:

n = the size of the multiplicand 
m = the size of the multiplier
r = the size of the product required
k = number of columns to keep after the rounding point
p = percentage of variable correction compared to constant correction

Note: The Dadda scripts will place a RCA CPA at the end of Dadda's
reduction scheme. This can and is typically replaced with a faster
CPA. 

Note: The Perl scripts utilize their own round to nearest even (RNE)
which is not using native RNE.  Please double check with the C program
to verify the correct constants.  RNE is standardized by the IEEE 754
and is the default rounding mode on all general-purpose computers.

Note: The Perl scripts can also be used to generate standard
multipliers. If the product is chosen to be z=n+m, then the file will
be a standard multiplier without truncation. 

***************************************************************************

