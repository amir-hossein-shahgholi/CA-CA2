`timescale 1ns/1ns
module MIPScontrol(input [5:0] IN,input clk,output reg Regwrite,ALUsrc,MR,MW,output reg [1:0] PCsrc,RegDst,Memtoreg,ALUop);
	always @(posedge clk,IN) begin
		RegDst =2'b00; Regwrite =1'b0;ALUsrc = 1'b0;PCsrc=2'b00;MR = 1'b0;MW =1'b0;Memtoreg = 2'b00;ALUop =2'b00;
		case(IN)
			6'b000000:begin RegDst = 2'b01; Regwrite = 1'b1; ALUsrc = 1'b0;ALUop = 2'b10;PCsrc = 2'b00;MR = 1'b0;MW = 1'b0;Memtoreg = 2'b00;end
			6'b000001:begin RegDst = 2'b00; Regwrite = 1'b1; ALUsrc = 1'b1;ALUop = 2'b00;PCsrc = 2'b00;MR = 1'b0;MW = 1'b0;Memtoreg = 2'b00;end
			6'b000010:begin RegDst = 2'b00; Regwrite = 1'b1; ALUsrc = 1'b1;ALUop = 2'b11;PCsrc = 2'b00;MR = 1'b0;MW = 1'b0;Memtoreg = 2'b00;end
			6'b000011:begin RegDst = 2'b00; Regwrite = 1'b1; ALUsrc = 1'b1;ALUop = 2'b00;PCsrc = 2'b00;MR = 1'b1;MW = 1'b0;Memtoreg = 2'b01;end
                	6'b000100:begin Regwrite = 1'b0; ALUsrc = 1'b1;ALUop = 2'b00;PCsrc = 2'b00;MR = 1'b0;MW = 1'b1;end
			6'b000101:begin Regwrite = 1'b0;PCsrc = 2'b10;MR = 1'b0;MW = 1'b0;end
			6'b000110:begin RegDst = 2'b10; Regwrite = 1'b1;PCsrc = 2'b10;MR = 1'b0;MW = 1'b0;Memtoreg = 2'b10;end
			6'b000111:begin Regwrite = 1'b0;PCsrc = 2'b11;MR = 1'b0;MW = 1'b0;end
			6'b001000:begin Regwrite = 1'b0; ALUsrc = 1'b0;ALUop = 2'b01;PCsrc = 2'b01;MR = 1'b0;MW = 1'b0;end
		endcase 
	end 
endmodule