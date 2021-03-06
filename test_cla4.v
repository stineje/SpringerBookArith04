module stimulus;

   reg [15:0]  A, B;
   reg 	       Cin;
   reg 	       Clk;
   
   wire [15:0] Sum;
   wire        P, G;
   
   integer handle3;  
   integer desc3;    

   cla16 dut1 (G, P, Sum, A, B, Cin);

   initial 
     begin	
        Clk = 1'b1;
        forever #5 Clk = ~Clk;  
     end

   initial
     begin
        handle3 = $fopen("cla4.out");  
        #100 $finish;                
     end

   always 
     begin
        desc3 = handle3;	
        #5 $fdisplay(desc3, "%b %b %b | %b", A, B, Cin, Sum); 
     end

   initial
     begin
	#0   A = $random;
	#0   B = $random;
	#0   Cin = $random;	
     end

endmodule // stimulus
