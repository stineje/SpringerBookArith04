module xor16 (outp, inp, selb);

   input [15:0]  inp;
   input 	 selb;

   output [15:0] outp;   
   
   xor x0 (outp[0], inp[0], selb);
   xor x1 (outp[1], inp[1], selb);
   xor x2 (outp[2], inp[2], selb);
   xor x3 (outp[3], inp[3], selb);
   xor x4 (outp[4], inp[4], selb);
   xor x5 (outp[5], inp[5], selb);
   xor x6 (outp[6], inp[6], selb);
   xor x7 (outp[7], inp[7], selb);
   xor x8 (outp[8], inp[8], selb);
   xor x9 (outp[9], inp[9], selb);
   xor x10 (outp[10], inp[10], selb);
   xor x11 (outp[11], inp[11], selb);
   xor x12 (outp[12], inp[12], selb);
   xor x13 (outp[13], inp[13], selb);
   xor x14 (outp[14], inp[14], selb);
   xor x15 (outp[15], inp[15], selb);
   
endmodule // xor16

