module booth4 (Z, A, B);

   input  [3:0] A, B;
   output [7:0] Z;

   wire [4:0] 	row1, row2, row3;   

   booth2decoder bdec1 (R1_1, R1_2, S1bar, S1, B[1], B[0], 1'b0);
   booth2decoder bdec2 (R2_1, R2_2, S2bar, S2, B[3], B[2], B[1]);
   booth2decoder bdec3 (R3_1, R3_2, S3bar, S3, 1'b0, 1'b0, B[3]);

   booth2select bsel1 (row1, A, R1_1, R1_2, S1);
   booth2select bsel2 (row2, A, R2_1, R2_2, S2);
   booth2select bsel3 (row3, A, R3_1, R3_2, S3);

   ha ha1 (fc3, fs2, row2[0], S2);
   ha ha2 (fc4, fs3, row2[1], row1[3]);
   fa fa1 (fc5, fs4, row2[2], row1[4], row3[0]);
   fa fa2 (fc6, fs5, row2[3], S1, row3[1]);
   fa fa3 (fc7, fs6, row2[4], S1, row3[2]);
   fa fa4 (fc8, fs7, S1bar, S2bar, row3[3]);

   rca8 cpa1 (Z, 
	      {fs7, fs6, fs5, fs4, fs3, fs2, row1[1], row1[0]},
	      {fc7, fc6, fc5, fc4, fc3, row1[2], 1'b0, S1});
   
endmodule // booth4

   
   
   
   