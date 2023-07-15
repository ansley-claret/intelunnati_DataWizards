module division_tb;

  // Inputs
  reg [2:0] divisor;
  reg [2:0] dividend;

  // Outputs
  wire [2:0] result;
  wire [2:0] remainder;

  // Instantiate the division module
  division dut (
    .divisor(divisor),
    .dividend(dividend),
    .result(result),
    .remainder(remainder)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Test stimuli
  initial begin
    #10;  // Wait for some time

    // Test case 1: divisor = 2, dividend = 1
    divisor = 2;
    dividend = 1;
    #10;  // Wait for division process
    $display("Dividend = %b, Divisor = %b, Quotient = %b, Remainder = %b", dividend, divisor, result, remainder);

    // Test case 2: divisor = 3, dividend = 5
    divisor = 3;
    dividend = 5;
    #10;  // Wait for division process
    $display("Dividend = %b, Divisor = %b, Quotient = %b, Remainder = %b", dividend, divisor, result, remainder);

    // Test case 3: divisor = 4, dividend = 7
    divisor = 4;
    dividend = 7;
    #10;  // Wait for division process
    $display("Dividend = %b, Divisor = %b, Quotient = %b, Remainder = %b", dividend, divisor, result, remainder);

    // Add more test cases as needed

    $finish;  // End simulation
  end

  always @(posedge clk)
  begin
    // Display input values at each clock cycle (optional)
    $display("Clock = %t, Dividend = %b, Divisor = %b", $time, dividend, divisor);
  end

endmodule
