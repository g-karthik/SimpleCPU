module Accumulator(q,d,clk,reset);  //q is the output, d is the input (4 bits each)

input [3:0] d;
input clk,reset;
output [3:0] q;
						//Tested and fully functional
dff D0(q[0],notq0,d[0],clk,reset);
dff D1(q[1],notq1,d[1],clk,reset);
dff D2(q[2],notq2,d[2],clk,reset);
dff D3(q[3],notq3,d[3],clk,reset);

endmodule

