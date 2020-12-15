module mux41h (Z, A, B, C, D, S);

   input [3:0] S;
   input       A, B, C, D;   

   output      Z;

   and a1 (w1, A, S[3]);
   and a2 (w2, B, S[2]);
   and a3 (w3, C, S[1]);
   and a4 (w4, D, S[0]);   
   or o1 (Z, w1, w2, w3, w4);

endmodule // mux41h
