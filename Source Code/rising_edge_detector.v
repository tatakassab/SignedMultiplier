`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:28:49 PM
// Design Name: 
// Module Name: rising_edge_detector
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

module rising_edge_detector(input clock, reset, w, output z);
reg [1:0] state; // wait for click, clicking, wait for unclick
parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state <= A;
    end
    else begin
        case (state)
            A:
                if (w == 1'b1) state <= B;
            B:
                if (w == 1'b0) state <= A;
                else state <= C;
            C:
                if (w == 1'b0) state <= A;
        endcase
    end
end

assign z = (state == B);

endmodule
