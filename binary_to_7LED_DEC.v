module binary_to_DEC_segment(bin,seven);	
input [3:0] bin;
output reg [6:0] seven; //Assume MSB is A, and LSB is G	

initial	//Initial block, used for correct simulations	
	seven=0;

always @ (*)
	case(bin)	
		0:	seven = 7'b0000001;
		1:	seven = 7'b1001111;
		2: seven = 7'b0010010;
		3: seven = 7'b0000110;
		4: seven = 7'b1001100;
		5: seven = 7'b0100100;
		6: seven = 7'b0100000;
		7: seven = 7'b0001111;
		8: seven = 7'b0000000;
		9: seven = 7'b0000100;
		//remember 0 means "light-up"
		default: seven = 7'b1111111; //Something here - all off?
	endcase
endmodule	