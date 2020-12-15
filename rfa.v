module rfa (g, p, Sum, A, B, Cin);

   input  A, B, Cin;

   output Sum, g, p;
   
   rha ha1 (g, p, temp1, A, B);
   ha ha2 (g2, Sum, temp1, Cin);

endmodule // rfa

