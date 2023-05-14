`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:26:10 PM
// Design Name: 
// Module Name: Synchronizer
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
