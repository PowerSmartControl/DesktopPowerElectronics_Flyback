#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("v_ref", 32, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("v_meas", 12, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("Kp", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("Ki2", 32, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("u", 10, hls_out, 4, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "digital_compensator";
