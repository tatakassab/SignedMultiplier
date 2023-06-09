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


module Shift_Register(
input [3:0] D0, D1, D2, D3, D4,
input clk, rst, w1, w2,
output reg[3:0] S0, S1, S2
    );
reg [1:0] sel;


always @ (*) begin
        if(sel ==2'b00|rst == 1) begin
            S0 = D0;
            S1 = D1;
            S2 = D2;
        end else if(sel == 2'b01) begin
            S0 = D1;
            S1 = D2;
            S2 = D3;
        end else if(sel == 2'b10) begin
            S0 = D2;
            S1 = D3;
            S2 = D4;
        end else if(sel == 2'b11) begin
            S0 = D2;
            S1 = D3;
            S2 = D4;
        end 
    end
    
always @ (posedge clk, posedge rst) begin

     if(rst == 1)
        sel <= 0;
     else begin
        if(w1 == 1 & w2 == 1) begin
            sel <= sel;
        end else if(w1 == 0 & w2 == 0) begin
            sel <= sel;
        end else if(w1 == 0 & w2 == 1 & sel < 2) begin
            sel <= sel+1;
        end else if(w1 == 1 & w2 == 0 & sel > 0) begin
            sel <= sel-1;
        end
     end 
 end
endmodule
