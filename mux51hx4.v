module mux51hx4 (out, a, b, c, d, e, s);

   input [3:0]  a, b, c, d, e;
   input [4:0] 	s;

   output [3:0] out;

   mux51h m1 (out[0], a[0], b[0], c[0], d[0], e[0], s);
   mux51h m2 (out[1], a[1], b[1], c[1], d[1], e[1], s);
   mux51h m3 (out[2], a[2], b[2], c[2], d[2], e[2], s);
   mux51h m4 (out[3], a[3], b[3], c[3], d[3], e[3], s);

endmodule // mux51hx4

