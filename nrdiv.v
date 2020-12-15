module nrdiv (q, rega_out, regb_out, d, x, sel_muxd, 
	      sel_muxa, sel_muxb, load_rega, load_regb, clk);

   input [7:0]  d, x;   
   input        sel_muxa, sel_muxb, sel_muxd;
   input        load_rega, load_regb;
   input        clk;
   
   output [7:0] q, rega_out, regb_out;

   wire [7:0] 	ia_out, muxa_out, muxb_out, muxd_out;
   wire [7:0] 	rne_out, twoscmp_out;
   wire [15:0] 	mul_out; 	
   
   mux21x8 mux_ia (ia_out, 8'b00110000, 8'b11010000, d[7]);  
   mux21x8 muxd (muxd_out, x, d, sel_muxd);
   mux21x8 muxa (muxa_out, rega_out, ia_out, sel_muxa);
   mux21x8 muxb (muxb_out, muxd_out, regb_out, sel_muxb);   
   csam8 csam1 (mul_out, muxa_out, muxb_out);
   rne rne1 (rne_out, mul_out);
   twos_compl tc0 (twoscmp_out, rne_out);
   reg8 regb (regb_out, twoscmp_out, load_regb);
   reg8 rega (rega_out, rne_out, load_rega);   
   assign q = rne_out;
      	
endmodule // nrdiv
