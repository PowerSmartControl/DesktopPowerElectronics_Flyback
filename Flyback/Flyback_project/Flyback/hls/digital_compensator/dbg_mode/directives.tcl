############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode s_axilite -register "digital_compensator" Kp
set_directive_interface -mode s_axilite -register "digital_compensator" Ki2
set_directive_interface -mode ap_none "digital_compensator" u
set_directive_interface -mode s_axilite -register "digital_compensator" v_ref
set_directive_interface -mode s_axilite "digital_compensator" eDbg
set_directive_interface -mode s_axilite "digital_compensator" yDbg
set_directive_interface -mode s_axilite "digital_compensator" uDbg
set_directive_interface -mode s_axilite "digital_compensator" yVmeasDbg
set_directive_interface -mode ap_none -register "Dig_compensator" u
set_directive_interface -mode ap_none "Dig_compensator" v_meas
set_directive_interface -mode s_axilite "Dig_compensator" yDbg
set_directive_interface -mode s_axilite "Dig_compensator" eDbg
set_directive_interface -mode s_axilite "Dig_compensator" uDbg
set_directive_interface -mode s_axilite "Dig_compensator" yVmeasDbg
set_directive_interface -mode s_axilite "Dig_compensator" params.vRef
set_directive_interface -mode s_axilite "Dig_compensator" params.coef
set_directive_interface -mode s_axilite "Dig_compensator" params.y_max
set_directive_interface -mode s_axilite "Dig_compensator" params.adcMask
