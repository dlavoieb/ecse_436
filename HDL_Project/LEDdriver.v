module LEDdriver (in, out);
	input [31:0] in;
	output [17:0] out;
	
	always@(in)
	begin
		if ( in < 32'h90000000 & in > 32'h70000000 )
			out = 20'b1111111111111111110;
		else if ( in < 32'hA0000000 & in > 32'h60000000 )
			out = 20'b1111111111111111100;
		else if ( in < 32'hB0000000 & in > 32'h50000000 )
			out = 20'b1111111111111111000;
		else if ( in < 32'hC0000000 & in > 32'h40000000 )
			out = 20'b1111111111111110000;
		else if ( in < 32'hD0000000 & in > 32'h30000000 )
			out = 20'b1111111111111100000;
		else if ( in < 32'hE0000000 & in > 32'h20000000 )
			out = 20'b1111111111111000000;
		else if ( in < 32'hF0000000 & in > 32'h10000000 )
			out = 20'b1111111111110000000;
		else
			out = 20'b111111110100000000;
	end
	
	
endmodule
