module ALU(reset,out1,out2);  	//MUX logic in-built to this ALU
input reset;

wire [3:0] in1;
output [3:0] out1;
wire [3:0] in2;
output [3:0] out2;
wire [3:0] opcode;
wire [3:0] data;
wire [3:0] s1,s2,s3,s4,s5,val;

clkGen CLK(clk);

ProgramCounter PC(out1,in1,clk,reset);
Accumulator AC(out2,in2,clk,reset);

Memory MEM(opcode,data,out1,clk);



or OR1(x,opcode[3],opcode[2]);
not NOT1(y,opcode[1]);          //X = (A+B)C'D'
not NOT2(z,opcode[0]);
and AND1(x1,x,y);
and AND2(X,z,x1);       //Select lines X,Y,Z control logic for future MUX

and AND3(x2,opcode[3],opcode[2]);
and AND4(x3,y,z);
and AND5(x4,x2,x3);     //At this stage, we have ABC'D' in x4

not NOT3(y1,opcode[3]);
not NOT4(y2,opcode[2]);
and AND6(y3,y1,y2);             //y3 = A'B'
and AND7(y4,y3,opcode[1]);      //At this stage, we have A'B'C in y4

or OR2(Y,x4,y4);                //Y = ABC'D' + A'B'C

and AND8(z1,y3,opcode[0]);      //z1 = A'B'D
and AND9(z2,x3,opcode[3]);
and AND10(z3,z2,y2);
or OR3(Z,z1,z3);

//At this stage, we have the select lines X,Y,Z for MUX




fourbitadder add1(out2,data,carryout1,s1,0);		//out2 + data	s1
fourbitsubtractor sub1(out2,data,carryout2,s2,0);	//out2 - data	s2
AND andq(out2,data,s3);					//out2 & data	s3
OR orq(out2,data,s4);					//out2 | data	s4
fourbitadder add2(out1,data,carryout3,s5,0);		//out1 + data	s5

mux8x1 M1(val,data,s4,s2,s5,s1,data,s3,1'b0,X,Y,Z);

                        //Convert to structural (easily possible)
        if(opcode[3]==0)
        begin
	fourbitadder add3(val,4'b0000,carryout4,in2,0);
        fourbitadder add4(out1,4'b0010,carryout5,in1,0);
        end
        else
        begin
        fourbitadder add5(val,4'b0000,carryout6,in1,0);
        end





endmodule



