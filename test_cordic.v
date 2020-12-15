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

   reg [15:0]  endangle;
   reg [3:0]   addr;   
   reg 	       load;
   reg         clock;
   reg 	       Clk;   
   wire [15:0] sin, cos;
   wire [15:0] data, currentangle;   
   
   integer     handle3;
   integer     desc3;   
   
   cordic ef1(sin, cos, data, currentangle,
	      endangle, addr, load, clock);
   
   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("cordic.out");
	#600 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %h %b %b || %b %b %h %h", 
		     endangle, addr, clock, load, sin, cos, data, currentangle);

	
     end

   initial
     begin
	#0  clock = 1'b0;	
	#0  addr = 4'b0000;	
	#0  endangle = 16'h2500;
	#0  load = 1'b1;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

        #0  addr = 4'b0001;
        #0  load = 1'b0;
        #20 clock = 1'b1;
        #20 clock = 1'b0;

	#0  addr = 4'b0010;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b0011;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b0100;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b0101;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b0110;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b0111;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1000;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1001;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1010;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1011;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1100;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1101;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;
	
	#0  addr = 4'b1110;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	#0  addr = 4'b1111;
	#0  load = 1'b0;
	#20 clock = 1'b1;
	#20 clock = 1'b0;

	
	
     end


endmodule // stimulus





