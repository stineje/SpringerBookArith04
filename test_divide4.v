module stimulus;

   reg [7:0]   op1, op2;
   reg         clock, state0;
   reg 	       Clk;
   wire [3:0]  quotient;
   wire [10:0] Sum, Carry;
   
   integer     handle3;
   integer     desc3;   
   
   divide4 div1 (quotient, Sum, Carry, op1, op2, clock, state0);

   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("divide4.out");
	#200 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b | %b %b %b || %h %h %b", 
		     clock, op1, op2, state0, Sum, Carry, quotient);
     end

   initial
     begin
	#0  clock = 1'b0;
	#0  state0 = 1'b1;	
	#0  op1 = 8'b10101111;
	#0  op2 = 8'b11000101;
	//#0  op1 = 8'b10000000;
	//#0  op2 = 8'b10000000;	
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#20 state0 = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#20 clock = 1'b1;
	#20 clock = 1'b0;
	
     end


endmodule // stimulus





