`timescale 1ns / 1ps
`default_nettype none

module clock_divider_tb;
    
    reg Clk;
    wire [3:0] ClkOut;
    
    
    clock_divider uut(.ClkOut(ClkOut), .ClkIn(Clk));

    initial
	   Clk = 1;
    always
		forever #4 Clk <= ~Clk;    
	
	
		    
endmodule
