/****************************************************
*	const32 - GENERATE A CONSTAT 32 BIT NUMBER		*
*													*
*	Author: Michael Yuhas							*
*	Date:	2014/10/16								*
*													*
*	NOTE: Takes a 32 bit signed integer from		*
*	-4294967296 to 4294967295						*
*													*
****************************************************/

module const32( cons );
	output	signed [31:0]	cons;
	
	parameter	signed [31:0]		VALUE=0;

	assign cons = VALUE;

endmodule