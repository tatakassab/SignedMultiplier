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

module Synchronizer(input clk, sig, rst, output reg sig1);
reg META;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        META <= 1'b0;
        sig1 <= 1'b0;
    end
    else begin
        META <= sig;
        sig1 <= META;
    end
end
endmodule
