/**
 * This module converts the `show` output (when high) to a color, and changes this color at the rate of the FSM clock.
 *
 * Author: Malcolm Watt
 */

module color_map(fsm_clock, show, red, green, blue);
	input fsm_clock;
	input show;
	output reg [3:0] red;
	output reg [3:0] green;
	output reg [3:0] blue;
	
	always @ (fsm_clock, show) begin
		if (show == 1'b1) begin
			red = 4'b1111;
			green = 4'b1111;
			blue = 4'b1111;
		end
		else begin
			red = 4'b0000;
			green = 4'b0000;
			blue = 4'b0000;
		end
	end
endmodule