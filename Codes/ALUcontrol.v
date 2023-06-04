`timescale 1ns/1ns
module ALUcontrol(input [5:0] func,input clk,input [1:0] ALUop,output reg [2:0] ALUoperation);
	always @(clk) begin
		ALUoperation = 3'b010;
		case(ALUop)
			2'b00: ALUoperation = 3'b010;
			2'b01: ALUoperation = 3'b011;
			2'b11: ALUoperation = 3'b111;
			2'b10: begin
				case(func)
					6'b000000:ALUoperation = 3'b010;
					6'b000010:ALUoperation = 3'b011;
					6'b000011:ALUoperation = 3'b111;
					6'b000101:ALUoperation = 3'b000;
					6'b000110:ALUoperation = 3'b001;
				endcase
				end
		endcase 
	end 
endmodule