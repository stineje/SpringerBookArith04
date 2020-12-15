module rca4s (Sum, Cout, A, B, Subtract);

   input [3:0]  A, B;
   input        Subtract;
   
   output [3:0] Sum;
   output 	Cout;

   xor x1 (w0, B[0], Subtract);
   fa fa1 (c0, Sum[0], A[0], w0, Subtract);
   xor x2 (w1, B[1], Subtract);
   fa fa2 (c1, Sum[1], A[1], w1, c0);
   xor x3 (w2, B[2], Subtract);
   fa fa3 (c2, Sum[2], A[2], w2, c1);
   xor x4 (w3, B[3], Subtract);
   fa fa4 (Cout, Sum[3], A[3], w3, c2);

endmodule // rca4s
