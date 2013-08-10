module AND(in1,in2,out);                //this module does a 4-bit AND operation

input [3:0] in1,in2;
output [3:0] out;

and A1(out[0],in1[0],in2[0]);
and A2(out[1],in1[1],in2[1]);
and A3(out[2],in1[2],in2[2]);
and A4(out[3],in1[3],in2[3]);

endmodule

