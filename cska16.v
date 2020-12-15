module cska16 (Sum, Cout, A, B, Cin);

   input [15:0]  A, B;
   input         Cin;
   
   output [15:0] Sum;
   output 	 Cout;

   wire [3:0] 	 p1, p2;   

   rca4  cpa1 (Sum[3:0], c4, A[3:0], B[3:0], Cin);
   rca4p cpa2 (Sum[7:4], w1, p1, A[7:4], B[7:4], c4);
   rca4p cpa3 (Sum[11:8], w3, p2, A[11:8], B[11:8], c7);
   rca4  cpa4 (Sum[15:12], Cout, A[15:12], B[15:12], c12);
   and a1 (w2, p1[0], p1[1], p1[2], p1[3], c4);
   or o1 (c7, w1, w2);
   and a2 (w4, p2[0], p2[1], p2[2], p2[3], c7);
   or o2 (c12, w3, w4);   

endmodule // cska16
