module cla4 (Sum, A, B, Cin);
   
   input [3:0]  A, B;
   input 	Cin;

   output [3:0] Sum;

   wire [3:0] 	ctemp1, gtemp1, ptemp1;   

   rfa  r01 (gtemp1[0], ptemp1[0], Sum[0], A[0], B[0], Cin);
   rfa  r02 (gtemp1[1], ptemp1[1], Sum[1],A[1], B[1], ctemp1[1]);
   rfa  r03 (gtemp1[2], ptemp1[2], Sum[2],A[2], B[2], ctemp1[2]);
   rfa  r04 (gtemp1[3], ptemp1[3], Sum[3],A[3], B[3], ctemp1[3]);
   clg4 clg1 (ctemp1[3:0], gtemp1[3:0], ptemp1[3:0], Cin);
   
endmodule // cla4
