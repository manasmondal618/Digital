//here, code a 4-bit ripple counter

module ripple_counter (
    input clk,       // Clock input
    input reset,     // Asynchronous reset
    output [3:0] q   // 4-bit counter output
);

    reg [3:0] q_reg;

    assign q = q_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q_reg <= 4'b0000;       // Reset counter to 0
        else
            q_reg <= q_reg + 1;     // Increment counter
    end

endmodule