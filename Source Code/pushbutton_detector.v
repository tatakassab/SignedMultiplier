`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:26:10 PM
// Design Name: 
// Module Name: pushbutton_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
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
