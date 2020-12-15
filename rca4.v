module rca4 (Sum, Cout, A, B, Cin);

   input [3:0]  A, B;
   input        Cin;
   
   output [3:0] Sum;
   output 	Cout;

   fa fa1 (c0, Sum[0], A[0], B[0], Cin);
   fa fa2 (c1, Sum[1], A[1], B[1], c0);
   fa fa3 (c2, Sum[2], A[2], B[2], c1);
   fa fa4 (Cout, Sum[3], A[3], B[3], c2);

endmodule // rca4

   
