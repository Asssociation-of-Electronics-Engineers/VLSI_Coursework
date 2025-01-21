// gates_tb.v - Testbench for the gates module


module gates_tb;

   reg a, b;
   
   // Outputs
   wire y1, y2, y3, y4, y5;

   gates uut (
      .a(a),
      .b(b),
      .y1(y1),
      .y2(y2),
      .y3(y3),
      .y4(y4),
      .y5(y5)
   );

   // Stimulus
   initial begin
      $monitor("Time=%0t a=%b b=%b y1=%b y2=%b y3=%b y4=%b y5=%b", $time, a, b, y1, y2, y3, y4, y5);
      
      // Test case 1: Both inputs are 0
      a = 1'b0;
      b = 1'b0;
      #200;

      // Test case 2: First input is 0, second input is 1
      a = 1'b0;
      b = 1'b1;
      #200;

      // Test case 3: First input is 1, second input is 0
      a = 1'b1;
      b = 1'b0;
      #200;

      // Test case 4: Both inputs are 1
      a = 1'b1;
      b = 1'b1;
      #200;
   
      // Stop simulation
      $stop;
   end
   
endmodule