module radix4_multiplier (
    input signed [2:0] q_digit,
    input signed [7:0] divisor,
    output reg signed [15:0] product
);
    always @(*) begin
        case (q_digit)
            -2: product = -2 * divisor;
            -1: product = -1 * divisor;
             0: product = 0;
             1: product = 1 * divisor;
             2: product = 2 * divisor;
            default: product = 0;
        endcase
    end
endmodule
