`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:14:31 PM
// Design Name: 
// Module Name: Sign_Calculator
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


module Sign_Calculator(
input [7:0] num1, num2,
output [7:0] num1_abs, num2_abs,
output sign
);

assign sign = num1[7] ^ num2[7];
assign num1_abs = (num1[7] == 0)? num1: ~num1 + 1;
assign num2_abs = (num2[7] == 0)? num2: ~num2 + 1;

endmodule
