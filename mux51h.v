module mux51h (Z, A, B, C, D, E, S);
   
   input [4:0] S;
   input       A, B, C, D, E;
   
   output      Z;

   and a1 (w1, A, S[4]);
   and a2 (w2, B, S[3]);
   and a3 (w3, C, S[2]);
   and a4 (w4, D, S[1]);
   and a5 (w5, E, S[0]);   
   or o1 (Z, w1, w2, w3, w4, w5);

endmodule // mux51h
