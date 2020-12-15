module inv10 (out, in);

   input [9:0]  in;

   output [9:0] out;

   not i1 (out[0], in[0]);
   not i2 (out[1], in[1]);
   not i3 (out[2], in[2]);
   not i4 (out[3], in[3]);
   not i5 (out[4], in[4]);
   not i6 (out[5], in[5]);
   not i7 (out[6], in[6]);
   not i8 (out[7], in[7]);
   not i9 (out[8], in[8]);
   not i10 (out[9], in[9]);

endmodule // inv10
