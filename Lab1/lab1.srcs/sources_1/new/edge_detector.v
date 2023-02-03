`timescale 1ns / 1ps

module edge_dectector(Signal, Clk, Pe);
    input Signal;
    input Clk;
    output Pe;
    
    reg delaySignal;
    reg delaySignal2;
    reg delaySignal3;
    
    always@(Clk) begin
        delaySignal <= Signal;
        delaySignal2 <= delaySignal;
        delaySignal3 <= delaySignal2;
    end
    
    
    assign Pe = (Signal & ~delaySignal) ^ (delaySignal & ~delaySignal2);

endmodule