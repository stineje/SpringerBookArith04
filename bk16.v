module bk16 (Sum, Cout, A, B);

   input [15:0]  A, B;   

   wire [7:0] 	 g0, p0;
   wire [3:0] 	 g1, p1;
   wire [1:0] 	 g2, p2;
   wire [1:0] 	 g3, p3;
   wire [22:0] 	 g4, p4;
   wire [6:0] 	 g5, p5;
   wire [15:0] 	 G, P;   
   
   output [15:0] Sum;
   output 	 Cout;   

   preprocess pre1 (G, P, A, B);
   black  b1 (g0[0], p0[0], G[1], P[1], G[0], P[0]);
   black  b2 (g0[1], p0[1], G[3], P[3], G[2], P[2]);
   black  b3 (g0[2], p0[2], G[5], P[5], G[4], P[4]);
   black  b4 (g0[3], p0[3], G[7], P[7], G[6], P[6]);
   black  b5 (g0[4], p0[4], G[9], P[9], G[8], P[8]);
   black  b6 (g0[5], p0[5], G[11], P[11], G[10], P[10]);
   black  b7 (g0[6], p0[6], G[13], P[13], G[12], P[12]);
   black  b8 (g0[7], p0[7], G[15], P[15], G[14], P[14]);
   black  b9 (g1[0], p1[0], g0[1], p0[1], g0[0], p0[0]);
   black  b10 (g1[1], p1[1], g0[3], p0[3], g0[2], p0[2]);
   black  b11 (g1[2], p1[2], g0[5], p0[5], g0[4], p0[4]);
   black  b12 (g1[3], p1[3], g0[7], p0[7], g0[6], p0[6]);
   black  b13 (g2[0], p2[0], g1[1], p1[1], g1[0], p1[0]);
   black  b14 (g2[1], p2[1], g1[3], p1[3], g1[2], p1[2]);
   black  b15 (g3[0], p3[0], g1[2], p1[2], g2[0], p2[0]);
   black  b16 (g3[1], p3[1], g2[1], p2[1], g2[0], p2[0]);
   black  b17 (g4[0], p4[0], g0[2], p0[2], g1[0], p1[0]);
   black  b18 (g4[1], p4[1], g0[4], p0[4], g2[0], p2[0]);
   black  b19 (g4[2], p4[2], g0[6], p0[6], g3[0], p3[0]);
   black  b20 (g5[0], p5[0], G[2], P[2], g0[0], p0[0]);
   black  b21 (g5[1], p5[1], G[4], P[4], g1[0], p1[0]);
   black  b22 (g5[2], p5[2], G[6], P[6], g4[0], p4[0]);
   black  b23 (g5[3], p5[3], G[8], P[8], g2[0], p2[0]);
   black  b24 (g5[4], p5[4], G[10], P[10], g4[1], p4[1]);
   black  b25 (g5[5], p5[5], G[12], P[12], g3[0], p3[0]);
   black  b26 (g5[6], p5[6], G[14], P[14], g4[2], p4[2]);
   
   postprocess post2 (Sum, Cout, A, B, 
		      {g3[1], g5[6], g4[2], g5[5], g3[0], g5[4], g4[1], g5[3],
		       g2[0], g5[2], g4[0], g5[1], g1[0], g5[0], g0[0], G[0]});

endmodule // bk16


   