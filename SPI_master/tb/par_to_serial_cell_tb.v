
`timescale 1ns/1ns

module par_to_serial_tb;

    // DUT input registers
    reg data_reg, prev_reg, enable_reg, clk_reg; 

    // DUT output wires
    wire data_wire;

    // DUT instantiation
    PAR_TO_SERIAL_CELL dut (
        .data_in(data_reg),
        .prev_in(prev_reg),
        .enable_in(enable_reg),
        .clk_in(clk_reg),
        .data_out(data_wire)
    );

    // Set monitor and initial value for clock
    initial begin
        $monitor($time);
        #0; clk_reg = 1'b0;
    end

    always begin
        #5; clk_reg = ~clk_reg;
    end 

    // Main simulation
    initial begin

        // Dump to file
        $dumpfile("./out/par_to_serial.vcd");

        // Store variables from testbench
        $dumpvars(1, par_to_serial_tb);

        // Set intial value
        #0; data_reg = 1'b0; prev_reg = 1'b0; enable_reg = 1'b0;

        // Enable circuit without change on output
        #10; data_reg = 1'b0; prev_reg = 1'b0; enable_reg = 1'b1;

        // Chenge previous value without change on output
        #10; data_reg = 1'b0; prev_reg = 1'b1; enable_reg = 1'b0;

        // Enable circuit and set previous value to drive output
        #10; data_reg = 1'b0; prev_reg = 1'b1; enable_reg = 1'b1;

        // Change data intput without enable. Output is set.
        #10; data_reg = 1'b1; prev_reg = 1'b0; enable_reg = 1'b0;

        // Enable circuit with data set. Output must be driven low.
        #10; data_reg = 1'b1; prev_reg = 1'b0; enable_reg = 1'b1;

        // Both inputs are set with output being also set
        #10; data_reg = 1'b1; prev_reg = 1'b1; enable_reg = 1'b0;

        // Enable circuit with data set. Output must be driver low
        #10; data_reg = 1'b1; prev_reg = 1'b0; enable_reg = 1'b1;

        // Set every input signal to drive output high
        #10; data_reg = 1'b1; prev_reg = 1'b1; enable_reg = 1'b1;

        // Return to intial values
        #10; data_reg = 1'b0; prev_reg = 1'b0; enable_reg = 1'b0;

        // Finish simulation
        #10; $finish;

    end

endmodule
