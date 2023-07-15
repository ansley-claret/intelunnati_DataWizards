module SA_division_algorithm(
  input wire clk,
  input wire signed [3:0] dividend,
  input wire signed [3:0] divisor,
  output reg signed [3:0] quotient,
  output reg signed [3:0] remainder
);

  always @(posedge clk) begin
    if (divisor != 0) begin
      if (dividend >= divisor) begin
        quotient <= quotient + 1;
        remainder <= dividend - divisor;
      end else begin
        quotient <= quotient - 1;
        remainder <= dividend + divisor;
      end
    end else begin
      quotient <= 0;
      remainder <= dividend;
    end
  end

endmodule
