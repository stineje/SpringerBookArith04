module rca4p (Sum, Cout, p, A, B, Cin);

   input [3:0]  A, B;
   input        Cin;
   
   output [3:0] Sum, p;
   output 	Cout;

   fap fap1 (c0, Sum[0], p[0], A[0], B[0], Cin);
   fap fap2 (c1, Sum[1], p[1], A[1], B[1], c0);
   fap fap3 (c2, Sum[2], p[2], A[2], B[2], c1);
   fap fap4 (Cout, Sum[3], p[3], A[3], B[3], c2);

endmodule // rca4p

   
