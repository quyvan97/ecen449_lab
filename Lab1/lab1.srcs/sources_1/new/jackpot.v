`timescale 1ns / 1ps

//module jackpot(LEDS, Clk, SWITCHES, Rst, pe_switch, edg_dect, sum_switch, SlowClk);
module jackpot(LEDS, Clk, SWITCHES, Rst);

    // Declare inputs,output
    output wire [3:0] LEDS;
    input wire [3:0] SWITCHES;
    input wire Clk;
    input wire Rst;
    
    wire [3:0] pe;
    wire [3:0] pe_switch;
    wire edg_dect;
    wire sum_switch;   
    wire SlowClk;
    
    reg [3:0] currentState;
    reg [3:0] nextState;
    
    clock_divider cd2(.ClkOut(SlowClk), .ClkIn(Clk)); 
        
    assign sum_switch = SWITCHES[0] | SWITCHES[1] | SWITCHES[2] | SWITCHES[3]; 
    
    initial currentState = 4'b0001; 
    
    always@(posedge Clk) begin
        if (Rst) 
            currentState <= 4'b0001;
        else 
           case(currentState)
                4'b0001 :
                    if (pe_switch[0])
                        currentState <= 4'b1111;
                    else
                        currentState <= 4'b0010; 
                4'b0010 :
                    if (pe_switch[1])
                        currentState <= 4'b1111;
                    else
                        currentState <= 4'b0100;
                4'b0100 :
                    if (pe_switch[2])
                        currentState <= 4'b1111;
                    else
                        currentState <= 4'b1000;
                4'b1000 :
                    if (pe_switch[3])
                        currentState <= 4'b1111;
                    else
                        currentState <= 4'b0001;
                4'b1111 :
                    if (sum_switch) 
                        currentState <= 4'b1111;
                    else 
                        currentState <= 4'b0001;
            endcase
    end 
     
    
    edge_dectector edge0(SWITCHES[0], Clk, pe_switch[0]);
    edge_dectector edge1(SWITCHES[1], Clk, pe_switch[1]);
    edge_dectector edge2(SWITCHES[2], Clk, pe_switch[2]);
    edge_dectector edge3(SWITCHES[3], Clk, pe_switch[3]);

    
    assign edg_dect = pe_switch[0] || pe_switch[1] || pe_switch[2] || pe_switch[3];
    
    assign LEDS = currentState;    
    
endmodule


 