`timescale 1ns/1ns
module MIPSTB();reg clkk=0;	MIPStop CUT1(.clk(clkk));	always #100 clkk=~clkk;
	initial begin #150000 $stop; endendmodule