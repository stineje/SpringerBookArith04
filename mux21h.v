module mux21h (Z, A, S1, B, S2);

   input  S1, S2, A, B;
   
   output Z;

   and a1 (w1, A, S1);
   and a2 (w2, B, S2);
   or o1 (Z, w1, w2);

endmodule // mux21h

   