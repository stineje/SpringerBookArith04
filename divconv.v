module divconv (q, rega_out, regb_out, regc_out, 
		d, x, sel_muxa, sel_muxb, 
		load_rega, load_regb, load_regc);

   input [7:0]  d, x;
   input [1:0]  sel_muxa, sel_muxb;
   input        load_rega, load_regb, load_regc;
   
   output [7:0] q, rega_out, regb_out, regc_out;

   wire [7:0] 	muxa_out, muxb_out, rne_out, twoscmp_out, ia_out;
   wire [15:0] 	mul_out;   
         
   mux21x8 mux_ia (ia_out, 8'b00110000, 8'b11010000, d[7]);  
   mux41x8 mux2 (muxb_out, d, x, regb_out, regc_out, 
                 sel_muxb);
   mux31x8 mux3 (muxa_out, rega_out, d, ia_out, sel_muxa);   
   csam8 csam0 (mul_out, muxa_out, muxb_out);
   rne rne0 (rne_out, mul_out);
   twos_compl tc0 (twoscmp_out, rne_out);     
   reg8 regc (rega_out, twoscmp_out, load_rega);
   reg8 regb (regb_out, rne_out, load_regb);
   reg8 rega (regc_out, rne_out, load_regc);
   assign q = rne_out;
      	
endmodule // divconv
