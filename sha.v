module sha (Cout, Sum, A, B);

   input A, B;

   output Sum, Cout;

   assign Cout = A | B;
   assign Sum = !(A ^ B);

endmodule // sha
