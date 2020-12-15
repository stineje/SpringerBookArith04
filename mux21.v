module mux21 (Z, A, B, S);

   input  A, B, S;

   output Z;

   not i1 (Sbar, S);
   and a1 (w1, A, Sbar);
   and a2 (w2, B, S);
   or o1 (Z, w1, w2);

endmodule // mux21