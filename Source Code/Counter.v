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


module Counter #(parameter x = 4, n = 10) (clk, reset,en, count);
input clk, reset, en;
output [x-1:0] count;
reg [x-1:0] count;
always @(posedge clk, posedge reset) begin
 if (reset == 1)
    count <= 0;
 else if(en) begin
     if (count == n-1)
        count <= 0;
     else
        count <= count + 1;
 end
end

endmodule