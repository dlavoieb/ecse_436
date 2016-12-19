/**
 *	This verilog module outputs rgb of white when the current x and y coords fall between
 * the x and y origin and the x and y limit (i.e. within the square delimitted by them).
 *
 * SW17 toggles between colors changing and a `reset` state (which is all white).
 * SW16-SW14 control the speed at which the square moves accross the screen.
 * SW9-SW0 control the size of the square on the screen.
 *
 * Author: Malcolm Watt
 */
module show_square(fsm_clck, x_coords, y_coords, switches, red, green, blue);
	/* I/O declarations. */
	// The vertical sync signal from the VGA connector is our fsm_clck.
	input fsm_clck;
	
	// The current raster coordinates.
	input [9:0] x_coords;
	input [9:0] y_coords;
	
	// The input switches on the board.
	input [17:0] switches;
	
	// The output colour registers.
	output reg [3:0] red;
	output reg [3:0] green;
	output reg [3:0] blue;
	
	/* Local declarations. */
	// The offset at which we want the square to be (used to move it accross the screen).
	reg [9:0] offset;
	
	// The size of the square, and the limit (based on the vertical resolution of VGA).
	reg [9:0] square_size = 10'b0000000001;
	reg [9:0] max_square_size = 10'b0111011111;
	
	// States for the colour changing FSM.
	parameter RED = 4'b1000, GREEN = 4'b0100, BLUE = 4'b0010, IDLE = 4'b0001;
	reg [3:0] state = 4'b0001;
	reg [3:0] next_state = 4'b0001;
	
	
	/* Color FSM Combinational Logic. */
	always @(state) begin: COMBINATIONAL_LOGIC
		next_state = 4'b0001; // Default (should never stay at this value).
		case(state)
			IDLE: next_state = RED;
			RED: next_state = GREEN;
			GREEN: next_state = BLUE;
			BLUE: next_state = RED;
			default: next_state = RED;
		endcase
	end
	
	/* FSM Sequential Logic. */
	always @(posedge fsm_clck) begin: SEQUENTIAL_LOGIC
		// Handle colour state change logic.
		if (switches[17] == 1'b1) begin
			state <= #1 IDLE; // reset (SW17)
		end
		else begin
			state <= #1 next_state;
		end
		
		// Handle the movement of the square by adjusting offset.
		if (offset > max_square_size) begin
			// If we pass the edge of the screen reset to the top left corner.
			offset = #1 10'b0000000000;
		end
		else begin
			// Otherwise, we add the current speed value 
			// (determined by switches 16-13) to the offset.
			offset <= #1 offset + {{9-4{1'b0}}, switches[16:13]};
		end
	end
	
	/* Handle Square Drawing */
	always @(x_coords, y_coords, switches) begin
		if (switches[9:0] > max_square_size) begin
			square_size = max_square_size; // Limit the square_size to the vertical limit.
		end
		else begin
			square_size = switches[9:0]; // Switches 9 -> 0 control the size.
		end

		// If the x and y coords fall within the bounding box of the offset and square_size,
		// we set the rgb based on the current state of the colour state machine.
		if (offset <= x_coords 
		    && x_coords <= square_size + offset 
		    && offset <= y_coords 
		    && y_coords <= square_size + offset) begin
			case(state)
				IDLE: begin
					red = 4'b1111;
					green = 4'b1111;
					blue = 4'b1111;
				end
				RED: begin
					red = 4'b1111;
					green = 4'b0000;
					blue = 4'b0000;
				end
				GREEN: begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				BLUE: begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b1111;
				end
				default: begin
					red = 4'b1111;
					green = 4'b1111;
					blue = 4'b1111;
				end
			endcase
		end
		else begin
			red = 4'b0010;
			green = 4'b0010;
			blue = 4'b0010;
		end
	end
endmodule
