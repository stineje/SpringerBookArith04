module xn (Sum, Sumb, A, B);
   
   input A, B;
   
   output Sum, Sumb;

   xor x1 (Sum, A, B);
   xnor x2 (Sumb, A, B);

endmodule // xn



