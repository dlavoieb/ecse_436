module sub10 (A, B, Y);
	input [9:0] A;
	input [9:0] B;
	output reg [9:0] Y;
	
	always@(A, B) begin
		Y <= A-B;
	end
	
endmodule