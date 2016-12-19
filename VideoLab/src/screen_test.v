/**
 * This verilog module allows us to test with different origins and limits.
 * 
 * Author: Malcolm Watt
 */

module screen_test(switches, x_origin, y_origin, x_limit, y_limit);
	input [17:0] switches;

	
	// The four corners of the bounding square to display
	output reg [9:0] x_origin;
	output reg [9:0] y_origin;
	output reg [9:0] x_limit;
	output reg [9:0] y_limit;
	
	always @(*) begin
		x_origin <= 10'b0000000000;
		y_origin <= 10'b0000000000;
		x_limit <= 10'b1001111111;
		y_limit <= 10'b111011111;
	end
endmodule
	