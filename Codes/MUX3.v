`timescale 1ns/1ns
module MUX3(input [31:0] I0,I1,I2,I3,input [1:0] PCsrc,input zero , output reg [31:0] out);
always@(I0,I1,I2,I3,PCsrc,zero) begin
	case(PCsrc)
		2'b00: out <= I0;
		2'b01: out <= (zero)?I1 : I0;
		2'b10: out <= I2;
		2'b11: out <= I3;
		default: out <= 32'b0;
	endcase
end
endmodule
