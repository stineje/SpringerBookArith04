module mux41hx11 (out, a, b, c, d, s);

   input [10:0]  a, b, c, d;
   input [3:0] 	 s;

   output [10:0] out;

   mux41h m1 (out[0], a[0], b[0], c[0], d[0], s);
   mux41h m2 (out[1], a[1], b[1], c[1], d[1], s);
   mux41h m3 (out[2], a[2], b[2], c[2], d[2], s);
   mux41h m4 (out[3], a[3], b[3], c[3], d[3], s);
   mux41h m5 (out[4], a[4], b[4], c[4], d[4], s);
   mux41h m6 (out[5], a[5], b[5], c[5], d[5], s);
   mux41h m7 (out[6], a[6], b[6], c[6], d[6], s);
   mux41h m8 (out[7], a[7], b[7], c[7], d[7], s);
   mux41h m9 (out[8], a[8], b[8], c[8], d[8], s);
   mux41h m10 (out[9], a[9], b[9], c[9], d[9], s);
   mux41h m11 (out[10], a[10], b[10], c[10], d[10], s);

endmodule // mux41hx11

