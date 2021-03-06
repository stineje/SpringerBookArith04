module qst4 (q, s, d);

   input [6:0]  s;
   input [2:0] 	d;

   output [3:0] q;
   

   assign q[3] = (!s[6]&s[5]) | (!d[2]&!s[6]&s[4]) | (!s[6]&s[4]&s[3]) | 
	         (!d[1]&!s[6]&s[4]&s[2]) | (!d[0]&!s[6]&s[4]&s[2]) | 
	         (!d[1]&!d[0]&!s[6]&s[4]&s[1]) | 
	         (!d[2]&!d[1]&!d[0]&!s[6]&s[3]&s[2]) | 
	         (!d[2]&!d[1]&!s[6]&s[3]&s[2]&s[1]) | 
	         (!d[2]&!d[0]&!s[6]&s[3]&s[2]&s[1]&s[0]);

   assign q[2] = (d[2]&!s[6]&!s[5]&!s[4]&s[3]) | 
	         (!s[6]&!s[5]&!s[4]&s[3]&!s[2]) | 
	         (!d[2]&!s[6]&!s[5]&!s[4]&!s[3]&s[2]) | 
	         (d[2]&d[1]&d[0]&!s[6]&!s[5]&s[4]&!s[3]) | 
	         (d[2]&d[1]&!s[6]&!s[5]&s[4]&!s[3]&!s[2]) | 
	         (d[2]&d[0]&!s[6]&!s[5]&s[4]&!s[3]&!s[2]) | 
	         (d[2]&!s[6]&!s[5]&s[4]&!s[3]&!s[2]&!s[1]) | 
	         (!d[2]&d[1]&d[0]&!s[6]&!s[5]&!s[4]&s[2]) | 
	         (!d[1]&!s[6]&!s[5]&!s[4]&!s[3]&s[2]&s[1]) | 
	         (!d[2]&d[1]&!s[6]&!s[5]&!s[4]&s[2]&!s[1]) | 
	         (!d[2]&d[0]&!s[6]&!s[5]&!s[4]&s[2]&!s[1]) | 
	         (!d[2]&d[1]&!s[6]&!s[5]&!s[4]&s[2]&!s[0]);

   assign q[1] = (d[2]&s[6]&s[5]&s[4]&!s[3]) | 
	         (d[1]&s[6]&s[5]&s[4]&!s[3]) | (s[6]&s[5]&s[4]&!s[3]&s[2]) | 
	         (d[2]&s[6]&s[5]&!s[4]&s[3]&s[2]) | 
	         (d[0]&s[6]&s[5]&s[4]&!s[3]&s[1]) | 
	         (d[2]&d[1]&d[0]&s[6]&s[5]&!s[4]&s[3]) | 
	         (d[2]&d[1]&s[6]&s[5]&!s[4]&s[3]&s[1]) | 
	         (!d[2]&s[6]&s[5]&s[4]&s[3]&!s[2]&!s[1]) | 
	         (!d[2]&!d[1]&!d[0]&s[6]&s[5]&s[4]&s[3]&!s[2]) | 
	         (d[1]&d[0]&s[6]&s[5]&!s[4]&s[3]&s[2]&s[1]) | 
	         (!d[2]&d[0]&s[6]&s[5]&s[4]&!s[2]&!s[1]&s[0]) | 
	         (!d[2]&!d[1]&!d[0]&s[6]&s[5]&s[4]&!s[2]&s[1]&s[0]);

   assign q[0] = (s[6]&!s[5]) | (s[6]&!s[4]&!s[3]) | 
	         (!d[2]&!d[1]&s[6]&!s[4]) | (!d[2]&!d[0]&s[6]&!s[4]) | 
	         (!d[2]&s[6]&!s[4]&!s[2]) | (!d[1]&s[6]&!s[4]&!s[2]) | 
	         (!d[2]&s[6]&!s[4]&!s[1]) | (!d[0]&s[6]&!s[4]&!s[2]&!s[1]) | 
	         (!d[2]&!d[1]&!d[0]&s[6]&!s[3]&!s[2]&!s[1]) | 
	         (!d[2]&!d[1]&!d[0]&s[6]&!s[3]&!s[2]&!s[0]) | 
	         (!d[2]&!d[1]&s[6]&!s[3]&!s[2]&!s[1]&!s[0]);

endmodule // qst4
