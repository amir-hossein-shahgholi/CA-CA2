`timescale 1ns/1ns
module MUX1(input [4:0] I0,I1,I2 ,input [1:0] RegDst , output reg [4:0] out);

always@(I0,I1,I2,RegDst) begin
	case(RegDst)
		2'b00: out <= I0;
		2'b01: out <= I1;
		2'b10: out <= I2;
	endcase
end
endmodule
