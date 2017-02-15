module compare_lt (A, B, Y);
	input [9:0] A;
	input [9:0] B;
	output reg Y;
	
	always@(A, B) begin
		if (A<B) begin
			Y <= 1;
		end else begin
			Y <= 0;
		end
	end
	
endmodule