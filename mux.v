module mux2x1(y,a,b,s);  	
input [3:0] a,b;		//Tested and fully functional
input s;
output [3:0] y;
wire [3:0] i1,i2;
wire nots;

and G1(i1[0],a[0],nots);
and G2(i2[0],b[0],s);
not G3(nots,s);
or  G4(y[0],i1[0],i2[0]);

and G5(i1[1],a[1],nots);
and G6(i2[1],b[1],s);
or  G8(y[1],i1[1],i2[1]);

and G9(i1[2],a[2],nots);
and G10(i2[2],b[2],s);
or  G12(y[2],i1[2],i2[2]);

and G13(i1[3],a[3],nots);
and G14(i2[3],b[3],s);
or  G16(y[3],i1[3],i2[3]);

endmodule

module mux4x1(y,i1,i2,i3,i4,s0,s1);
input [3:0] i1,i2,i3,i4;
input s0,s1;
output [3:0] y,y01,y02;

mux2x1 MUX2X1_01(y01,i1,i2,s0);
mux2x1 MUX2X1_02(y02,i3,i4,s0);
mux2x1 MUX2X1_03(y,y01,y02,s1);

endmodule

module mux8x1(y,i1,i2,i3,i4,i5,i6,i7,i8,s0,s1,s2);
input [3:0] i1,i2,i3,i4,i5,i6,i7,i8;
input s0,s1,s2;
output [3:0] y,y1,y2,alpha1,alpha2;

mux4x1 MUX4x1_01(y1,i1,i2,i3,i4,s0,s1);
mux4x1 MUX4x1_02(y2,i5,i6,i7,i8,s0,s1);

not NOTa(s2bar, s2);
and ANDa(alpha1[0],y1[0],s2bar);
and ANDb(alpha2[0],y2[0],s2);
or ORa(y[0],alpha1[0],alpha2[0]);

and ANDc(alpha1[1],y1[1],s2bar);
and ANDd(alpha2[1],y2[1],s2);
or ORb(y[1],alpha1[1],alpha2[1]);

and ANDe(alpha1[2],y1[2],s2bar);
and ANDf(alpha2[2],y2[2],s2);
or ORc(y[2],alpha1[2],alpha2[2]);

and ANDg(alpha1[3],y1[3],s2bar);
and ANDh(alpha2[3],y2[3],s2);
or ORd(y[3],alpha1[3],alpha2[3]);

endmodule


