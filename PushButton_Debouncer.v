module PushButton_Debouncer(input clk, input clkButton, output reg PB_state, output PB_down, output PB_up, output reg [7:0] PB_cnt );

	// First use two flip-flops to synchronize the PB signal the "clk" clock domain
	reg PB_sync_0;  always @(posedge clk) PB_sync_0 <= ~clkButton;  // invert PB to make PB_sync_0 active high
	reg PB_sync_1;  always @(posedge clk) PB_sync_1 <= PB_sync_0;

	// When the push-button is pushed or released, we increment the counter
	// The counter has to be maxed out before we decide that the push-button state has changed

	wire PB_idle = (PB_state==PB_sync_1);
	wire PB_cnt_max = &PB_cnt;	// true when all bits of PB_cnt are 1's

	initial
		PB_cnt = 0;
		
	always @(posedge clk)
	if(PB_idle)
		 PB_cnt <= 0;  // nothing's going on
	else
	begin
		 PB_cnt <= PB_cnt + 1'b1;  // something's going on, increment the counter
		 if(PB_cnt_max) PB_state <= ~PB_state;  // if the counter is maxed out, PB changed!
	end

	assign PB_down = ~PB_idle & PB_cnt_max & ~PB_state;
	assign PB_up   = ~PB_idle & PB_cnt_max &  PB_state;
endmodule