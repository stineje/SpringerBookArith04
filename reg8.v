module reg8 (out, in, clock);
   
   input [7:0]  in;
   input 	clock;   
   
   output [7:0] out;
   
   dff reg1 (out[0], in[0], clock);
   dff reg2 (out[1], in[1], clock);
   dff reg3 (out[2], in[2], clock);
   dff reg4 (out[3], in[3], clock);
   dff reg5 (out[4], in[4], clock);
   dff reg6 (out[5], in[5], clock);
   dff reg7 (out[6], in[6], clock);
   dff reg8 (out[7], in[7], clock);
   
endmodule // reg8
