`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 01:05:29 AM
// Design Name: 
// Module Name: 7SD
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


module SD(input [1:0] toggle, input [3:0] in, output reg [6:0] segments, output reg [3:0]
anode_active);
always @ (in) begin
    case(in)
        0: segments = 7'b0000001;
        1: segments = 7'b1001111;
        2: segments = 7'b0010010;
        3: segments = 7'b0000110;
        4: segments = 7'b1001100;
        5: segments = 7'b0100100;
        6: segments = 7'b0100000;
        7: segments = 7'b0001111;
        8: segments = 7'b0000000;
        9: segments = 7'b0000100;
        10: segments = 7'b11111110;
        
        default: segments = 7'b11111111;
    endcase
end
always @ * begin
        case (toggle)
            0: anode_active = 4'b1110;
            1: anode_active = 4'b1101;
            2: anode_active = 4'b1011;
            3: anode_active = 4'b0111;
        endcase
    end
endmodule