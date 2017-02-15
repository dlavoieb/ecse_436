module mult10 (A, B, Y);
	input [9:0] A;
	input [9:0] B;
	output reg [19:0] Y;
	
	always@(A, B) begin
		Y <= A*B;
	end
	
endmodule