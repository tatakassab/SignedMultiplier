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


module clock_divider #(parameter n = 500000)
(input clk, rst, output reg clk_out);
reg [31:0] count;

always @ (posedge clk, posedge rst) begin
    if (rst == 1'b1) // Asynchronous Reset
    count <= 32'b0;
    else if (count == n-1)
    count <= 32'b0;
    else
    count <= count + 1;
end

always @ (posedge clk, posedge rst) begin
    if (rst) // Asynchronous Reset
    clk_out <= 0;
    else if (count == n-1)
    clk_out <= ~ clk_out;
    end
    
endmodule
