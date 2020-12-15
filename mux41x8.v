module mux41x8 (dataout, a, b, c, d, s);

   input [7:0]  a, b, c, d;
   input [1:0]	s;
   
   output [7:0] dataout;
   
   mux41 m1 (dataout[0], a[0], b[0], c[0], d[0], s);
   mux41 m2 (dataout[1], a[1], b[1], c[1], d[1], s);
   mux41 m3 (dataout[2], a[2], b[2], c[2], d[2], s);
   mux41 m4 (dataout[3], a[3], b[3], c[3], d[3], s);
   mux41 m5 (dataout[4], a[4], b[4], c[4], d[4], s);
   mux41 m6 (dataout[5], a[5], b[5], c[5], d[5], s);
   mux41 m7 (dataout[6], a[6], b[6], c[6], d[6], s);
   mux41 m8 (dataout[7], a[7], b[7], c[7], d[7], s);

endmodule // mux41x8



