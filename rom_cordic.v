module rom (data, address);

   input [3:0]   address;
   
   output [15:0] data;

   reg [15:0] 	 memory[0:15];

   initial
     begin
	$readmemh("./cordic.dat", memory);
     end
   
   assign data = memory[address];

endmodule // rom
