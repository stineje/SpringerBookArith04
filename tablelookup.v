module tablelookup (data,address);

   input  [3:0] address;
   output [3:0] data;
   
   reg [3:0] memory[0:31];
   
   initial
     begin
       $readmemb("./table.dat", memory);
     end
   
   assign data = memory[address];
   
endmodule // tablelookup
