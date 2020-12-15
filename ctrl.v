module ctrl (P, D, x, x_1);

   input  x, x_1;
   
   output P, D;
   
   assign P = x ^ x_1;
   xor x1 (P, x, x_1);
   not i1 (x_1b, x_1);
   and a1 (D, x, x_1b);
   
endmodule // ctrl
