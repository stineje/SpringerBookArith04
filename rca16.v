module rca16 (Sum, Cout, A, B, Cin);

   input [15:0]  A, B;
   input 	 Cin;
   
   output [15:0] Sum;
   output 	 Cout;

   fa cpa1 (c0, Sum[0], A[0], B[0], Cin);
   fa cpa2 (c1, Sum[1], A[1], B[1], c0);
   fa cpa3 (c2, Sum[2], A[2], B[2], c1);
   fa cpa4 (c3, Sum[3], A[3], B[3], c2);
   fa cpa5 (c4, Sum[4], A[4], B[4], c3);
   fa cpa6 (c5, Sum[5], A[5], B[5], c4);
   fa cpa7 (c6, Sum[6], A[6], B[6], c5);
   fa cpa8 (c7, Sum[7], A[7], B[7], c6);
   fa cpa9 (c8, Sum[8], A[8], B[8], c7);
   fa cpa10 (c9, Sum[9], A[9], B[9], c8);
   fa cpa11 (c10, Sum[10], A[10], B[10], c9);
   fa cpa12 (c11, Sum[11], A[11], B[11], c10);
   fa cpa13 (c12, Sum[12], A[12], B[12], c11);
   fa cpa14 (c13, Sum[13], A[13], B[13], c12);
   fa cpa15 (c14, Sum[14], A[14], B[14], c13);
   fa cpa16 (c15, Sum[15], A[15], B[15], c14);

endmodule // rca16
