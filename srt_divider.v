module srt_divider (
    input clk,
    input rst,
    input start,
    input signed [7:0] dividend,
    input signed [7:0] divisor,
    output reg done,
    output reg signed [15:0] quotient_out
);

    // Internal registers
    reg signed [15:0] remainder;
    reg signed [15:0] quotient;
    reg [3:0] count;
    reg [1:0] state;

    wire signed [2:0] q_digit;
    wire signed [15:0] product;

    // State encoding
    localparam IDLE = 2'd0,
               RUN  = 2'd1,
               DONE = 2'd2;

    // Instantiate modules
    quotient_selector qs(
        .rem_msb(remainder[15:8]),
        .div_msb(divisor),
        .q_digit(q_digit)
    );

    radix4_multiplier rm(
        .q_digit(q_digit),
        .divisor(divisor),
        .product(product)
    );

    // FSM and datapath
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            count <= 0;
            quotient <= 0;
            remainder <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        quotient <= 0;
                        remainder <= {8'b0, dividend}; // zero-extend
                        count <= 0;
                        state <= RUN;
                    end
                end

                RUN: begin
                    // Shift remainder left by 2 (radix-4)
                    remainder <= (remainder << 2) - product;

                    // Update quotient: shift left by 2 and add q_digit
                    quotient <= (quotient << 2) | (q_digit[1:0] & 2'b11); // simplified

                    count <= count + 1;
                    if (count == 4) begin
                        state <= DONE;
                    end
                end

                DONE: begin
                    done <= 1;
                    quotient_out <= quotient;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
