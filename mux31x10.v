module mux31x10 (dataout, a, b, c, s);

   input [9:0]  a, b, c;
   input [1:0] 	s;

   output [9:0] dataout;

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

endmodule // mux31x10


