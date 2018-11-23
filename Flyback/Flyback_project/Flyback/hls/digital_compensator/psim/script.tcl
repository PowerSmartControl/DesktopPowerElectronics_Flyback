############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project digital_compensator
set_top Dig_compensator
add_files digital_compensator/digital_compensator.c -cflags "-DDBG_MODE"
add_files -tb digital_compensator/digital_compensator_tb.c
open_solution "psim"
set_part {xc7z010clg400-1}
create_clock -period 10 -name default
source "./digital_compensator/psim/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl -tool xsim
export_design -format ip_catalog -description "Digital compensator for Flyback Board" -vendor "gfb" -library "flyback" -display_name "Dig_compensator"
