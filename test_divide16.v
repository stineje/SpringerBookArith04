//
// File name : test.v
// Title     : test
// project   : ECE 429/530
// Library   : test
// Author(s) : James E. Stine, Jr.
// Purpose   : definition of modules for testbench 
// notes :   
//
// Copyright Illinois Institute of Technology
//

// Top level stimulus module

module stimulus;

   reg [7:0]   op1, op2;
   reg         clock, state0;
   reg 	       Clk;   
   wire [3:0]  qj, qjn;
   wire [10:0] Sum1, Carry1;   
   wire [10:0] Sum2, Carry2;   
   
   integer     handle3;
   integer     desc3;   
   
   divide16 div1 (qj, qjn, Sum1, Carry1, Sum2, Carry2, 
		  op1, op2, clock, state0);
   
   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("divide16.out");
	#100 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b | %b %b %b || %h %h %h %h %h %h", 
		     clock, op1, op2, state0, 
		     Sum1, Carry1, Sum2, Carry2, qj, qjn);
     end

   initial
     begin
	#0  clock = 1'b0;
	#0  state0 = 1'b1;	
	#0  op1 = 8'b10101111;
	#0  op2 = 8'b11000101;
	//#0  op1 = 8'b10000000;
	//#0  op2 = 8'b10000000;
	//#0  op1 = 8'b10010011;
	//#0  op2 = 8'b11000000;	
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#20 state0 = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;
	
     end


endmodule // stimulus
