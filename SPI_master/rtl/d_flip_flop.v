module D_FLIP_FLOP(
    d_in,
    clk_in,
    q_out,
    q_n_out
);

// Input and output definition
input d_in, clk_in;
output q_out, q_n_out;

// Register definition
reg data;

// Sequential logic: store 'data_in' value in 'data' register
always @(posedge clk_in)
    data = d_in;

// Combinational logic: assign 'q_out' and 'q_n_out'
assign q_out = data;
assign q_n_out = ~data;

endmodule
