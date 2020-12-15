module black (gout, pout, gin1, pin1, gin2, pin2);

   input gin1, pin1, gin2, pin2;

   output gout, pout;
   
   and xo1(pout, pin1, pin2);
   and an1(o1, pin1, gin2);
   or  or1(gout, o1, gin1);

endmodule // black
