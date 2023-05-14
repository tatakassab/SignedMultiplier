`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:14:31 PM
// Design Name: 
// Module Name: SM
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


module Unsigned_Multiplier(input [7:0] Multiplier, Multiplicand, input load, reset, clk, output reg done, output reg [15:0] resultant);
	reg [15:0] M1;
	reg [7:0] M2;
	reg [15:0] acc;
	always @ (posedge clk or posedge reset) begin
		if(reset) begin
			M1 <= 16'b0;
			M2 <= 8'b0;
			acc <= 16'b0;
		end
		else begin
			if(load) begin
				M1 <= {8'b0,Multiplier};
				M2 <= Multiplicand;
				acc <= 16'b0;
			end
			else if(M2 != 8'b0) begin
				if(M2[0] == 1'b1) begin
					acc <= acc + M1;
				end else
					acc <= acc;
				M1 <= M1 << 1;
				M2 <= M2 >> 1;
			end
			else begin
				acc <= acc;
				resultant <= acc;
			end
				
		end
	end

	always @ (*) begin
		if(load || reset) begin
			 done = 1'b0;
		end
		else if (M2 == 8'b0) begin
			 done = 1'b1;
		end
	end
endmodule