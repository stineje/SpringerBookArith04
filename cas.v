module cas (T, S, U, R, Q, D, P, B, A, C);

   input  D, P, B, A, C;
   
   output T, S, U, R, Q;

   wire   W;   
   
   xor x1 (W, A, D);
   and a1 (w1, B, P);
   and a2 (w2, C, P);
   xor x2 (S, A, w1, w2);
   or o1 (w3, B, C);
   and a3 (w4, B, C);
   and a4 (w5, W, w3);
   or o2 (T, w5, w4);
   buf b1(U, B);
   buf b2(Q, P);
   buf b3(R, D);

endmodule // cas
