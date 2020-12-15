module csa9 (Sum, Carry, mdivi, SumN2, CarryN2);

   input [8:0]  mdivi, SumN2, CarryN2;

   output [8:0] Sum, Carry;

   assign Carry[0] = 1'b0;
   fa fa1 (Carry[1], Sum[0], SumN2[0], CarryN2[0], mdivi[0]);
   fa fa2 (Carry[2], Sum[1], SumN2[1], CarryN2[1], mdivi[1]);
   fa fa3 (Carry[3], Sum[2], SumN2[2], CarryN2[2], mdivi[2]);
   fa fa4 (Carry[4], Sum[3], SumN2[3], CarryN2[3], mdivi[3]);
   fa fa5 (Carry[5], Sum[4], SumN2[4], CarryN2[4], mdivi[4]);
   fa fa6 (Carry[6], Sum[5], SumN2[5], CarryN2[5], mdivi[5]);
   fa fa7 (Carry[7], Sum[6], SumN2[6], CarryN2[6], mdivi[6]);
   fa fa8 (Carry[8], Sum[7], SumN2[7], CarryN2[7], mdivi[7]);
   fa fa9 (notused, Sum[8], SumN2[8], CarryN2[8], mdivi[8]);
   
endmodule // csa9
