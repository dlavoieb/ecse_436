module reg32 (reset, CLK, D, Q);

	input reset;
	input	CLK;
	input	[31:0]	D;
	output	[31:0]	Q;
	reg	[31:0]		Q;
	
	always@(posedge CLK)
	begin
		if (reset)
			Q=0;
		else
			Q=D;
	end		
			
endmodule
