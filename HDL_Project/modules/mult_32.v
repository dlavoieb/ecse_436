/*32-bit 2's Complement Multiplication*/
/*NOTE, OVERFLOW HANDLED AS SATURATION*/
/*SATURATES IF BOTH INPUTS > 0xFFFF*/

module mult_32( A, B, Y);
  input  signed [31:0]  A;
  input 	signed [31:0]  B;
  output signed [31:0]  Y;
  wire   signed [63:0]  temp;
  
  always@(A,B)
  begin
    assign temp = A * B;
    if (temp > 64'h00000000FFFFFFFF)
      begin
        assign Y = 32'hFFFFFFFF;
      end
    else
      begin
        assign Y = temp[31:0];
      end
  end
endmodule
  
  