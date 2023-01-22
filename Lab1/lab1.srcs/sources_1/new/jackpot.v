`timescale 1ns / 1ps

module jackpot(LEDS, Clk, SWITCHES, Rst);
    
    // Declare inputs,output
    output wire [3:0] LEDS;
    input wire [3:0] SWITCHES;
    input wire Clk;
    input wire Rst;
    
    reg [3:0] Counter;
    wire ClkOut;
    
    
    initial Counter = 4'b0000;
    
    clock_divider unit0(ClkOut, Clk); 
    
    always@(posedge ClkOut) begin
        if (Rst) begin
            Counter <= 4'b0000;
        end
        else begin
            if (SWITCHES[0] || SWITCHES[1] || SWITCHES[2] || SWITCHES[3]) begin
                if(SWITCHES == Counter && Counter != 4'b0000) begin
                    Counter <= 4'b1111;
                end
                else begin
                    Counter <= Counter;
                end
            end
            else begin
                case(Counter)
                    4'b0000 : Counter <= 4'b0001;
                    4'b0001 : Counter <= 4'b0010;
                    4'b0010 : Counter <= 4'b0100;
                    4'b0100 : Counter <= 4'b1000;
                    4'b1000 : Counter <= 4'b0001;
                endcase
            end
        end
    end 
   
    
    assign LEDS = Counter;    
    
endmodule

module clock_divider(ClkOut, ClkIn);
    /*output port needs to be a reg because we will drive it with *
     *a behavioral statement*/
    output wire [3:0] ClkOut;
    input wire ClkIn;
    
    /* this is a keyword we have not seen yet!*
     * as the name implies, it is a parameter*
     * that can be changed at compile time...*/
     parameter n = 25; //make count 6 bits for now
     
     reg [n:0] Count; //count bit width is based on n! how cool is that!
     
     /*simple behavioral construct to describe a counter...*/
     always@(posedge ClkIn) //should look familiar
        Count <= Count + 1;
     
     //Now we need to wire up out ClkOut which is a 4 bit wire
     //Wire up to most significant bits
        assign ClkOut[3:0] = Count[n:n-3];
endmodule