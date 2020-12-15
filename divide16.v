module divide16 (qj, qjn, Sum1, Carry1, Sum2, Carry2, 
		 op1, op2, clk, state0);

   input [7:0]   op1, op2;
   input 	 clk, state0;
   
   output [3:0]  qj, qjn;
   output [10:0] Sum1, Carry1;   
   output [10:0] Sum2, Carry2;

   wire [7:0] 	qtotal;   
   wire [10:0] 	SumN, CarryN, SumN2, CarryN2;
   wire [10:0] 	divi1, divi2, divi1c, divi2c, dive1;
   wire [10:0] 	mdivi1_temp, mdivi2_temp, mdivi1, mdivi2;

   assign divi1 = {3'b000, op2};
   assign divi2 = {2'b00, op2, 1'b0};   
   inv11 inv1 (divi1c, divi1);
   inv11 inv2 (divi2c, divi2);
   assign dive1 = {3'b000, op1};
   
   mux21x11 mux1 (SumN, {Sum2[8:0], 2'b00}, dive1, state0);
   mux21x11 mux2 (CarryN, {Carry2[8:0], 2'b00}, 11'b00000000000, state0);
   reg11 reg1 (SumN2, SumN, clk);
   reg11 reg2 (CarryN2, CarryN, clk);
   
   // quotient = {+2, +1, -1, -2} else q = 0
   qst16 pd1 (zero1, zero2, qj, qjn, 
	      divi2, divi1, divi1c, divi2c, CarryN2, SumN2);   
   or o1 (ulp1, qj[2], qj[3]);
   or o2 (ulp2, qjn[2], qjn[3]);   
   mux41hx11 mux3 (mdivi1_temp, divi2c, divi1c, divi1, divi2, qj);
   mux41hx11 mux4 (mdivi2_temp, divi2c, divi1c, divi1, divi2, qjn);   
   mux21x11 mux5 (mdivi1, mdivi1_temp, 11'b00000000000, zero1);
   mux21x11 mux6 (mdivi2, mdivi2_temp, 11'b00000000000, zero2);   
   csa11 csa1 (Sum1, Carry1, mdivi1, SumN2, {CarryN2[10:1], ulp1});
   csa11 csa2 (Sum2, Carry2, mdivi2, 
	       {Sum1[8:0], 2'b00}, {Carry1[8:0], 1'b0, ulp2});   

endmodule // divide16

