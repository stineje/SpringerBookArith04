module stimulus;

   reg [3:0]  A, B;
   reg 	      Cin;
   reg 	      Clk;
   
   wire [3:0] Sum;
   wire       Cout;
   
   integer handle3;  
   integer desc3;    

   rca4 dut1 (Sum, Cout, A, B, Cin);
  
   initial 
     begin	
        Clk = 1'b1;
        forever #5 Clk = ~Clk;  
     end

   initial
     begin
        handle3 = $fopen("rca4.out");  
        #100 $finish;                
     end

   always 
     begin
        desc3 = handle3;	
        #5 $fdisplay(desc3, "%b %b %b | %b %b", A, B, Cin, Cout, Sum); 
     end

   initial
     begin
	#0   A = $random;
	#0   B = $random;
	#0   Cin = $random;	
     end

endmodule // stimulus
