module fast_DA(divisor, dividend, remainder, result);

  input [2:0] divisor, dividend;
  output reg [2:0] result, remainder;

  // Variables
  reg [2:0] divisor_copy, dividend_copy;
  reg [2:0] temp;
  reg [1:0] i;

  always @(divisor or dividend)
  begin
    divisor_copy = divisor;
    dividend_copy = dividend;
    temp = 0;

    for (i = 0; i < 3; i = i + 1)
    begin
      temp = temp << 1;
      temp[0] = dividend_copy[2];
      dividend_copy = dividend_copy << 1;

      temp = temp - divisor_copy;

      if (temp[2] == 1 || temp[1] == 1)
      begin
        dividend_copy[0] = 0;
        temp = temp + divisor_copy;
      end
      else
      begin
        dividend_copy[0] = 1;
      end
    end

    result = dividend_copy;
    remainder = dividend - (divisor_copy * dividend_copy);
  end
endmodule
