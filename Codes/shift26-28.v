`timescale 1ns/1ns
module shiftleft1(input [25:0] IN , output reg [27:0] out);
always@(IN) begin
	out <= {IN,2'b00};
end
endmodule
