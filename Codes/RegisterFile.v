`timescale 1ns/1ns
module Regfile(input [4:0] RR1,RR2,WR,input [31:0] wd,input regwrite ,clk,output reg[31:0] RD1,RD2);
	reg [31:0] regs [31:0];
	initial begin
		regs[0] = 0;
	end
	always@(RR1,RR2,clk) begin
		RD1 = regs[RR1];
		RD2 = regs[RR2];
	end
	always@(posedge clk) begin
		if(regwrite && WR) begin 
			regs[WR] <= wd;
		end
	end
endmodule