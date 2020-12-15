module bclg4 (cout, gout, pout, g, p, cin);

   input [3:0]  g, p;   
   input        cin;
   
   output [3:0] cout;   
   output       gout, pout;

   and a1 (s1, p[0], cin);
   or  o1 (cout[1], g[0], s1);
   and a2 (s2, p[1], g[0]);
   and a3 (s3, p[1], p[0], cin);
   or  o2 (cout[2], g[1], s2, s3);
   and a4 (s4, p[2], g[1]);
   and a5 (s5, p[2], p[1], g[0]);
   and a6 (s6, p[2], p[1], p[0], cin);
   or  o3 (cout[3], g[2], s4, s5, s6);   
   and a7 (t1, p[3], g[2]);
   and a8 (t2, p[3], p[2], g[1]);
   and a9 (t3, p[3], p[2], p[1], g[0]);
   or  o4 (gout, g[3], t1, t2, t3);
   and a10 (pout, p[0], p[1], p[2], p[3]);
   
endmodule // bclg4
