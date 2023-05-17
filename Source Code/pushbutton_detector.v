`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The American University in Cairo
// Engineer: Adham El-Asfar, Tarek Kassab, Omar Hesham, Farida Amin
// 
// Create Date: 05/13/2023 11:14:31 PM
// Module Name: main
// Project Name: Signed Multiplier
// Target Devices: Basys 3 FPGA Boards
// Description: This module is part of a sequencial 8x8 bits signed multiplier
// 
// Dependencies: The Constraint Files, Rest of the source code
// 
// 
//////////////////////////////////////////////////////////////////////////////////


module pushbutton_detector(input clk, rst, w, output z);
wire clk_out;
wire t1, t2;
clock_divider clk_out(.clk(clk), .rst(rst), .clk_out(clk_out));
Debouncer Deb(.clk(clk_out), .rst(rst), .in(w), .out(t1));
Synchronizer Sync(.clk(clk_out), .rst(rst), .sig(t1), .sig1(t2)); 
rising_edge_detector posedgedet(.clock(clk_out), .reset(rst), .w(t2), .z(z));
endmodule
