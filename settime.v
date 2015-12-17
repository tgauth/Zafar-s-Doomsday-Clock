`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tess
// 
// Create Date:    17:19:21 12/16/2015 
// Design Name: 
// Module Name:    settimebutton 
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
module incrementTimeButton(input clk, input PB, input [1:0] count, input enable, output reg [15:0] big_bin);

	wire PB_state1;
		
	PushButton_Debouncer D2(.PB_state(PB_state1),.PB_down(),.PB_up(), .PB_cnt(), .clk(clk), .PB(PB));
		
	always @ (posedge PB_state1) begin
		if(enable) begin
			case (count)
				0: begin 
						big_bin[3:0] = big_bin[3:0] + 1'b1;
						if(big_bin[3:0] > 9) begin
							big_bin[3:0] = 0;
						end
					end
					
				1:  begin
						big_bin[7:4] = big_bin[7:4] + 1'b1;
						if(big_bin[7:4] > 9) begin
							big_bin[7:4] = 0;
						end
					end
					
				2: begin
						big_bin[11:8] = big_bin[11:8] + 1'b1;
						if(big_bin[11:8] > 9) begin
							big_bin[11:8] = 0;
						end
					end
					
				3: begin
						big_bin[15:12] = big_bin[15:12] + 1'b1;
						if(big_bin[15:12] > 9) begin
							big_bin[15:12] = 0;
						end
					end
			endcase
		end
	end
		
 
 endmodule
