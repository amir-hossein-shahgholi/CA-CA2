`timescale 1ns/1ns
module PC(input clk,input [31:0] IN, output reg [31:0] q);
assign q = 32'b0;
	always @(posedge clk) begin
		q = IN;
	end
endmodule
