module sbtm (p0, p1, ia_out, ia_in);

   input [6:0]   ia_in;
   
   output [7:0] ia_out;
   output [9:0] p0, p1;   

   wire [9:0] 	p;   
   wire [2:0] 	x3out, rom1out;
   wire [7:0] 	rom0out;
   wire 	cout;   
   
   rom_a0 r0 (rom0out, ia_in[6:2]);
   assign p0 = {1'b1, rom0out, 1'b0};
   
   xor x0(x0out, ia_in[0], ia_in[1]);
   rom_a1 r1 (rom1out, {ia_in[6:4], x0out});
   xor3 x3 (x3out, rom1out, ia_in[1]);
   assign p1 = {{6{ia_in[1]}}, x3out, 1'b1};

   // sbtm
   // n0 = 3, n1 = 2, n2 = 2 and g = 2 (from eqns)
   // p = n0 + n1 + n2 + g + 1 = 3 + 2 + 2 + 2 + 1 = 10
   rca10 cpa1 (p, cout, p0, p1, 1'b0);   
   assign ia_out = {1'b0, p[8:2]};

endmodule // sbtm
