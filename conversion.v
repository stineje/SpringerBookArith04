// on-the-fly conversion

module load_shift_control (Qin, QMin, CshiftQ, CshiftQM, Qkplusone);

   input [1:0] Qkplusone;	// Qkplusone[0] is the q- bit, Qkplusone[1] is the q+ bit
   
   output Qin;
   output CshiftQ;
   output QMin;
   output CshiftQM;
   	
   not i1(CshiftQ, Qkplusone[0]);
   not i2(CshiftQM, Qkplusone[1]);   
   or  o1(Qin, Qkplusone[1], Qkplusone[0]);
   nor n1(QMin, Qkplusone[1], Qkplusone[0]);
   
endmodule // load_shift_control

module conversion (Q, Qkplusone, SignRemainder, Clk, Load, Reset);

   input  [1:0] Qkplusone;
   input       	SignRemainder;
   input  	Clk;
   input	Load;
   input	Reset;
   
   output [7:0] Q;
   
   wire   [7:0] Qstar, QMstar;
   wire 	Qin, CshiftQ, QMin, CshiftQM;
   wire   [7:0] M1Q, R1Q, M2Q, R2Q;
      
   load_shift_control ls1(Qin, QMin, CshiftQ, CshiftQM, Qkplusone);
   
   mux21x8  m1(M1Q, Qstar, QMstar, CshiftQM);
   register8 r1(R1Q, {M1Q[6:0], QMin}, Clk, Load, Reset);
   	
   mux21x8  m2(M2Q, QMstar, Qstar, CshiftQ);
   register8 r2(R2Q, {M2Q[6:0], Qin}, Clk, Load, Reset);
   	
   mux21x8  m3(Q, R2Q, R1Q, SignRemainder);
   
   assign Qstar = R2Q;
   assign QMstar = R1Q;
   
endmodule // conversion

module register8 (Q, D, Clk, Load, Reset);

   input  [7:0] D;
   input        Clk;
   input        Load;
   input        Reset;

   output [7:0] Q;
   reg [7:0] Q;
      
   always @(posedge Clk or posedge Reset)
       if (Reset)
           Q <= 8'h00;
       else
           if (Load) 
   	      Q <= D;
           else
   	      Q <= Q;
   
endmodule // register8