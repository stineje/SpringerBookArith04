module dff (reg_out, reg_in, clock);

   input  reg_in, clock;

   output reg_out;

   reg    reg_out;

   always @(posedge clock)
     reg_out <= reg_in;   
   
endmodule // dff
