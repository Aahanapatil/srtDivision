`timescale 1ns / 1ps

module tb1();

    // Inputs
    reg clk;
    reg rst;
    reg start;
    reg signed [7:0] dividend;
    reg signed [7:0] divisor;

    // Outputs
    wire done;
    wire signed [15:0] quotient_out;

    // Instantiate the Unit Under Test (UUT)
    srt_divider uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .dividend(dividend),
        .divisor(divisor),
        .done(done),
        .quotient_out(quotient_out)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns period (100 MHz)

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        start = 0;
        dividend = 0;
        divisor = 0;

        // Reset pulse
        #20;
        rst = 0;

        // Test Case 1: 100 / 5 = 20
        dividend = 8'd100;
        divisor = 8'd5;
        start = 1;
        #10;
        start = 0;

        // Wait for completion
        wait (done == 1);
        #10;
        $display("Test 1: 100 / 5 = %0d", quotient_out);

        // Test Case 2: 81 / 9 = 9
        rst = 1; #10; rst = 0;
        dividend = 8'd81;
        divisor = 8'd9;
        start = 1; #10; start = 0;

        wait (done == 1);
        #10;
        $display("Test 2: 81 / 9 = %0d", quotient_out);

        // Test Case 3: 25 / 3 = 8 (integer division)
        rst = 1; #10; rst = 0;
        dividend = 8'd25;
        divisor = 8'd3;
        start = 1; #10; start = 0;

        wait (done == 1);
        #10;
        $display("Test 3: 25 / 3 = %0d", quotient_out);

        // Test Case 4: 0 / 5 = 0
        rst = 1; #10; rst = 0;
        dividend = 8'd0;
        divisor = 8'd5;
        start = 1; #10; start = 0;

        wait (done == 1);
        #10;
        $display("Test 4: 0 / 5 = %0d", quotient_out);

        // End simulation
        $finish;
    end

endmodule
