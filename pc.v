module ProgramCounter(out,in,clk,reset);
input [3:0] in;
output [3:0] out;
input reset,clk;
  					//Tested and fully functional
dff ff1(out[0],notq0,in[0],clk,reset);
dff ff2(out[1],notq1,in[1],clk,reset);
dff ff3(out[2],notq2,in[2],clk,reset);
dff ff4(out[3],notq3,in[3],clk,reset);

/*
always @(negedge clk)
begin
     out = out + 4'b0010;
end

always @(posedge clk)                   //For the case when we need to perform an unconditional or a relative jump operation
begin
        if(in!=4'bxxxx)
        begin
        out = in;
        end
end
*/

endmodule

