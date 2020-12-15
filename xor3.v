module xor3 (outp, inp, selb);

   input [2:0]  inp;
   input 	selb;

   output [2:0] outp;   
   
   xor x0 (outp[0], inp[0], selb);
   xor x1 (outp[1], inp[1], selb);
   xor x2 (outp[2], inp[2], selb);
   
endmodule // xor3



