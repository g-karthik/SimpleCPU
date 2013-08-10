module dff(q,notq,d,clk,reset);
input d,clk,reset;
output q, notq;  			//Tested and fully functional
reg q, notq;

/* always @(reset)
begin
	if(reset == 1'b1)
	begin
		q = 1'b0;
		notq = 1'b1;
	end
end
*/

always@(negedge clk)
begin
	if(reset == 1'b1)
	begin
		q = 1'b0;
		notq = 1'b1;
	end
	else
	begin
		q = d;
		notq = ~q;
	end
end
endmodule

