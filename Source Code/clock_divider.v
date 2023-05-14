`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:26:10 PM
// Design Name: 
// Module Name: clock_divider
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
