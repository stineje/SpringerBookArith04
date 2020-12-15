module postprocess (Z, Cout, A, B, C);

   input [15:0]  A, B, C;   

   output [15:0] Z;
   output 	 Cout;   

   rfa rfa1 (g0, p0, Z[0], A[0], B[0], 1'b0);   
   rfa rfa2 (g1, p1, Z[1], A[1], B[1], C[0]);
   rfa rfa3 (g2, p2, Z[2], A[2], B[2], C[1]);
   rfa rfa4 (g3, p3, Z[3], A[3], B[3], C[2]);
   rfa rfa5 (g4, p4, Z[4], A[4], B[4], C[3]);
   rfa rfa6 (g5, p5, Z[5], A[5], B[5], C[4]);
   rfa rfa7 (g6, p6, Z[6], A[6], B[6], C[5]);
   rfa rfa8 (g7, p7, Z[7], A[7], B[7], C[6]);
   rfa rfa9 (g8, p8, Z[8], A[8], B[8], C[7]);
   rfa rfa10 (g9, p9, Z[9], A[9], B[9], C[8]);
   rfa rfa11 (g10, p10, Z[10], A[10], B[10], C[9]);
   rfa rfa12 (g11, p11, Z[11], A[11], B[11], C[10]);
   rfa rfa13 (g12, p12, Z[12], A[12], B[12], C[11]);
   rfa rfa14 (g13, p13, Z[13], A[13], B[13], C[12]);
   rfa rfa15 (g14, p14, Z[14], A[14], B[14], C[13]);
   rfa rfa16 (g15, p15, Z[15], A[15], B[15], C[14]);
   buf b1(Cout, C[15]);  

endmodule // postprocess
