`timescale 1ns/1ns
module datamem(input [31:0] adr, writedata,input MR,MW,clk,output reg [31:0] readdata);

reg [31:0] mem[0:511];
initial begin 
	$readmemb("mem.txt" , mem);
end
always @(adr,MW,writedata , negedge clk) begin
	if(MW&&adr)begin 
		mem[adr[31:2]] <= writedata;
		$writememb("mem.txt" , mem);
	end
end
always @(adr,MR,clk) begin
	if(MR) begin
		readdata <= mem[adr[31:2]];

	end
end
endmodule