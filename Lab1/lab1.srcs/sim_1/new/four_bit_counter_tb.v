`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2023 01:24:28 AM
// Design Name: 
// Module Name: four_bit_counter_tb
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


module four_bit_counter_tb();

    wire [3:0] LEDS;
    reg Clk;
    reg [1:0] BTN;
    
    four_bit_counter uut(.LEDS(LEDS), .Clk(Clk), .BTN(BTN));
    
    initial 
        begin
            Clk = 0;
            
            #10
            BTN[0] = 1;
            BTN[1] = 0;
            
            #15
            BTN[0] = 0;
            BTN[1] = 0;
            
            #15
            BTN[0] = 1;
            BTN[1] = 0;
            
            #15
            BTN[0] = 1;
            BTN[1] = 0;
            
            #15
            BTN[0] = 1;
            BTN[1] = 1;
            
            #10
            BTN[0] = 0;
            BTN[1] = 1;
            
            #10
            BTN[0] = 0;
            BTN[1] = 1;
            
    
        end 
    
    always
        #10 Clk = ~Clk;
        
endmodule
