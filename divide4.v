module divide4 (quotient, Sum, Carry, op1, op2, clk, state0);

   input [7:0]   op1, op2;
   input 	 clk, state0;
   
   output [3:0]  quotient;
   output [10:0] Sum, Carry;

   wire [7:0] 	qtotal;   
   wire [10:0] 	SumN, CarryN, SumN2, CarryN2;
   wire [10:0] 	divi1, divi2, divi1c, divi2c, dive1;
   wire [10:0] 	mdivi_temp, mdivi;   
   wire         zero;

   assign divi1 = {3'b000, op2};
   assign divi2 = {2'b00, op2, 1'b0};   
   inv11 inv1 (divi1c, divi1);
   inv11 inv2 (divi2c, divi2);
   assign dive1 = {3'b000, op1};
   
   mux21x11 mux1 (SumN, {Sum[8:0], 2'b00}, dive1, state0);
   mux21x11 mux2 (CarryN, {Carry[8:0], 2'b00}, 11'b00000000000, state0);
   reg11 reg1 (SumN2, SumN, clk);
   reg11 reg2 (CarryN2, CarryN, clk);   
   rca8 cpa1 (qtotal, CarryN2[10:3], SumN2[10:3]);
   // q = {+2, +1, -1, -2} else q = 0
   qst4 pd1 (quotient, qtotal[7:1], divi1[6:4]);
   or o1 (ulp, quotient[2], quotient[3]);   
   mux41hx11 mux3 (mdivi_temp, divi2c, divi1c, divi1, divi2, quotient);
   nor n1 (zero, quotient[3], quotient[2], quotient[1], quotient[0]);
   mux21x11 mux4 (mdivi, mdivi_temp, 11'b000000000, zero);
   csa11 csa1 (Sum, Carry, mdivi, SumN2, {CarryN2[10:1], ulp});

endmodule // divide4

