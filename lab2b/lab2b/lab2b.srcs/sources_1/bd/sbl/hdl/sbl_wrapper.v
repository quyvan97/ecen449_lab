//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Mon Feb 13 22:39:27 2023
//Host        : DESKTOP-O42HKUL running 64-bit major release  (build 9200)
//Command     : generate_target sbl_wrapper.bd
//Design      : sbl_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module sbl_wrapper
   (clk_100MHz,
    led_tri_o,
    sb_tri_i);
  input clk_100MHz;
  output [3:0]led_tri_o;
  input [7:0]sb_tri_i;

  wire clk_100MHz;
  wire [3:0]led_tri_o;
  wire [7:0]sb_tri_i;

  sbl sbl_i
       (.clk_100MHz(clk_100MHz),
        .led_tri_o(led_tri_o),
        .sb_tri_i(sb_tri_i));
endmodule
