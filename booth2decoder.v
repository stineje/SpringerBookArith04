module booth2decoder (M1, M2, Sbar, S, A2, A1, A0);

   input  A2, A1, A0;
   
   output M1, M2, Sbar, S;

   buf b1 (S, A2);
   not i1 (Sbar, A2);
   xor x1 (M1, A1, A0);
   xor x2 (w2, A2, A1);
   not i2 (s1, M1);
   and a1 (M2, s1, w2);

endmodule // booth2decoder

   