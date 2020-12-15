module mux21x4 (dataout, a, b, s);

   input [3:0]  a, b;
   input 	s;

   output [3:0] dataout;

   mux21 m1 (dataout[0], a[0], b[0], s);
   mux21 m2 (dataout[1], a[1], b[1], s);
   mux21 m3 (dataout[2], a[2], b[2], s);
   mux21 m4 (dataout[3], a[3], b[3], s);

endmodule // mux21x11
