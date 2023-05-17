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

module Unsigned_Multiplier_Datapath(input [7:0] Multiplier, Multiplicand, input load, reset, clk, output reg done, output reg [15:0] resultant);
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
				M1 <= M1 << 1;
				M2 <= M2 >> 1;
			end
			else begin
				resultant <= acc;
			end
				
		end
	end

	always @ (*) begin
		if(load) begin
			 done = 1'b0;
		end
		else if (M2 == 8'b0) begin
			 done = 1'b1;
		end
	end
endmodule