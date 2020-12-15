module mux31 (Z, A, B, C, S);

   input [1:0] S;   
   input       A, B, C;

   output      Z;

   not i1 (Sbar0, S[0]);
   not i2 (Sbar1, S[1]);   
   and a1 (w1, A, Sbar0, Sbar1);
   and a2 (w2, B, S[0], Sbar1);
   and a3 (w3, C, Sbar0, S[1]);   
   or o1 (Z, w1, w2, w3);

endmodule // mux31
