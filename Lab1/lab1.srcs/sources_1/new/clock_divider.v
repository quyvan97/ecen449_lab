module clock_divider(ClkOut, ClkIn);
    /*output port needs to be a reg because we will drive it with *
     *a behavioral statement*/
    output wire [3:0] ClkOut;
    input wire ClkIn;
    
    /* this is a keyword we have not seen yet!*
     * as the name implies, it is a parameter*
     * that can be changed at compile time...*/
//     parameter n = 5; //make count 6 bits for now
     
//     reg [4:0] Count; //count bit width is based on n! how cool is that!
     
     /*simple behavioral construct to describe a counter...*/
     parameter n = 27;
     
     reg [n:0] Count;
     
     initial 
        Count = 1'b0;
     
     always@(posedge ClkIn) //should look familiar
        Count <= Count + 1;
     
     //Now we need to wire up out ClkOut which is a 4 bit wire
     //Wire up to most significant bits
     assign ClkOut [3:0] = Count[n:n-3];
     
endmodule