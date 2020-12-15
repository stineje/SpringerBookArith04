module cla16 (Sum, G, P, A, B, Cin);
   
   input [15:0]  A, B;
   input 	 Cin;
   
   output [15:0] Sum;
   output 	 P, G;   

   wire [15:0] 	 gtemp1, ptemp1, ctemp1;
   wire [3:0] 	 gouta, pouta, ctemp2;   

   rfa  r01 (gtemp1[0], ptemp1[0], Sum[0], A[0], B[0], Cin);
   rfa  r02 (gtemp1[1], ptemp1[1], Sum[1], A[1], B[1], ctemp1[1]);
   rfa  r03 (gtemp1[2], ptemp1[2], Sum[2], A[2], B[2], ctemp1[2]);
   rfa  r04 (gtemp1[3], ptemp1[3], Sum[3], A[3], B[3], ctemp1[3]);
   bclg4 b1 (ctemp1[3:0], gouta[0], pouta[0], gtemp1[3:0], 
	     ptemp1[3:0], Cin);
   rfa  r05 (gtemp1[4], ptemp1[4], Sum[4], A[4], B[4], ctemp2[1]);
   rfa  r06 (gtemp1[5], ptemp1[5], Sum[5], A[5], B[5], ctemp1[5]);
   rfa  r07 (gtemp1[6], ptemp1[6], Sum[6], A[6], B[6], ctemp1[6]);
   rfa  r08 (gtemp1[7], ptemp1[7], Sum[7], A[7], B[7], ctemp1[7]);
   bclg4  b2 (ctemp1[7:4], gouta[1], pouta[1], gtemp1[7:4], 
	      ptemp1[7:4], ctemp2[1]);   
   rfa  r09 (gtemp1[8], ptemp1[8], Sum[8], A[8], B[8], ctemp2[2]);
   rfa  r10 (gtemp1[9], ptemp1[9], Sum[9], A[9], B[9], ctemp1[9]);
   rfa  r11 (gtemp1[10], ptemp1[10], Sum[10], A[10], B[10], ctemp1[10]);
   rfa  r12 (gtemp1[11], ptemp1[11], Sum[11], A[11], B[11], ctemp1[11]);
   bclg4  b3 (ctemp1[11:8], gouta[2], pouta[2], gtemp1[11:8], 
              ptemp1[11:8], ctemp2[2]);   
   rfa  r13 (gtemp1[12], ptemp1[12], Sum[12], A[12], B[12], ctemp2[3]);
   rfa  r14 (gtemp1[13], ptemp1[13], Sum[13], A[13], B[13], ctemp1[13]);
   rfa  r15 (gtemp1[14], ptemp1[14], Sum[14], A[14], B[14], ctemp1[14]);
   rfa  r16 (gtemp1[15], ptemp1[15], Sum[15], A[15], B[15], ctemp1[15]);
   bclg4  b4 (ctemp1[15:12], gouta[3], pouta[3], gtemp1[15:12], 
              ptemp1[15:12], ctemp2[3]);

   bclg4  b5 (ctemp2, G, P, gouta, pouta, Cin);
   
endmodule // cla16
