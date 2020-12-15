module stimulus;

   reg  [3:0]  X, Y;
   reg  Clk;   
   
   wire [7:0] Z;
   
   integer handle3;  
   integer desc3;    

   array4tc dut1 (Z, X, Y);
   
   initial 
     begin	
        Clk = 1'b1;
        forever #5 Clk = ~Clk;  
     end

   initial
     begin
        handle3 = $fopen("array4tc.out");  
        #100 $finish;                
     end

   always 
     begin
        desc3 = handle3;	
        #5 $fdisplay(desc3, "%h %h | %h", X, Y, Z); 
     end

   initial
     begin
	#0   X = 4'hF;
	#0   Y = $random;
     end

endmodule // stimulus
