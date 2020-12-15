module mux21x8 (dataout, a, b, s);

   input [7:0]  a, b;
   input 	s;
   
   output [7:0] dataout;
   
   mux21 m1 (dataout[0], a[0], b[0], s);
   mux21 m2 (dataout[1], a[1], b[1], s);
   mux21 m3 (dataout[2], a[2], b[2], s);
   mux21 m4 (dataout[3], a[3], b[3], s);
   mux21 m5 (dataout[4], a[4], b[4], s);
   mux21 m6 (dataout[5], a[5], b[5], s);
   mux21 m7 (dataout[6], a[6], b[6], s);
   mux21 m8 (dataout[7], a[7], b[7], s);

endmodule // mux21x8


