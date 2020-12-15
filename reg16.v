module reg16 (out, in, clock);
   
   input [15:0]  in;
   input 	 clock;
   
   output [15:0] out;
   
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
   dff reg11 (out[10], in[10], clock);
   dff reg12 (out[11], in[11], clock);
   dff reg13 (out[12], in[12], clock);
   dff reg14 (out[13], in[13], clock);
   dff reg15 (out[14], in[14], clock);
   dff reg16 (out[15], in[15], clock);
   
endmodule // reg16
