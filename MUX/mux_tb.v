`timescale 1ns / 1ps

// Module definition for the testbench
module mux_8x1_tb;
    // Declaration of signals
    wire y;            // Output of the DUT (Device Under Test)
    reg [7:0] i;       // 8-bit input
    reg [2:0] s;       // 3-bit select signal
    
    // Instantiation of the DUT
    mux_8x1 dut(y, i, s);

    // Initial block for testbench setup
    initial
    begin
        // Initialize inputs
        i = 8'b00000000;  // Initial value for 8-bit input
        s[0] = 0;         // Initial value for select bit 0
        s[1] = 0;         // Initial value for select bit 1
        s[2] = 0;         // Initial value for select bit 2
        
        // Stimulus generation
        #100 i = 8'hca;    // Change input after 100 time units
        #200 i = 8'h0f;    // Change input after 200 time units
        #500 i = 8'h5a;    // Change input after 500 time units
        
        // Finishing simulation after 1500 time units
        #1500 $finish();
    end
    
    // Toggle select signals at different intervals
    always #100 s[0] = ~s[0];  // Toggle select bit 0 every 100 time units
    always #200 s[1] = ~s[1];  // Toggle select bit 1 every 200 time units
    always #400 s[2] = ~s[2];  // Toggle select bit 2 every 400 time units
endmodule