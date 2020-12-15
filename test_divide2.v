//
// File name : test.v
// Title     : test
// project   : ECE 429/530
// Library   : test
// Purpose   : definition of modules for testbench 
// notes :   
//
// Copyright Illinois Institute of Technology
//

// Top level stimulus module

module stimulus;

   reg [7:0]  N;
   reg [7:0]  D;
   reg 	      state0, clock;
   reg 	      Clk;   
   wire [9:0] w;
   wire [1:0] q;
             
   integer     handle3;
   integer     desc3;   
   
   divide2 dut1 (w, q, D, N, state0, clock);
   
   initial 
     begin	
	Clk = 1'd1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("divide2.out");
	#100 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%h %h %b %b || %h %h", N, D, state0, clock,
		     w, q);  
     end

   initial
     begin
	#0  N = 8'h9F;
	#0  D = 8'hC5;
	#0  clock = 1'b0;
	#0  state0 = 1'b1;

	#10 clock = 1'b1;
	#10 clock = 1'b0;
	#0  state0 = 1'b0;
	
	#10 clock = 1'b1;
	#10  clock = 1'b0;

	#10 clock = 1'b1;
	#10  clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;

	#10 clock = 1'b1;
	#10 clock = 1'b0;
	
	

	
	
	
	

     end

endmodule // stimulus
