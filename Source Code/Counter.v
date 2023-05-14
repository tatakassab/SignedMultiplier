`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 01:30:32 AM
// Design Name: 
// Module Name: Counter
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