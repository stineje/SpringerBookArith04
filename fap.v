module fap (Cout, Sum, p, A, B, Cin);

   input  A, B, Cin;

   output p, Sum, Cout;
   
   rha ha1 (g1, p, temp1, A, B);
   ha ha2 (g2, Sum, temp1, Cin);
   or o1 (Cout, g1, g2);

endmodule // fap



