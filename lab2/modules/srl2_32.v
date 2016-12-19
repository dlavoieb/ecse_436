/****************************************************
*	srl2_32 - SHIFT RIGHT 1 BIT (32 BIT ARRAY)		*
*													*
*	Author: Michael Yuhas							*
*	Date:	2014/10/16								*
****************************************************/

module srl2_32 (in, out);
		input	signed [31:0]	in;
		output	signed [31:0]	out;
		
		assign out = in >>> 1;
		
endmodule
