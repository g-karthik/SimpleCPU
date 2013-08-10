module onebitadder(x,y,sum,carryout,carryin);
input x,y,carryin;
output sum,carryout;

        //sum = x XOR y XOR z, where z is carry in
        //carryout = x XOR y multiplied by z plus xy

xor XOR1(p,x,y);
xor XOR2(sum,p,carryin);
        //At this stage, we have sum with us

and ANDp(q,p,carryin);
and ANDxy(r,x,y);
or ORing(carryout,q,r);
        //At this stage, we have carryout also with us

endmodule

module fourbitadder(a,b,carryout,s,carryin);

input carryin;
input [3:0] a,b;
output carryout;
output [3:0] s;

onebitadder adder1(a[0],b[0],s[0],c1,carryin);
onebitadder adder2(a[1],b[1],s[1],c2,c1);
onebitadder adder3(a[2],b[2],s[2],c3,c2);
onebitadder adder4(a[3],b[3],s[3],carryout,c3);


endmodule

/* Logic for subtraction: Suppose you want to perform 8 - 4
  first take 2's complement of 4 and add it to 8
	to take 2's complement of 4, first take 1's complement and add 1 to it
	to take 1's complement, perform XOR operation on the bits with the bit '1'
*/

module fourbitsubtractor(a,b,carryout,s,carryin);

	//We perform a - b here
input [3:0] a,b;
output [3:0] s;
input carryin;
output carryout;
wire [3:0] m;

xor X1(m[3],b[3],1);
xor X2(m[2],b[2],1);
xor X3(m[1],b[1],1);
xor X4(m[0],b[0],1);

fourbitadder adding(a,m,carryout,s,1);

endmodule

