module booth2select (Z, E, Ebar, B, M1, M2, S);

   input [3:0]  B;
   input        M1, M2, S;
   output [4:0] Z;
   output 	E, Ebar;   

   wire [4:0] 	w;   

   mux21h mux1 (w[4], B[3], M2, B[3], M1);
   mux21h mux2 (w[3], B[2], M2, B[3], M1);
   mux21h mux3 (w[2], B[1], M2, B[2], M1);
   mux21h mux4 (w[1], B[0], M2, B[1], M1);
   mux21h mux5 (w[0], 1'b0, M2, B[0], M1);

   xor x1 (Z[4], w[4], S);
   xor x2 (Z[3], w[3], S);
   xor x3 (Z[2], w[2], S);
   xor x4 (Z[1], w[1], S);
   xor x5 (Z[0], w[0], S);
   xn x6 (Ebar, E, S, B[3]);

endmodule // booth2select

   
   