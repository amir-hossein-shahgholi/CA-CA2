module signextend(input [15:0] IN,output reg [31:0] out);
assign out = {{16{IN[15]}},IN[15:0]};
endmodule
