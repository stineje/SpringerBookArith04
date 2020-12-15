module stimulus;

   reg  A, B, Cin;
   reg  Clk;   
   
   wire Cout, Sum;
   
   integer handle3;  
   integer desc3;    

   fa dut1 (Cout, Sum, A, B, Cin);
   
   initial 
     begin	
        Clk = 1'b1;
        forever #5 Clk = ~Clk;  
     end

   initial
     begin
        handle3 = $fopen("fa.out");  
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
