module divide2 (w, q, D, N, state0, Clk);

   input  [7:0]  D;
   input  [7:0]  N;
   input	 Clk, state0;
   
   output [9:0] w;
   output [1:0] q;   
   
   wire [9:0] 	Mux3Out, Mux2Out, Sum, OnesCompD;
   wire 	cout;   
  
   inv10 i1 (OnesCompD, {2'b00,D});   
   mux31x10 m3 (Mux3Out, 10'b0000000000, {2'b00, D}, OnesCompD, q);
   mux21x10 m2 (Mux2Out, {Sum[8:0], 1'b0}, {2'b00, N}, state0);
   reg10 r1 (w, Mux2Out, Clk);  
   // q = {+1, -1} else q = 0   
   qst qd1 (q, w[9], w[8], w[7]);   
   rca10 d1 (Sum, cout, w, Mux3Out, q[1]);
   
endmodule // divide2



