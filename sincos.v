module sincos (sin, cos, addr, load, clock, inv);
   
   input [3:0]   addr;   
   input 	 inv, load, clock;
   
   output [15:0] sin;
   output [15:0] cos;
   
   wire [15:0] 	 constX, constY, inregX, outregX, inregY;
   wire [15:0]	 outregY, outshX, outshY, outshXb, outshYb;
   wire 	 coutX, coutY, invb, invc;
   
   assign 	 constX=16'b0010011011011101;
   assign        constY=16'b0000000000000000;   

   mux21 mux1 (invc, inv, 1'b0, load);   
   
   mux21x16 mux21x2 (outregX, cos, constX, load);
   shall log1 (outshX, outregX, addr);
   xor16 cmp1 (outshXb, outshX, invc);
   rca16 cpa1 (inregX, coutX, outregX, outshYb, invc);
   reg16 reg1 (cos, inregX, clock);   
   
   mux21x16 mux21x3 (outregY, sin, constY, load);
   shall log2 (outshY, outregY, addr);
   xor16 cmp2 (outshYb, outshY, ~invc);
   rca16 cpa2 (inregY, coutY, outregY, outshXb, ~invc);
   reg16 reg2 (sin, inregY, clock);   
   
endmodule // sincos

