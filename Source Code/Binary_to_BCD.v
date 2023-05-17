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


module Binary_to_BCD(
input [15:0] Binary,
output [4:0] D0, D1, D2, D3, D4
);

reg [19:0] Decimal;
integer i;
	
always @(Binary) begin
    Decimal=0;		 	
    for (i=0;i<16;i=i+1) begin
        if (Decimal[3:0] >= 5) Decimal[3:0] = Decimal[3:0] + 3;
        if (Decimal[7:4] >= 5) Decimal[7:4] = Decimal[7:4] + 3;
        if (Decimal[11:8] >= 5) Decimal[11:8] = Decimal[11:8] + 3;
        if (Decimal[15:12] >= 5) Decimal[15:12] = Decimal[15:12] + 3;
        if (Decimal[19:16] >= 5) Decimal[19:16] = Decimal[19:16] + 3;
        Decimal = {Decimal[18:0],Binary[15-i]};
    end
end

assign D0 = Decimal[3:0];
assign D1 = Decimal[7:4];
assign D2 = Decimal[11:8];
assign D3 = Decimal[15:12];
assign D4 = Decimal[19:16];

endmodule
