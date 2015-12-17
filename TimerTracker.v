`timescale 1ns / 1ps

module TimerTracker(clk, rst, utimer_bin, buttonsInput, mode);
	input clk;
	input rst;
	input [1:0] buttonsInput;
	input [1:0] mode;
	output reg [15:0] utimer_bin;
	
	wire [1:0] count;
	
	initial begin
		utimer_bin = 16'b0000010100000000;
	end
					
	wire enable;
	assign enable = (mode == 1);
	
	//buttonDigitSelector sel(.count(count),.PB(buttonsInput[0]),.clk(clk));
	//incrementTimeButton inc(.clk(clk),.PB(buttonsInput[1]),.count(count),.enable(enable),.big_bin(utimer_bin));
				
				
				
	always@(posedge clk) begin
		utimer_bin = utimer_bin + 1'b1;
		if(utimer_bin[3:0] > 9) begin
			if(utimer_bin[15:12] >= 9) begin
					utimer_bin[3:0] = 0;
					utimer_bin[7:4] = 0;
					utimer_bin[11:8] = 0;
					utimer_bin[15:12] = 0;
			end
			else if(utimer_bin[7:4] >= 5) begin
				if(utimer_bin[11:8] >= 9) begin
					utimer_bin[3:0] = 0;
					utimer_bin[7:4] = 0;
					utimer_bin[11:8] = 0;
					utimer_bin[15:12] = utimer_bin[15:12] + 1'b1;
				end
				else begin
					utimer_bin[3:0] = 0;
					utimer_bin[7:4] = 0;
					utimer_bin[11:8] = utimer_bin[11:8] + 1'b1;
				end
			end

			else begin
				utimer_bin[3:0] = 0;
				utimer_bin[7:4] = utimer_bin[7:4] + 1'b1;
			end
		end
		if(rst == 1) begin
			utimer_bin = 16'b0000010100000000;
		end
	end


endmodule
