#! /bin/bash

iverilog -o out/a_mux ./rtl/a_mux.v ./tb/a_mux_tb.v
vvp out/a_mux
