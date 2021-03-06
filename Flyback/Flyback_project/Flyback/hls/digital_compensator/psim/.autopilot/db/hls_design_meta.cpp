#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("params_vRef", 32, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("params_a_0", 32, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("params_a_1", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("params_a_2", 32, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("params_a_3", 32, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("params_b_0", 32, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("params_b_1", 32, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("params_b_2", 32, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("params_b_3", 32, hls_in, 8, "ap_none", "in_data", 1),
	Port_Property("v_meas", 12, hls_in, 9, "ap_none", "in_data", 1),
	Port_Property("u", 10, hls_out, 10, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "Dig_compensator";
