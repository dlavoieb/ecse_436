module mux1_2_4 (A,B,sel,Y);
	input	[3:0] A;
	input	[3:0]	B;
	input	sel;
	
	output reg [3:0] Y;
	
	always@(A,B,sel) begin
		Y <= sel? A : B;
	end
	
endmodule