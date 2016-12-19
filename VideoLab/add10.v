module add10 (A, B, Y, Cout);
	input [9:0] A;
	input [9:0] B;
	output reg [9:0] Y;
	output reg Cout;
	
	always@(A, B) begin
		{Cout,Y} <= A+B;
	end
	
endmodule