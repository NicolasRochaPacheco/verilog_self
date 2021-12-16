#! /bin/bash

iverilog -o out/par_to_serial_cell ./rtl/a_mux.v ./rtl/d_flip_flop.v ./rtl/par_to_serial_cell.v ./tb/par_to_serial_cell_tb.v
vvp out/par_to_serial_cell
