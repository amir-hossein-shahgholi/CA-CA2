`timescale 1ns/1ns
module instmem(input [31:0] adr,output reg [31:0] inst);
	reg [31:0] mem[0:511];
	initial begin 
		$readmemb("inst.txt" , mem);
	end
	always @(adr) begin
		inst = mem[adr[31:2]];
	end
endmodule
