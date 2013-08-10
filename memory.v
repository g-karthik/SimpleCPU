module Memory(opcode,data,addr,clk);
output [3:0] data;
output [3:0] opcode;    //The address refers to the opcode; next line is the data
input  [3:0] addr;
input clk;
reg [3:0] data;
reg [3:0] opcode;
reg [3:0] memdata [15:0];

initial
        begin
        memdata[0] = 4'b0000;
        memdata[1] = 4'b1100;
        memdata[2] = 4'b0000;
        memdata[3] = 4'b1111;
        memdata[4] = 4'b0000;
        memdata[5] = 4'b1101;
        memdata[6] = 4'b0000;
        memdata[7] = 4'b1011;
        memdata[8] = 4'b0000;
        memdata[9] = 4'b1100;
        memdata[10] = 4'b0000;
        memdata[11] = 4'b1000;
        memdata[12] = 4'b0000;
        memdata[13] = 4'b0000;
        memdata[14] = 4'b0000;
        memdata[15] = 4'b1101;
        end

always @(posedge clk)
        begin
                opcode = memdata[addr];
                data = memdata[addr + 1'b1];
        end

endmodule

