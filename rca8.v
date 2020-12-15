module rca8 (Sum, A, B);

   input [7:0]  A, B;
   
   output [7:0] Sum;

   fa cpa1 (c0, Sum[0], A[0], B[0], 1'b0);
   fa cpa2 (c1, Sum[1], A[1], B[1], c0);
   fa cpa3 (c2, Sum[2], A[2], B[2], c1);
   fa cpa4 (c3, Sum[3], A[3], B[3], c2);
   fa cpa5 (c4, Sum[4], A[4], B[4], c3);
   fa cpa6 (c5, Sum[5], A[5], B[5], c4);
   fa cpa7 (c6, Sum[6], A[6], B[6], c5);
   fa cpa8 (c7, Sum[7], A[7], B[7], c6);   

endmodule // rca8
