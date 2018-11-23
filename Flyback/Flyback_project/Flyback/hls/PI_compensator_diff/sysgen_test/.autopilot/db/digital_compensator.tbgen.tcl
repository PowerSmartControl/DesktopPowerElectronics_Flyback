set C_TypeInfoList {{ 
"digital_compensator" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"v_ref": [[], {"scalar": "float"}] }, {"v_meas": [[],"0"] }, {"Kp": [[], {"scalar": "float"}] }, {"Ki2": [[], {"scalar": "float"}] }, {"u": [[],{ "pointer": "1"}] }],[],""], 
"0": [ "uint12", {"typedef": [[[], {"scalar": "uint12"}],""]}], 
"1": [ "uint10", {"typedef": [[[], {"scalar": "uint10"}],""]}]
}}
set moduleName digital_compensator
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {digital_compensator}
set C_modelType { void 0 }
set C_modelArgList { 
	{ v_ref float 32 regular  }
	{ v_meas uint 12 regular  }
	{ Kp float 32 regular  }
	{ Ki2 float 32 regular  }
	{ u int 10 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "v_ref", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "v_ref","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "v_meas", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY", "bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "v_meas","cData": "uint12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "Kp", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Kp","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "Ki2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Ki2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "u", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":9,"cElement": [{"cName": "u","cData": "uint10","bit_use": { "low": 0,"up": 9},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ v_ref sc_in sc_lv 32 signal 0 } 
	{ v_meas sc_in sc_lv 12 signal 1 } 
	{ Kp sc_in sc_lv 32 signal 2 } 
	{ Ki2 sc_in sc_lv 32 signal 3 } 
	{ u sc_out sc_lv 10 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "v_ref", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_ref", "role": "default" }} , 
 	{ "name": "v_meas", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "v_meas", "role": "default" }} , 
 	{ "name": "Kp", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Kp", "role": "default" }} , 
 	{ "name": "Ki2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Ki2", "role": "default" }} , 
 	{ "name": "u", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "u", "role": "default" }}  ]}
set Spec2ImplPortList { 
	v_ref { ap_none {  { v_ref in_data 0 32 } } }
	v_meas { ap_none {  { v_meas in_data 0 12 } } }
	Kp { ap_none {  { Kp in_data 0 32 } } }
	Ki2 { ap_none {  { Ki2 in_data 0 32 } } }
	u { ap_none {  { u out_data 1 10 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
