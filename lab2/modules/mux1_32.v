/****************************************************
*	mux1_32 - MULTIPLEXER: 1 SELECT BIT 32 BIT BUS	*
*													*
*	Author: Michael Yuhas							*
*	Date:	2014/10/16								*
****************************************************/

module mux1_32( a, b, select, y);
	input	[31:0]	a;
	input	[31:0]	b;
	input			select;

	output	[31:0]	y;

	assign mux_out = (select) ? a : b;

endmodule
