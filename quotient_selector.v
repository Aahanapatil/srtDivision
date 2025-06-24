module quotient_selector (
    input signed [7:0] rem_msb,     // Top bits of remainder
    input signed [7:0] div_msb,     // Top bits of divisor
    output reg signed [2:0] q_digit // -2 to +2
);
    always @(*) begin
        // Simple estimation based on remainder/divisor ratio
        if (rem_msb > 2*div_msb)
            q_digit = 3'sd2;
        else if (rem_msb > div_msb)
            q_digit = 3'sd1;
        else if (rem_msb > -div_msb)
            q_digit = 3'sd0;
        else if (rem_msb > -2*div_msb)
            q_digit = -3'sd1;
        else
            q_digit = -3'sd2;
    end
endmodule
