module angle (outreg, load, endangle, clock, data);

   input [15:0]  endangle;
   input 	 load, clock;
   input [15:0]  data;

   output [15:0] outreg;
   
   wire [15:0] 	 inreg, currentangle, subadd;
   wire 	 cout, negoutreg;

   mux21x16 mux1 (inreg, outreg, endangle, load);
   xor16 cmp1 (subadd, data, ~inreg[15]);
   rca16 cpa1 (currentangle, cout, subadd, inreg, ~inreg[15]);
   
   reg16 reg1 (outreg, currentangle, clock);
   
endmodule
