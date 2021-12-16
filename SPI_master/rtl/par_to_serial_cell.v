module PAR_TO_SERIAL_CELL (
    data_in,
    prev_in,
    enable_in,
    clk_in,
    data_out
);

// Input and output definition
input data_in, prev_in, enable_in, clk_in;
output data_out;

// Wire definition
wire mux_data;

// Submodule instantiation
A_MUX mux (
    .a_data_in(data_in),
    .b_data_in(prev_in),
    .sel_in(enable_in),
    .data_out(mux_data)
);

D_FLIP_FLOP data_ff (
    .d_in(mux_data),
    .clk_in(clk_in),
    .q_out(data_out),
    .q_n_out()
);

endmodule
