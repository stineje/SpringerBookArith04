module stimulus;

   reg [6:0]  ia_in;
   reg 	      Clk;   
   wire [7:0] ia_out;
   wire [9:0] p0, p1;
     
   integer     handle3;
   integer     desc3;   

   sbtm dut1 (p0, p1, ia_out, ia_in);
  
   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("sbtm.out");
	#100 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b | %b %b %b", ia_in, ia_out, p0, p1);
     end

   initial
     begin
	#0 ia_in = 7'b0000000;	

     end


endmodule // stimulus





