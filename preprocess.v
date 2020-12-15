module preprocess (G, P, A, B);

   input [15:0] A, B;
   
   output [15:0] P, G;

   or o1(P[0], A[0], B[0]);
   or o2(P[1], A[1], B[1]);
   or o3(P[2], A[2], B[2]);
   or o4(P[3], A[3], B[3]);
   or o5(P[4], A[4], B[4]);
   or o6(P[5], A[5], B[5]);
   or o7(P[6], A[6], B[6]);
   or o8(P[7], A[7], B[7]);
   or o9(P[8], A[8], B[8]);
   or o10(P[9], A[9], B[9]);
   or o11(P[10], A[10], B[10]);
   or o12(P[11], A[11], B[11]);
   or o13(P[12], A[12], B[12]);
   or o14(P[13], A[13], B[13]);
   or o15(P[14], A[14], B[14]);
   or o16(P[15], A[15], B[15]);

   and a1(G[0], A[0], B[0]);
   and a2(G[1], A[1], B[1]);
   and a3(G[2], A[2], B[2]);
   and a4(G[3], A[3], B[3]);
   and a5(G[4], A[4], B[4]);
   and a6(G[5], A[5], B[5]);
   and a7(G[6], A[6], B[6]);
   and a8(G[7], A[7], B[7]);
   and a9(G[8], A[8], B[8]);
   and a10(G[9], A[9], B[9]);
   and a11(G[10], A[10], B[10]);
   and a12(G[11], A[11], B[11]);
   and a13(G[12], A[12], B[12]);
   and a14(G[13], A[13], B[13]);
   and a15(G[14], A[14], B[14]);
   and a16(G[15], A[15], B[15]);            
   
endmodule // preprocess
