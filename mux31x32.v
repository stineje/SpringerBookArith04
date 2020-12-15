module mux31x32 (dataout, a, b, c, s);

   input [31:0]  a, b, c;
   input [1:0] 	 s;

   output [31:0] dataout;

   mux31 m1 (dataout[0], a[0], b[0], c[0], s);
   mux31 m2 (dataout[1], a[1], b[1], c[1], s);
   mux31 m3 (dataout[2], a[2], b[2], c[2], s);
   mux31 m4 (dataout[3], a[3], b[3], c[3], s);
   mux31 m5 (dataout[4], a[4], b[4], c[4], s);
   mux31 m6 (dataout[5], a[5], b[5], c[5], s);
   mux31 m7 (dataout[6], a[6], b[6], c[6], s);
   mux31 m8 (dataout[7], a[7], b[7], c[7], s);
   mux31 m9 (dataout[8], a[8], b[8], c[8], s);
   mux31 m10 (dataout[9], a[9], b[9], c[9], s);
   mux31 m11 (dataout[10], a[10], b[10], c[10], s);
   mux31 m12 (dataout[11], a[11], b[11], c[11], s);
   mux31 m13 (dataout[12], a[12], b[12], c[12], s);
   mux31 m14 (dataout[13], a[13], b[13], c[13], s);
   mux31 m15 (dataout[14], a[14], b[14], c[14], s);
   mux31 m16 (dataout[15], a[15], b[15], c[15], s);
   mux31 m17 (dataout[16], a[16], b[16], c[16], s);
   mux31 m18 (dataout[17], a[17], b[17], c[17], s);
   mux31 m19 (dataout[18], a[18], b[18], c[18], s);
   mux31 m20 (dataout[19], a[19], b[19], c[19], s);
   mux31 m21 (dataout[20], a[20], b[20], c[20], s);
   mux31 m22 (dataout[21], a[21], b[21], c[21], s);
   mux31 m23 (dataout[22], a[22], b[22], c[22], s);
   mux31 m24 (dataout[23], a[23], b[23], c[23], s);
   mux31 m25 (dataout[24], a[24], b[24], c[24], s);
   mux31 m26 (dataout[25], a[25], b[25], c[25], s);
   mux31 m27 (dataout[26], a[26], b[26], c[26], s);
   mux31 m28 (dataout[27], a[27], b[27], c[27], s);
   mux31 m29 (dataout[28], a[28], b[28], c[28], s);
   mux31 m30 (dataout[29], a[29], b[29], c[29], s);
   mux31 m31 (dataout[30], a[30], b[30], c[30], s);
   mux31 m32 (dataout[31], a[31], b[31], c[31], s);

endmodule // mux31x32



