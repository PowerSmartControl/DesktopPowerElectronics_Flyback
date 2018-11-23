############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project PI_compensator
set_top PI_compensator
add_files PI_compensator/PI_compensator.c -cflags "-DDBG_MODE"
add_files -tb PI_compensator/PI_compensator_tb.c -cflags "-DDBG_MODE"
open_solution "dbg_mode"
set_part {xc7z010clg400-1}
create_clock -period 10 -name default
source "./PI_compensator/dbg_mode/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl -tool xsim
export_design -format ip_catalog -description "PI compensator for Flyback Board" -vendor "gfb" -library "flyback" -display_name "PI_compensator"
