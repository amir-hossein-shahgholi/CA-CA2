module pcadd(input [31:0] IN1,IN2 , output reg[31:0] out);
always @(IN1,IN2) begin
	out <= IN1 + IN2;
end
endmodule
