`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2023 10:09:02 PM
// Design Name: 
// Module Name: four_bit_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_counter(Count, Clk, BTN);
    
    // Declare inputs,output
    output reg [3:0] Count;
    input wire [1:0] BTN;
    input wire Clk;
    
    wire [3:0] LEDS;
    
    always@(posedge Clk) begin
        if (BTN[0]) begin
            Count <= Count + 1;
        end
        else if (BTN[1]) begin
            Count <= Count - 1;
        end
    end 
    
    assign LEDS = Count;

endmodule
