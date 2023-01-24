module divide_clock(Clk, Reset, OutClk);

    input Clk;
    input Reset;
    output reg OutClk;

    parameter n = 27;

    reg [n:0] Count;

    always@(posedge Clk) begin
        Count <= Count + 1;
    end

    assign OutClk = Count[n];

endmodule