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
wire t1, t2;
Debouncer Deb(.clk(clk), .rst(rst), .in(w), .out(t1));
Synchronizer Sync(.clk(clk), .rst(rst), .sig(t1), .sig1(t2)); 
rising_edge_detector posedgedet(.clock(clk), .reset(rst), .w(t2), .z(z));
endmodule
