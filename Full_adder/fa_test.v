`timescale 1ns / 1ps

module fa_tb;

    // Declare signals
    reg a, b, Cout;
    wire sum, carry;

    // Instantiate the DUT (Device Under Test)
    fa_bh dut (
        .sum(sum),
        .carry(carry),
        .a(a),
        .b(b),
        .Cout(Cout)
    );

    // Initial block to initialize inputs
    initial begin
        a = 0;
        b = 0;
        Cout = 0;
    end

    // Toggle 'a' every 100 time units
    always #100 a = ~a;

    // Toggle 'b' every 200 time units
    always #200 b = ~b;

    // Toggle 'Cout' every 400 time units
    always #400 Cout = ~Cout;

endmodule