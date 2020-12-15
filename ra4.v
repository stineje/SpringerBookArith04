module ra (Z, A, B);
   
   input [3:0] B;
   input [3:0] A;
   output [7:0] Z;
   
   wire [7:0] 	S;
   wire [7:0] 	C;
   wire [6:0] 	carry;
   
   // generate the partial products.
   and pp1(N0_0_0, A[0], B[0]);
   and pp2(N0_0_1, A[1], B[0]);
   and pp3(N0_0_2, A[2], B[0]);
   and pp4(N0_0_3, A[3], B[0]);
   and pp5(N0_1_1, A[0], B[1]);
   and pp6(N0_1_2, A[1], B[1]);
   and pp7(N0_1_3, A[2], B[1]);
   and pp8(N0_1_4, A[3], B[1]);
   and pp9(N0_2_2, A[0], B[2]);
   and pp10(N0_2_3, A[1], B[2]);
   and pp11(N0_2_4, A[2], B[2]);
   and pp12(N0_2_5, A[3], B[2]);
   and pp13(N0_3_3, A[0], B[3]);
   and pp14(N0_3_4, A[1], B[3]);
   and pp15(N0_3_5, A[2], B[3]);
   and pp16(N0_3_6, A[3], B[3]);

   ha HA1(N2_1_2, N2_0_1, N0_0_1, N0_1_1);
   fa FA1(N2_1_3, N2_0_2, N0_0_2, N0_1_2, N0_2_2);
   fa FA2(N2_1_4, N2_0_3, N0_0_3, N0_1_3, N0_2_3);
   fa FA3(N2_1_5, N2_0_4, N0_1_4, N0_2_4, N0_3_4);   
   ha HA2(N3_1_3, N3_0_2, N2_0_2, N2_1_2);
   fa FA4(N3_1_4, N3_0_3, N0_3_3, N2_0_3, N2_1_3);
   ha HA3(N3_1_5, N3_0_4, N2_0_4, N2_1_4);
   fa FA5(N3_1_6, N3_0_5, N0_2_5, N0_3_5, N2_1_5);

   buf bufC0(C[0], 1'b0);
   buf bufC1(C[1], 1'b0);
   buf bufC2(C[2], 1'b0);
   buf bufC3(C[3], N3_0_3);
   buf bufC4(C[4], N3_0_4);
   buf bufC5(C[5], N3_0_5);
   buf bufC6(C[6], N0_3_6);
   buf bufS0(S[0], N0_0_0);
   buf bufS1(S[1], N2_0_1);
   buf bufS2(S[2], N3_0_2);
   buf bufS3(S[3], N3_1_3);
   buf bufS4(S[4], N3_1_4);
   buf bufS5(S[5], N3_1_5);
   buf bufS6(S[6], N3_1_6);

   ha CPA1(carry[0],Z[0],C[0],S[0]);
   fa CPA2(carry[1],Z[1],carry[0],C[1],S[1]);
   fa CPA3(carry[2],Z[2],carry[1],C[2],S[2]);
   fa CPA4(carry[3],Z[3],carry[2],C[3],S[3]);
   fa CPA5(carry[4],Z[4],carry[3],C[4],S[4]);
   fa CPA6(carry[5],Z[5],carry[4],C[5],S[5]);
   fa CPA7(Z[7],Z[6],carry[5],C[6],S[6]);

endmodule

