module rha (g, p, Sum, A, B);

   input  A, B;

   output g, p, Sum;
   
   and a1 (g, A, B);
   not i1 (Cbar, g);
   or  o1 (p, A, B);
   and a2 (Sum, Cbar, p);

endmodule // rha

