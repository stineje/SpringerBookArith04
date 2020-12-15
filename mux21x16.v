module mux21x16 (dataout, a, b, s);

   input [15:0]  a, b;
   input 	 s;
   
   output [15:0] dataout;
   
   mux21 m1 (dataout[0], a[0], b[0], s);
   mux21 m2 (dataout[1], a[1], b[1], s);
   mux21 m3 (dataout[2], a[2], b[2], s);
   mux21 m4 (dataout[3], a[3], b[3], s);
   mux21 m5 (dataout[4], a[4], b[4], s);
   mux21 m6 (dataout[5], a[5], b[5], s);
   mux21 m7 (dataout[6], a[6], b[6], s);
   mux21 m8 (dataout[7], a[7], b[7], s);
   mux21 m9 (dataout[8], a[8], b[8], s);
   mux21 m10 (dataout[9], a[9], b[9], s);
   mux21 m11 (dataout[10], a[10], b[10], s);
   mux21 m12 (dataout[11], a[11], b[11], s);
   mux21 m13 (dataout[12], a[12], b[12], s);
   mux21 m14 (dataout[13], a[13], b[13], s);
   mux21 m15 (dataout[14], a[14], b[14], s);
   mux21 m16 (dataout[15], a[15], b[15], s);
 
endmodule // mux21x16

