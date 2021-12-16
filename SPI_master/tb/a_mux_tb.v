module a_mux_tb;

    // DUT input registers
    reg a_data_reg, b_data_reg, sel_reg;

    // DUT output wires
    wire data_wire;

    // Instantiates mux
    A_MUX dut (
        .a_data_in(a_data_reg),
        .b_data_in(b_data_reg),
        .sel_in(sel_reg),
        .data_out(data_wire)
    );

    initial
        $monitor(
            $time,
            " a=%b; b%b; sel=%b; out=%b",
            a_data_reg,
            b_data_reg,
            sel_reg,
            data_wire
        );

    initial begin

        $dumpfile("./out/mux_a.vcd");

        $dumpvars(1, a_mux_tb);
        
        // Set intial values.
        #0; a_data_reg = 1'b0; b_data_reg = 1'b0; sel_reg = 1'b0;

        // Sets A input to 1 to check data output
        #10; a_data_reg = 1'b1; b_data_reg = 1'b0; sel_reg = 1'b0;

        // Sets A input to 0 to check data output
        #10; a_data_reg = 1'b0; b_data_reg = 1'b0; sel_reg = 1'b0;

        // Sets B input to 1 to check data output
        #10; a_data_reg = 1'b0; b_data_reg = 1'b1; sel_reg = 1'b1;

        // Sets B input to 0 to check data output
        #10; a_data_reg = 1'b0; b_data_reg = 1'b0; sel_reg = 1'b1;

        // Return to intial values
        #10; a_data_reg = 1'b0; b_data_reg = 1'b0; sel_reg = 1'b0;
    end

endmodule
