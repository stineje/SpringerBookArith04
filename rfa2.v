//
// IMPORTANT
// This module is different than module in CLA (i.e. the rfa)
// and is designed to work with truncated multipliers.
//
module rfa (Cout, A, B, Cin);

   input A, B, Cin;

   output Cout;

   assign Cout = (A&(B|Cin)) | (B&Cin);

endmodule // rfa

