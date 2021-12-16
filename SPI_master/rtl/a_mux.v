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
assing data_out = (sel_in == 1'b0) ? a_data_in:b_data_in;

endmodule
