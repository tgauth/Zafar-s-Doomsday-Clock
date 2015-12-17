`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:25 12/17/2015 
// Design Name: 
// Module Name:    TimerTracker 
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
module DownTimerTracker(clk, rst, dtimer_bin, buttonsInput, mode, alarm);
	input clk;
	input rst;
	input [1:0] buttonsInput;
	input [1:0] mode;
	output reg [15:0] dtimer_bin;
	output reg alarm;
	
	initial begin
		alarm = 2'b00;
		dtimer_bin = 16'b0000000000010000;
	end
	
	wire enable;
	assign enable = (mode == 2);
	
	//buttonDigitSelector sel(.count(count),.PB(buttonsInput[0]),.clk(clk));
	//incrementTimeButton inc(.clk(clk),.PB(buttonsInput[1]),.count(count),.enable(enable),.big_bin(utimer_bin));
				
	
	
	always@(posedge clk) begin
		if(dtimer_bin[3:0] == 0) begin
			if(dtimer_bin[7:4] == 0) begin
				 if(dtimer_bin[11:8] == 0) begin
					  if(dtimer_bin[15:12] == 0) begin
							dtimer_bin = 0;
							alarm = 1;
					  end
					  else begin
						  dtimer_bin[15:12] = dtimer_bin[15:12] - 1'b1;
						  dtimer_bin[11:8] = 9;
						  dtimer_bin[7:4] = 5;
						  dtimer_bin[3:0] = 9;
					  end
				 end
				 else begin
					  dtimer_bin[11:8] = dtimer_bin[11:8] - 1'b1;
					  dtimer_bin[7:4] = 5;
					  dtimer_bin[3:0] = 9;
				 end
			end
			else begin
				dtimer_bin[7:4] = dtimer_bin[7:4] - 1'b1;
				dtimer_bin[3:0] = 9;
			end
		end
		else begin
			dtimer_bin[3:0] = dtimer_bin[3:0] - 1'b1;
		end
		if(rst==1) begin
			dtimer_bin = 16'b0000000000010000;
			alarm = 0;
		end
		
	end


endmodule
