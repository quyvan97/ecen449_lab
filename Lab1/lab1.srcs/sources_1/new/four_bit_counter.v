`timescale 1ns / 1ps

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
