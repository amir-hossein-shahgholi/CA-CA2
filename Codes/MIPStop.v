`timescale 1ns/1ns
module MIPStop(input clk);
wire [31:0] PCi,PCo, instout,w1,WD,RD1,RD2,w3,w4,w5,w6,w7,w9,w10;
wire [27:0] w8;
wire [4:0] w2;
wire [1:0] PCsrc,RegDst,Memtoreg,ALUop;
wire [2:0] ALUoperation;
wire Regwrite,ALUsrc,MR,MW,regwrite,zero;
MIPScontrol mi1(.IN(instout[31:26]),.clk(clk),.Regwrite(Regwrite),.ALUsrc(ALUsrc),.MR(MR),.MW(MW),.PCsrc(PCsrc),.RegDst(RegDst),.Memtoreg(Memtoreg),.ALUop(ALUop));
ALUcontrol A1(.func(instout[5:0]),.clk(clk),.ALUop(ALUop),.ALUoperation(ALUoperation));
PC p1(.clk(clk) ,.IN(PCi), .q(PCo));
instmem i1(.adr(PCo), .inst(instout));
add4 a1(.IN(PCo),.out(w1));
MUX1 m1(.I0(instout[20:16]),.I1(instout[15:11]),.I2(5'b11111),.RegDst(RegDst),.out(w2));
Regfile r1(.RR1(instout[25:21]),.RR2(instout[20:16]),.WR(w2),.wd(w7),.regwrite(Regwrite),.clk(clk),.RD1(RD1),.RD2(RD2));
signextend s1(.IN(instout[15:0]),.out(w3));
MUX4 m2(.I0(RD2),.I1(w3),.out(w4),.ALUsrc(ALUsrc));
ALU al1(.A(RD1),.B(w4),.ALUoperation(ALUoperation),.out(w5),.zero(zero));
datamem d1(.adr(w5),.writedata(RD2),.MR(MR),.MW(MW),.readdata(w6),.clk(clk));
MUX2 m3(.I0(w5),.I1(w6),.I2(w1),.memtoreg(Memtoreg),.out(w7));
shiftleft1 sh1(.IN(instout[25:0]),.out(w8));
shiftleft sh(.IN(w3),.out(w9));
pcadd p10(.IN1(w9),.IN2(w1),.out(w10));
MUX3 m4(.I0(w1),.I1(w10),.I2({w1[31:28],w8[27:0]}),.I3(RD1),.zero(zero),.out(PCi),.PCsrc(PCsrc));
endmodule 
