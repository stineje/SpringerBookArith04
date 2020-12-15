module white (gout, pout, gin, pin);

   input gin;
   input pin;

   output gout;
   output pout;

   buf b1(gout, gin);
   buf b2(pout, pin);

endmodule // white
