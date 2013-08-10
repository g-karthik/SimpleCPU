module top;

reg reset;
wire [3:0] out1,out2;

ALU alu(reset,out1,out2);

initial begin
  $monitor("AC = %b, PC = %b, Reset = %b, Time = %2d",out2,out1,reset,$time);
	#2
	reset = 1'b1;




	$finish;
end

endmodule
