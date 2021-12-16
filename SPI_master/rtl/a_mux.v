module A_MUX (
    a_data_in,
    b_data_in,
    sel_in,
    data_out
);

// input and output definition
input a_data_in, b_data_in, sel_in;
output data_out;

// Combinational logic: mux behaviour
assign data_out = sel_in ? b_data_in:a_data_in;

endmodule
