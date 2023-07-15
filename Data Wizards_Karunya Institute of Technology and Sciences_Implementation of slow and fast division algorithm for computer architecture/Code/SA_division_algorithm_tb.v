module SA_division_algorithm_tb;
  reg clk;
  reg signed [3:0] dividend;
  reg signed [3:0] divisor;
  wire signed [3:0] quotient;
  wire signed [3:0] remainder;s

  SA_division_algorithm dut (
    .clk(clk),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );

  initial begin
    clk = 0;
    dividend = 100;  // Set the dividend value
    divisor = 5;    // Set the divisor value

    #5;
    dividend = 50;   // Change the dividend value
    divisor = 3;    // Change the divisor value
    #10;             // Add a delay here

    #10;
    dividend = 75;   // Change the dividend value
    divisor = 8;    // Change the divisor value
    #10;             // Add a delay here

    #10;             // Add an additional delay here

    $finish;
  end

  always #5 clk = ~clk;  // Toggle the clock every 5 time units

  always @(posedge clk) begin
    $display("dividend = %d, divisor = %d, quotient = %d, remainder = %d",
      dividend, divisor, quotient, remainder);
  end

endmodule

