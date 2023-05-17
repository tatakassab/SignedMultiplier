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
output [7:0] num1_abs, num2_abs,
output sign
);

assign sign = num1[7] ^ num2[7];
assign num1_abs = (num1[7] == 0)? num1: ~num1 + 1;
assign num2_abs = (num2[7] == 0)? num2: ~num2 + 1;

endmodule
