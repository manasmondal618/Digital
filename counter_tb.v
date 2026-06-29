`timescale 1ns / 1ps

module counter_tb;

    // Testbench signals
    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the counter module
    ripple_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation: 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Display header
        $display("Time\tReset\tQ");
        $display("---------");
        $monitor("%3t\t%b\t%4b", $time, reset, q);

        // Initial reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Let counter run for several clock cycles (count from 0 to 15 and back to 0)
        #160;  // 16 cycles * 10ns per cycle = 160ns

        // Test reset during counting
        #20;
        reset = 1;
        #10;
        reset = 0;
        #20;

        // Let counter continue
        #100;

        // End simulation
        $finish;
    end

    // Optional: Generate a VCD file for waveform viewing
    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
    end

endmodule
