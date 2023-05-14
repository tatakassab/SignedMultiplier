`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:14:31 PM
// Design Name: 
// Module Name: main
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


module main(
input [7:0] num1, num2, 
output [6:0] segments,
input clk, rst, load, right, left,
output [3:0] enable,
output done
);

wire [7:0] abs_num1, abs_num2;
wire [15:0] resultant;
wire [4:0] D0, D1, D2, D3, D4;
wire [4:0] S0, S1, S2;
wire B_left, B_right, B_load, sign;

pushbutton_detector BTNC (.clk(clk), .rst(rst), .w(load), .z(B_load));
pushbutton_detector BTNL (.clk(clk), .rst(rst), .w(left), .z(B_left));
pushbutton_detector BTNR (.clk(clk), .rst(rst), .w(right), .z(B_right));

Sign_Calculator sign_calc(.num1(num1), .num2(num2), .num1_abs(abs_num1), .num2_abs(abs_num2), .sign(sign));

Unsigned_Multiplier Multiplication(.Multiplier(abs_num1), .Multiplicand(abs_num2), .load(B_load), .reset(rst), .clk(clk), .done(done), .resultant(resultant));

Binary_to_BCD Converter(.Binary(resultant), .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4));

Shift_Register Shifter(.D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .clk(clk), .rst(rst), .w1(B_right), .w2(B_left), .S0(S0), .S1(S1), .S2(S2));

SS_Driver Display(.sign(sign), .clk(clk), .rst(rst), .BCD0(S0), .BCD1(S1), .BCD2(S2), .segments(segments), .en(enable));

endmodule
