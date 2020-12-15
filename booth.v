module booth (P, A, X);

   input [3:0]  A, X;

   output [6:0] P;

   wire 	GND; 
   
   // cas(T, S, U, R, Q, D, P, B, A, C);   
   assign GND = 1'b0;   
   cas m01(t00, s00, u00, r00, q00, r01, q01, A[0], GND, GND);
   cas m02(t01, s01, u01, r01, q01, r02, q02, A[1], GND, t00);
   cas m03(t02, s02, u02, r02, q02, r03, q03, A[2], GND, t01);
   cas m04(t03, s03, u03, r03, q03, r04, q04, A[3], GND, t02);   
   
   cas m05(t10, s10, u10, r10, q10, r11, q11,  u00, GND, GND);
   cas m06(t11, s11, u11, r11, q11, r12, q12,  u01, s00, t10);
   cas m07(t12, s12, u12, r12, q12, r13, q13,  u02, s01, t11);
   cas m08(t13, s13, u13, r13, q13, r14, q14,  u03, s02, t12);
   cas m09(t14, s14, u14, r14, q14, r15, q15,  u03, s03, t13);   
   
   cas m10(t20, s20, u20, r20, q20, r21, q21,  u10, GND, GND);
   cas m11(t21, s21, u21, r21, q21, r22, q22,  u11, s10, t20);
   cas m12(t22, s22, u22, r22, q22, r23, q23,  u12, s11, t21);
   cas m13(t23, s23, u23, r23, q23, r24, q24,  u13, s12, t22);
   cas m14(t24, s24, u24, r24, q24, r25, q25,  u14, s13, t23);
   cas m15(t25, s25, u25, r25, q25, r26, q26,  u14, s14, t24);

   cas m16(t30, s30, u30, r30, q30, r31, q31,  u20, GND, GND);
   cas m17(t31, s31, u31, r31, q31, r32, q32,  u21, s20, t30);
   cas m18(t32, s32, u32, r32, q32, r33, q33,  u22, s21, t31);
   cas m19(t33, s33, u33, r33, q33, r34, q34,  u23, s22, t32);
   cas m20(t34, s34, u34, r34, q34, r35, q35,  u24, s23, t33);
   cas m21(t35, s35, u35, r35, q35, r36, q36,  u25, s24, t34);
   cas m22(t36, s36, u36, r36, q36, r37, q37,  u25, s25, t35);         
   
   buf b1(P[0], s30);
   buf b2(P[1], s31);
   buf b3(P[2], s32);
   buf b4(P[3], s33);
   buf b5(P[4], s34);
   buf b6(P[5], s35);
   buf b7(P[6], s36);      
   
   ctrl c1(q37, r37, X[0], GND);
   ctrl c2(q26, r26, X[1], X[0]);
   ctrl c3(q15, r15, X[2], X[1]);
   ctrl c4(q04, r04, X[3], X[2]);   

endmodule // booth






