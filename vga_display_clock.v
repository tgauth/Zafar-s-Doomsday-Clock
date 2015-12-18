`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:13 12/12/2015 
// Design Name: 
// Module Name:    vga_display_clock 
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
module vga_display_clock(rst, clk, R, G, B, HS, VS, AN, seven, mode, buttonsInput);
	//..................
	// Define your parameters, inputs, regs, etc
	//..................
	input rst;	// global reset
	input clk;	// 100MHz clk
		
	// color outputs to show on display (current pixel)
	output reg [2:0] R, G;
	output reg [1:0] B;
	
	// Synchronization signals
	output HS;
	output VS;
	
	// controls:
	wire [10:0] hcount;	// coordinates for the current pixel
	wire [9:0] vcount;
	wire blank;	// signal to indicate the current coordinate is blank
	input [1:0] mode;
	
	// number to display
	wire [15:0] big_bin;
	
	// for seven seg display
	output [3:0] AN;
	output [6:0] seven;
	
	//for 1Hz Clock
	reg [25:0] clkCount;
	reg clk_1Hz;
	
	//for 1kHz Clock
	reg [15:0] clkkHzCount;
	reg clk_1kHz;
	
	//for drawing
	wire [3:0] isContained;
	
	//for changing times
	input wire [1:0] buttonsInput;
	
	//for flashing lights
	wire alarm;
	
	//deciding clock functions
	functions ClockBrain(.mode(mode), .clk(clk_1Hz), .big_bin(big_bin),.rst(rst),.buttonsInput(buttonsInput),.alarm(alarm));
	
	SevenSeg_Display_Out SevSegDisp(.big_bin(big_bin),.clk(clk_1kHz),.seven(seven),.AN(AN));
	
	
////////////////////////////////VGA ACTIVITIES AND OTHER THINGS

	/////////25 MHZ Clock Divider
	parameter N = 2;	// parameter for clock division
	reg clk_25Mhz;
	reg [N-1:0] count;
	always @ (posedge clk) begin
	  //25MHz clock
	  count <= count + 1'b1;
	  clk_25Mhz <= count[N-1];
	  
	  //1 Hz clock
	  if (clkCount < 50000000) begin
			clkCount <= clkCount + 1'b1;
	  end
	  else begin
			clkCount <= 0;
			clk_1Hz <= ~clk_1Hz;
	  end
	  
	  //1kHz clock
	  if (clkkHzCount < 50000) begin
			clkkHzCount <= clkkHzCount + 1'b1;
	  end
	  else begin
			clkkHzCount <= 0;
			clk_1kHz <= ~clk_1kHz;
	  end
	end
	
	
	//Drawing stuff
	vga_controller_640_60 vc(
		.rst(rst), 
		.pixel_clk(clk_25Mhz), 
		.HS(HS), 
		.VS(VS), 
		.hcounter(hcount), 
		.vcounter(vcount), 
		.blank(blank));
	//Complete the figure description
	
	
	
	wire dot1, dot2;
	// Creating the dots between clocks:
	assign dot1 = ~blank & (hcount >= 290 & hcount <= 310 & vcount >= 270 & vcount <= 290) & ~clk_1Hz;
	assign dot2 = ~blank & (hcount >= 290 & hcount <= 310 & vcount >= 190 & vcount <= 210) & ~clk_1Hz;
	
	//Creating a drawer module for the numbers. Takes in a 4-bit BCD, which digit it is, and then the current hcount and vcount. Also a clock which runs at the same speed as the VGA.
	//Returns the 'isContained' wire which basically tells the VGA to draw that specific digit.
	NumDrawer numDisp(.big_bin(big_bin),.hcounterer(hcount),.vcounterer(vcount),.clk(clk),.blank(blank),.isContained(isContained));
	
	initial begin
		R = 3'b111;
		G = 3'b000;
		B = 2'b00;
	end
	
	// send colors:
	always @ (posedge clk_25Mhz) begin
		if (dot1 | dot2 | isContained[3] | isContained[2] | isContained[1] | isContained[0]) begin	// for to draw the dots
			R = 3'b111;
			G = ((alarm)? ~clk_1Hz:0);
			B = 0;
		end
		else begin	// if you are outside the valid region
				R = 0;
				G = 0;
				B = 0;
		end
	end

endmodule
