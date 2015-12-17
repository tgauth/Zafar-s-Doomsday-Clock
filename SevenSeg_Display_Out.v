`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:08 12/11/2015 
// Design Name: 
// Module Name:    SevenSeg_Display_Out 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SevenSeg_Display_Out(input [15:0] big_bin, input clk, output [6:0] seven, output [3:0] AN);
	
	wire [3:0] small_bin;
	seven_alternate Selector(.big_bin(big_bin), .small_bin(small_bin), .AN(AN), .seven(seven), .clk(clk));
	binary_to_DEC_segment BCDConvert(.bin(small_bin), .seven(seven));
	
endmodule
