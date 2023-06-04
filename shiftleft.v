`timescale 1ns/1ns
module shiftleft(input [31:0] IN , output reg [31:0] out);
always@(IN) begin
	out <= IN <<2;
end
endmodule
