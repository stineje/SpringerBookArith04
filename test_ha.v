module stimulus;

   reg  A, B;
   reg  Clk;   
   
   wire Cout, Sum;
   
   integer handle3;  
   integer desc3;    

   ha dut1 (Cout, Sum, A, B);
   
   initial 
     begin	
        Clk = 1'b1;
        forever #5 Clk = ~Clk;  
     end

   initial
     begin
        handle3 = $fopen("ha.out");  
        #100 $finish;                  
     end

   always 
     begin
        desc3 = handle3;	
        #5 $fdisplay(desc3, "%b %b | %b %b", A, B, Cout, Sum); 
     end

   initial
     begin
	#0   A = $random;
	#0   B = $random;
     end

endmodule // stimulus
