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


module SS_Driver(
input sign, clk, rst,
input [3:0] BCD0, BCD1, BCD2,
output [6:0] segments,
output [3:0] en
    );
wire flashimgClock;
wire [1:0] toggleEnable;
reg[3:0] in1;

clock_divider #(.n(250000)) toggleClock(.clk(clk), .rst(rst), .clk_out(flashingClock));
Counter #(.x(2), .n(4)) toggler(.clk(flashingClock), .reset(rst), .en(1'b1), .count(toggleEnable));
SD seven_segment(.toggle(toggleEnable), .in(in1), .segments(segments), .anode_active(en));

always @(*) begin
    case(toggleEnable)
        0: in1 = BCD0;
        1: in1 = BCD1;
        2: in1 = BCD2;
        3: in1 = (sign == 1)?4'd10:4'd11;
    endcase
   end
endmodule
