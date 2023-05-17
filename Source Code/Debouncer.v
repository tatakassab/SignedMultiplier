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


module Debouncer(input clk, rst, in, output out);
reg q1,q2,q3;
always@(posedge clk, posedge rst) begin
if(rst == 1'b1) begin
q1 <= 0;
q2 <= 0;
q3 <= 0;
end
else begin
q1 <= in;
q2 <= q1;
q3 <= q2;
end
end
assign out = (rst) ? 0 : q1&q2&q3;
endmodule