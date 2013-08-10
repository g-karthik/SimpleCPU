module OR(in1,in2,out);                //this module does a 4-bit OR operation

input [3:0] in1,in2;
output [3:0] out;

or o1(out[0],in1[0],in2[0]);
or o2(out[1],in1[1],in2[1]);
or o3(out[2],in1[2],in2[2]);
or o4(out[3],in1[3],in2[3]);

endmodule
