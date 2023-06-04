module add4(input [31:0] IN , output reg[31:0] out);
always @(IN) begin
	out <= IN + 32'b00000000000000000000000000000100;
end
endmodule
