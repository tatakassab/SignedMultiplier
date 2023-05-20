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

module Sign_Calculator(
input [7:0] num1, num2,
input clk, load,
output reg [7:0] num1_abs, num2_abs,
output reg sign
);

always @ (posedge clk) begin
    if(load)  sign <= num1[7] ^ num2[7];
    else sign = sign;
    num1_abs <= (num1[7] == 0)? num1: ~num1 + 1;
    num2_abs <= (num2[7] == 0)? num2: ~num2 + 1;
end

endmodule
