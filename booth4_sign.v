module booth4 (Z, A, B);

   input  [3:0] A, B;
   output [7:0] Z;

   wire [4:0] 	row1, row2, row3;   

   booth2decoder bdec1 (R1_1, R1_2, S1bar, S1, B[1], B[0], 1'b0);
   booth2decoder bdec2 (R2_1, R2_2, S2bar, S2, B[3], B[2], B[1]);

   booth2select bsel1 (row1, E1, E1bar, A, R1_1, R1_2, S1);
   booth2select bsel2 (row2, E2, E2bar, A, R2_1, R2_2, S2);

   ha ha1 (fc3, fs2, row2[0], S2);
   ha ha2 (fc4, fs3, row2[1], row1[3]);
   ha ha3 (fc5, fs4, row2[2], row1[4]);
   ha ha4 (fc6, fs5, row2[3], E1bar);
   ha ha5 (fc7, fs6, row2[4], E1bar);
   ha ha6 (fc8, fs7, E1, E2);

   rca8 cpa1 (Z, 
	      {fs7, fs6, fs5, fs4, fs3, fs2, row1[1], row1[0]},
	      {fc7, fc6, fc5, fc4, fc3, row1[2], 1'b0, S1});

endmodule // booth4

   
   
   
   