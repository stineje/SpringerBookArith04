module rom_a0 (data, address);

   input [4:0]  address;
   
   output [7:0] data;
   
   reg [7:0] 	memory[0:31];

   initial
     begin
	$readmemb("./a0.dat", memory);
     end

   assign data = memory[address];

endmodule

module rom_a1 (data, address);

   input [3:0]  address;
   
   output [2:0] data;

   reg [2:0] 	memory[0:15];

   initial
     begin
	$readmemb("./a1.dat", memory);
     end
   
   assign data = memory[address];

endmodule

