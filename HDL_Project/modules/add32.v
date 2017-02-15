/****************************************************
*	add32 - ADD TWO 32 BIT NUMBERS					*
*													*
*	Author: Michael Yuhas							*
*	Date:	2014/10/16								*
****************************************************/


module add32(a, b, cin, y, cout);
	input[31:0] a,b;
	input		cin;
	output[31:0] y;
	output cout;
	assign {cout,y} = a + b + cin;
endmodule
