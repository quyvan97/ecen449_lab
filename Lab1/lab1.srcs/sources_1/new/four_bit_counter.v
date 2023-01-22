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


module four_bit_counter(LEDS, Clk, BTN);
    
    // Declare inputs,output
    output wire [3:0] LEDS;
    input wire [1:0] BTN;
    input wire Clk;
    
    reg [3:0] Count;
    wire ClkOut;
    
    
    initial Count = 4'b0000;
    
    clock_divider cd1(ClkOut, Clk); 
    
    always@(posedge ClkOut) begin
        if (BTN[0] && !BTN[1]) begin
            Count <= Count + 1;
        end
        else if (BTN[1] && !BTN[0]) begin
            Count <= Count - 1;
        end
        else begin
            Count <= Count;
        end
        
    end 
    
    assign LEDS = Count;

endmodule

module clock_divider(ClkOut, ClkIn);
    /*output port needs to be a reg because we will drive it with *
     *a behavioral statement*/
    output wire [3:0] ClkOut;
    input wire ClkIn;
    
    /* this is a keyword we have not seen yet!*
     * as the name implies, it is a parameter*
     * that can be changed at compile time...*/
     parameter n = 27; //make count 6 bits for now
     
     reg [n:0] Count; //count bit width is based on n! how cool is that!
     
     /*simple behavioral construct to describe a counter...*/
     always@(posedge ClkIn) //should look familiar
        Count <= Count + 1;
     
     //Now we need to wire up out ClkOut which is a 4 bit wire
     //Wire up to most significant bits
        assign ClkOut[3:0] = Count[n:n-3];
endmodule