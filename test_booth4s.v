module stimulus;

   reg [3:0]  A, B;
   reg 	      Clk;   
   
   wire [7:0] Z;
   
   integer     handle3;
   integer     desc3;   
   
   booth4 dut1 (Z, A, B);
   
   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("booth4s.out");
	#100 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b=%h %b=%h | %b=%h", A, A, B, B, Z, Z);
     end

   // Stimulate the Input Signals
   initial
     begin
	// Add your test vectors here
	#20 A = $random;
	#0  B = $random;
	#20 A = $random;
	#0  B = $random;	

     end


endmodule // stimulus





