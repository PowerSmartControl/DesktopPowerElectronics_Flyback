############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project PI_compensator_diff
set_top PI_compensator_DiffEq
add_files PI_compensator_diff/PI_compensator_DiffEq.c -cflags "-DDBG_MODE"
add_files -tb PI_compensator_tb.c -cflags "-DDBG_MODE"
open_solution "external_ref"
set_part {xc7z010clg400-1}
create_clock -period 10 -name default
source "./PI_compensator_diff/external_ref/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl -tool xsim
export_design -format ip_catalog -description "PI compensator for Flyback Board (diff eq)" -vendor "gfb" -library "flyback" -display_name "PI_compensator_DiffEq"
