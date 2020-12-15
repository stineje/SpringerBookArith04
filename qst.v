module qst (q, Sign, Int, f0);

   input        Sign;
   input        Int;
   input        f0;

   output [1:0] q;

   assign 	q[1] = (!Sign&Int) | (!Sign&f0);
   assign 	q[0] = (Sign&!Int) | (Sign&!f0);


endmodule // qst

