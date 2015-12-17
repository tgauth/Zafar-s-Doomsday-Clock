`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:09 12/17/2015 
// Design Name: 
// Module Name:    ClockTracker 
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
module ClockTracker(clk, rst, buttonsInput, mode, clock_bin);
	input clk;
	input rst;
	input [1:0] buttonsInput;
	input [1:0] mode;
	output reg [15:0] clock_bin;
	reg [5:0] seconds;
	wire [1:0] count;
	
	wire enable;
	assign enable = (mode != 1 & mode != 2);
	
	initial begin
		seconds = 6'b000000;
		clock_bin = 0;
	end
	


	//buttonDigitSelector sel(.count(count),.PB(buttonsInput[0]),.clk(clk));
	//incrementTimeButton inc(.clk(clk),.PB(buttonsInput[1]),.count(count),.enable(enable),.big_bin(utimer_bin));
				
	always@(posedge clk) begin
		seconds = seconds + 1'b1;
		if(seconds >= 60) begin
			clock_bin = clock_bin + 1'b1;
			seconds = 0;
		end
		if(clock_bin[3:0] > 9) begin
			if(clock_bin[15:12] >= 2 && clock_bin[11:8] >= 4) begin
					clock_bin[3:0] = 0;
					clock_bin[7:4] = 0;
					clock_bin[11:8] = 0;
					clock_bin[15:12] = 0;
			end
			else if(clock_bin[7:4] >= 5) begin
				if(clock_bin[11:8] >= 9) begin
					clock_bin[3:0] = 0;
					clock_bin[7:4] = 0;
					clock_bin[11:8] = 0;
					clock_bin[15:12] = clock_bin[15:12] + 1'b1;
				end
				else begin
					clock_bin[3:0] = 0;
					clock_bin[7:4] = 0;
					clock_bin[11:8] = clock_bin[11:8] + 1'b1;
				end
			end

			else begin
				clock_bin[3:0] = 0;
				clock_bin[7:4] = clock_bin[7:4] + 1'b1;
			end
		end
			if(rst == 1) begin
				clock_bin = 16'b0000010000100000;
			end
	end

endmodule
