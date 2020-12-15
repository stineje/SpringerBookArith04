module array4 (Z2, X, Y);
   
   input [3:0]  Y;
   input [3:0] 	X;
   
   output [7:0] Z2;
   
   wire [3:0] 	P0;
   wire [3:0] 	carry1;
   wire [3:0] 	sum1;
   wire [3:0] 	P1;
   wire [3:0] 	carry2;
   wire [3:0] 	sum2;
   wire [3:0] 	P2;
   wire [3:0] 	carry3;
   wire [3:0] 	sum3;
   wire [3:0] 	P3;
   wire [3:0] 	carry4;
   wire [3:0] 	sum4;
   wire [6:0] 	carry5;
   wire [7:0] 	Z;

   // Partial Product Generation
   and pp1(P0[3], X[3], Y[0]);
   and pp2(P0[2], X[2], Y[0]);
   and pp3(P0[1], X[1], Y[0]);
   and pp4(P0[0], X[0], Y[0]);
   and pp5(sum1[3], X[3], Y[1]);
   and pp6(P1[2], X[2], Y[1]);
   and pp7(P1[1], X[1], Y[1]);
   and pp8(P1[0], X[0], Y[1]);
   and pp9(sum2[3], X[3], Y[2]);
   and pp10(P2[2], X[2], Y[2]);
   and pp11(P2[1], X[1], Y[2]);
   and pp12(P2[0], X[0], Y[2]);
   and pp13(sum3[3], X[3], Y[3]);
   and pp14(P3[2], X[2], Y[3]);
   and pp15(P3[1], X[1], Y[3]);
   and pp16(P3[0], X[0], Y[3]);

   // Partial Product Reduction
   ha  HA1(carry1[2],sum1[2],P1[2],P0[3]);
   ha  HA2(carry1[1],sum1[1],P1[1],P0[2]);
   ha  HA3(carry1[0],sum1[0],P1[0],P0[1]);
   fa  FA1(carry2[2],sum2[2],P2[2],sum1[3],carry1[2]);
   fa  FA2(carry2[1],sum2[1],P2[1],sum1[2],carry1[1]);
   fa  FA3(carry2[0],sum2[0],P2[0],sum1[1],carry1[0]);
   fa  FA4(carry3[2],sum3[2],P3[2],sum2[3],carry2[2]);
   fa  FA5(carry3[1],sum3[1],P3[1],sum2[2],carry2[1]);
   fa  FA6(carry3[0],sum3[0],P3[0],sum2[1],carry2[0]);

   // Generate lower product bits YBITS 
   buf b1(Z2[0], P0[0]);
   assign 	Z2[1] = sum1[0];
   assign 	Z2[2] = sum2[0];
   assign 	Z2[3] = sum3[0];

   // Final Carry Propagate Addition
   //   Generate higher product bits
   ha CPA1(carry4[0],Z2[4],carry3[0],sum3[1]);
   fa CPA2(carry4[1],Z2[5],carry3[1],carry4[0],sum3[2]);
   fa CPA3(Z2[7],Z2[6],carry3[2],carry4[1],sum3[3]);
   
endmodule // array4
