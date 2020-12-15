module reg10 (out, in, clock);

   input [9:0]  in;
   input 	clock;

   output [9:0] out;

   dff reg1 (out[0], in[0], clock);   
   dff reg2 (out[1], in[1], clock);
   dff reg3 (out[2], in[2], clock);
   dff reg4 (out[3], in[3], clock);
   dff reg5 (out[4], in[4], clock);
   dff reg6 (out[5], in[5], clock);
   dff reg7 (out[6], in[6], clock);
   dff reg8 (out[7], in[7], clock);
   dff reg9 (out[8], in[8], clock);
   dff reg10 (out[9], in[9], clock);

endmodule // reg10
