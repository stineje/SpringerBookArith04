module qst16 (zero1, zero2, qj, qjn, 
	      divi2, divi1, divi1c, divi2c, carry, sum);

   input [10:0] carry, sum;
   input [10:0] divi2, divi1, divi1c, divi2c;   

   output [3:0] qj;
   output [3:0] qjn;
   output 	zero1, zero2;

   wire [8:0] 	d2s, d1s, d0s, d1cs, d2cs;
   wire [8:0] 	d2c, d1c, d0c, d1cc, d2cc;   
   wire [7:0] 	qtotal, qt2, qt1, qt0, qt1c, qt2c;
   wire [3:0] 	q2, q1, q0, q1c, q2c;   

   csa9 add1 (d2s, d2c, divi2[8:0], sum[8:0], carry[8:0]);
   csa9 add2 (d1s, d1c, divi1[8:0], sum[8:0], carry[8:0]);
   csa9 add3 (d1cs, d1cc, divi1c[8:0], sum[8:0], carry[8:0]);   
   csa9 add4 (d2cs, d2cc, divi2c[8:0], sum[8:0], carry[8:0]);
   rca8 cpa1 (qtotal, sum[10:3], carry[10:3]);
   rca8 cpa2 (qt2, d2s[8:1], d2c[8:1]);
   rca8 cpa3 (qt1, d1s[8:1], d1c[8:1]);
   rca8 cpa4 (qt0, sum[8:1], carry[8:1]);   
   rca8 cpa5 (qt1c, d1cs[8:1], d1cc[8:1]);
   rca8 cpa6 (qt2c, d2cs[8:1], d2cc[8:1]);   
   qst4 pd1 (qj, qtotal[7:1], divi1[6:4]);
   nor n1 (zero1, qj[3], qj[2], qj[1], qj[0]);
   
   qst4 pd2 (q2, qt2[7:1], divi1[6:4]);
   qst4 pd3 (q1, qt1[7:1], divi1[6:4]);
   qst4 pd4 (q0, qt0[7:1], divi1[6:4]);   
   qst4 pd5 (q1c, qt1c[7:1], divi1[6:4]);
   qst4 pd6 (q2c, qt2c[7:1], divi1[6:4]);
   nor n2 (zero2, qjn[3], qjn[2], qjn[1], qjn[0]);
   mux51hx4 mux1 (qjn, q2c, q1c, q1, q2, q0, {qj, zero1});

endmodule // qst16
