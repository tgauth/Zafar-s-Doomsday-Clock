`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:40 12/16/2015 
// Design Name: 
// Module Name:    Functions 
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


module functions(mode, clk, big_bin, rst, buttonsInput, alarm);
	input [1:0] mode;
	input clk;
	output reg [15:0] big_bin;
	input rst;
	input [1:0] buttonsInput;
	output alarm;
	
	wire [15:0] clock_bin;
	wire [15:0] utimer_bin;
	wire [15:0] dtimer_bin;
	
	initial begin
		big_bin = 16'b0000100101010000;
	end
	
	ClockTracker clockMode(.clk(clk),.rst(rst),.buttonsInput(buttonsInput),.mode(mode),.clock_bin(clock_bin));
	TimerTracker timerMode(.clk(clk),.rst(rst),.utimer_bin(utimer_bin),.buttonsInput(buttonsInput),.mode(mode));
	DownTimerTracker countdownMode(.clk(clk),.rst(rst),.dtimer_bin(dtimer_bin),.buttonsInput(buttonsInput),.mode(mode),.alarm(alarm));
	
	always@(posedge clk) begin

			case(mode) 
				//Clock mode
				default: 
				begin
					big_bin = clock_bin;
				end

				//Countup Timer
				1: 
				begin
					big_bin = utimer_bin;
				end

				//Countdown Timer
				2: 
				begin
					big_bin = dtimer_bin;
				end
			endcase
	end
endmodule
