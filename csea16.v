module csea16 (Sum, Cout, A, B, Cin);

   input [15:0]  A, B;
   input         Cin;
   
   output [15:0] Sum;
   output 	 Cout;

   wire [3:0] 	 Sum0_0, Sum0_1, Sum1_0, Sum1_1, Sum2_0, Sum2_1;   

   rca4 rca1 (Sum[3:0], c4, A[3:0], B[3:0], Cin);
   rca4 rca2 (Sum0_0, g4, A[7:4], B[7:4], 1'b0);
   rca4 rca3 (Sum0_1, p4, A[7:4], B[7:4], 1'b1);
   rca4 rca4 (Sum1_0, g8, A[11:8], B[11:8], 1'b0);
   rca4 rca5 (Sum1_1, p8, A[11:8], B[11:8], 1'b1);
   rca4 rca6 (Sum2_0, g12, A[15:12], B[15:12], 1'b0);
   rca4 rca7 (Sum2_1, p12, A[15:12], B[15:12], 1'b1);
   mux21x4 mux1 (Sum[7:4], Sum0_0, Sum0_1, c4);
   and a1 (w1, c4, p4);
   or o1 (c8, w1, g4);
   mux21x4 mux2 (Sum[11:8], Sum1_0, Sum1_1, c8);
   and a2 (w2, c8, p8);
   or o2 (c12, w2, g8);
   mux21x4 mux3 (Sum[15:12], Sum2_0, Sum2_1, c12);
   and a3 (w3, c12, p12);
   or o3 (Cout, w3, g12);   

endmodule // csea16
