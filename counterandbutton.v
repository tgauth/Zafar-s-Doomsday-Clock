`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tess
// 
// Create Date:    10:11:39 11/16/2015 
// Design Name: 
// Module Name:    counterandbutton 
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
module buttonDigitSelector(output reg [1:0] count, input PB, input clk);
	 
	wire PB_state;
	//// to choose which digit of big_bin to change
	
	initial begin
		count = 2'b00;
	end

	PushButton_Debouncer D1(.PB_state(PB_state),.PB_down(),.PB_up(), .PB_cnt(), .clk(clk), .PB(PB));

	always @(posedge PB_state) begin
		count = count + 1'b1;
	end
	 
endmodule
