/********************************************************************
 *
 * Andrew Douglass
 * August 23, 2018
 * jackpot_tb.v
 *
 *******************************************************************/

`timescale 1ns / 1ps

// ENSURE THE FILE NAME BELOW MATCHES YOURS
//`include "jackpot.v"

module jackpot_tb;

// Inputs to the DUT
reg Clk;
reg Rst;
reg [3:0] switches;
// Output from the DUT
wire [3:0] leds;
wire [3:0] pe_switch;
wire edg_dect;
wire sum_switch;

// Init the DUT by connecting the ports
jackpot jkpot01 (
  .Clk(Clk),
  .Rst(Rst),
  .SWITCHES(switches),
  .LEDS(leds),
  .pe_switch(pe_switch),
  .edg_dect(edg_dect),
  .sum_switch(sum_switch)
);

initial begin
  // Print the counter activity to the console
  $monitor("time=%d, Rst=%d, switches=%b, leds=%b", $time, Rst, switches, leds);

  $dumpfile("JackpotWave.vcd");   // Output the signals to the waveform file
  $dumpvars(0, jackpot_tb);       // Dump signals in the top module

  // Default starting value for all input signals
  Clk = 1'b0;
  Rst = 1'b1;
  switches = 4'b0000;

  // Exercise the inputs to test the module
  #10000;
  Rst = 1'b0;
  #100000;
  @(posedge leds[1]);
      switches = 4'b0010;
  #100000;
  Rst = 1'b1;
  #100000;
  Rst = 1'b0;
  #10000;
  @(posedge leds[3]);
    switches = 4'b1000;
  #500000;
  $finish;

end

// Generate a 50% duty cycle clock with a period of 8ns.
// This is a 125MHz clock
always
  #20000 Clk <= ~Clk;

endmodule