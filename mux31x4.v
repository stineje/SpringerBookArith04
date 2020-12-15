module mux31x4 (dataout, a, b, c, s);

   input [3:0]  a, b, c;
   input [1:0] 	 s;

   output [3:0] dataout;

   mux31 m1 (dataout[0], a[0], b[0], c[0], s);
   mux31 m2 (dataout[1], a[1], b[1], c[1], s);
   mux31 m3 (dataout[2], a[2], b[2], c[2], s);
   mux31 m4 (dataout[3], a[3], b[3], c[3], s);

endmodule // mux31x4