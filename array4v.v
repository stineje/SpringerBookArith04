
// Correction constant value: 0.0

module array4v (Z, X, Y);
   
   input [3:0]  Y;
   input [3:0] 	X;
   
   output [3:0] Z;	

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

   // Partial Product Generation
   and pp1(P0[3], X[3], Y[0]);
   and pp2(sum1[3], X[3], Y[1]);
   and pp3(P1[2], X[2], Y[1]);
   and pp4(carry1[1], X[1], Y[1]);
   and pp5(sum2[3], X[3], Y[2]);
   and pp6(P2[2], X[2], Y[2]);
   and pp7(P2[1], X[1], Y[2]);
   and pp8(carry2[0], X[0], Y[2]);
   and pp9(sum3[3], X[3], Y[3]);
   and pp10(P3[2], X[2], Y[3]);
   and pp11(P3[1], X[1], Y[3]);
   and pp12(P3[0], X[0], Y[3]);

   // Partial Product Reduction
   ha  HA1(carry1[2],sum1[2],P1[2],P0[3]);
   fa  FA1(carry2[2],sum2[2],P2[2],sum1[3],carry1[2]);
   fa  FA2(carry2[1],sum2[1],P2[1],sum1[2],carry1[1]);
   fa  FA3(carry3[2],sum3[2],P3[2],sum2[3],carry2[2]);
   fa  FA4(carry3[1],sum3[1],P3[1],sum2[2],carry2[1]);
   rfa RFA1(carry3[0],P3[0],sum2[1],carry2[0]);

   // Generate lower product bits YBITS 

   // Final Carry Propagate Addition
   //   Generate higher product bits
   ha CPA1(carry4[0],Z[0],carry3[0],sum3[1]);
   fa CPA2(carry4[1],Z[1],carry3[1],carry4[0],sum3[2]);
   fa CPA3(Z[3],Z[2],carry3[2],carry4[1],sum3[3]);

endmodule // array4v
