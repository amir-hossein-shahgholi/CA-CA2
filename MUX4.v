`timescale 1ns/1ns
module MUX4(input [31:0] I0,I1 ,input ALUsrc , output reg [31:0] out);

always@(I0,I1,ALUsrc) begin
	case(ALUsrc)
		0: out <= I0;
		1: out <= I1;
	endcase
end
endmodule
