module cordic (sin, cos, data, currentangle,
	       endangle, addr, load, clock);

   input [15:0]  endangle;
   input 	 clock;
   input [3:0] 	 addr;
   input 	 load;

   output [15:0] sin, cos;
   output [15:0] data, currentangle;

   angle angle1 (currentangle, load, endangle, clock, data);
   sincos sincos1 (sin, cos, addr, load, clock, currentangle[15]);
   rom lrom1 (data, addr);   
   
endmodule // cordic
