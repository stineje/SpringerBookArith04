module stimulus;

   reg [7:0]  D;
   reg [7:0]  X;
   reg 	      load_rega, load_regb, load_regc;
   reg [1:0]  sel_muxa, sel_muxb;
   reg 	      Clk;   
   wire [7:0] Q, rega_out, regb_out, regc_out;
  
   integer     handle3;
   integer     desc3;   

   divconv dut1 (Q, rega_out, regb_out, regc_out,
		 D, X, sel_muxa, sel_muxb,
		 load_rega, load_regb, load_regc);
   
   initial 
     begin	
	Clk = 1'b1;
	forever #5 Clk = ~Clk;
     end

   initial
     begin
	handle3 = $fopen("divconv.out");
	#100 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b %h %h | %h %h %h %h", sel_muxa,
		     sel_muxb, D, X, Q, rega_out, regb_out, regc_out);
     end

   initial
     begin
	#0  D = 8'b0101_0000;  // 1.5
	#0  X = 8'b0101_0000;  // 1.25

	#0  load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b0;
	#0  sel_muxb <= 2'b0;
	
	//S1:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b10;
	#0  sel_muxb <= 2'b00;
	#5  load_rega <= 1'b0;
	#0  load_regb <= 1'b1;
	#0  load_regc <= 1'b0;	

	//S2:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b10;
	#0  sel_muxb <= 2'b00;
	#5  load_rega <= 1'b1;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b1;	

	//S3:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b10;
	#5  load_rega <= 1'b0;
	#0  load_regb <= 1'b1;
	#0  load_regc <= 1'b0;	
	
	//S4:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b11;
	#5  load_rega <= 1'b1;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b1;	

	 //S4:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b10;
	#5  load_rega <= 1'b0;
	#0  load_regb <= 1'b1;
	#0  load_regc <= 1'b0;	

	 //S4:
	#15 load_rega <= 1'b0;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b0;	
	#0  sel_muxa <= 2'b00;
	#0  sel_muxb <= 2'b11;
	#5  load_rega <= 1'b1;
	#0  load_regb <= 1'b0;
	#0  load_regc <= 1'b1;	

     end


endmodule // stimulus





