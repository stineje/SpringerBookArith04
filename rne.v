module rne (z, a);

   input [15:0] a;
      
   output [7:0] z;

   wire 	ulp;  

   assign ulp = (a[6]&a[5]) | (a[5]&a[4]);
   ha cpa1 (c0, z[0], a[6], ulp);   
   ha cpa2 (c1, z[1], a[7], c0);
   ha cpa3 (c2, z[2], a[8], c1);
   ha cpa4 (c3, z[3], a[9], c2);
   ha cpa5 (c4, z[4], a[10], c3);
   ha cpa6 (c5, z[5], a[11], c4);
   ha cpa7 (c6, z[6], a[12], c5);
   ha cpa8 (c7, z[7], a[15], c6);
               	
endmodule // rne
