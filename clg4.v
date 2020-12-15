module clg4 (cout, g, p, cin);

   input [3:0]  g, p;   
   input        cin;
   
   output [3:0] cout;   
   
   and a1 (s1, p[0], cin);
   or  o1 (cout[1], g[0], s1);
   and a2 (s2, p[1], g[0]);
   and a3 (s3, p[1], p[0], cin);
   or  o2 (cout[2], g[1], s2, s3);
   and a4 (s4, p[2], g[1]);
   and a5 (s5, p[2], p[1], g[0]);
   and a6 (s6, p[2], p[1], p[0], cin);
   or  o3 (cout[3], g[2], s4, s5, s6);   

endmodule // clg4
