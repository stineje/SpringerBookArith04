module twos_compl (z, a);

   input [7:0]  a;
   
   output [7:0] z;

   ha cpa1 (c0, z[0], ~a[0], 1'b1);   
   ha cpa2 (c1, z[1], ~a[1], c0);
   ha cpa3 (c2, z[2], ~a[2], c1);
   ha cpa4 (c3, z[3], ~a[3], c2);
   ha cpa5 (c4, z[4], ~a[4], c3);
   ha cpa6 (c5, z[5], ~a[5], c4);
   ha cpa7 (c6, z[6], ~a[6], c5);
   ha cpa8 (c7, z[7], a[7], c6);
               	
endmodule // twos_cmpl
