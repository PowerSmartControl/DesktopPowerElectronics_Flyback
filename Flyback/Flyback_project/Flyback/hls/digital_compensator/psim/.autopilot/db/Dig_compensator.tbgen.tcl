set C_TypeInfoList {{ 
"Dig_compensator" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"params": [[],"0"] }, {"v_meas": [[],"1"] }, {"u": [[],{ "pointer": "2"}] }],[],""], 
"1": [ "uint12", {"typedef": [[[], {"scalar": "uint12"}],""]}], 
"2": [ "uint10", {"typedef": [[[], {"scalar": "uint10"}],""]}], 
"0": [ "CtrlParam", {"typedef": [[[],"3"],""]}], 
"3": [ "", {"struct": [[],[],[{ "vRef": [[],  {"scalar": "float"}]},{ "a": [[],  {"array": [ {"scalar": "float"}, [4]]}]},{ "b": [[],  {"array": [ {"scalar": "float"}, [4]]}]}],""]}]
}}
set moduleName Dig_compensator
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {Dig_compensator}
set C_modelType { void 0 }
set C_modelArgList { 
	{ params_vRef float 32 regular  }
	{ params_a_0 float 32 unused  }
	{ params_a_1 float 32 regular  }
	{ params_a_2 float 32 regular  }
	{ params_a_3 float 32 regular  }
	{ params_b_0 float 32 regular  }
	{ params_b_1 float 32 regular  }
	{ params_b_2 float 32 regular  }
	{ params_b_3 float 32 regular  }
	{ v_meas uint 12 regular  }
	{ u int 10 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "params_vRef", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.vRef","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "params_a_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.a","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "params_a_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.a","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "params_a_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.a","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "params_a_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.a","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "params_b_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.b","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "params_b_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.b","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "params_b_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.b","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "params_b_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "params.b","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "v_meas", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY", "bitSlice":[{"low":0,"up":11,"cElement": [{"cName": "v_meas","cData": "uint12","bit_use": { "low": 0,"up": 11},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "u", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":9,"cElement": [{"cName": "u","cData": "uint10","bit_use": { "low": 0,"up": 9},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ params_vRef sc_in sc_lv 32 signal 0 } 
	{ params_a_0 sc_in sc_lv 32 signal 1 } 
	{ params_a_1 sc_in sc_lv 32 signal 2 } 
	{ params_a_2 sc_in sc_lv 32 signal 3 } 
	{ params_a_3 sc_in sc_lv 32 signal 4 } 
	{ params_b_0 sc_in sc_lv 32 signal 5 } 
	{ params_b_1 sc_in sc_lv 32 signal 6 } 
	{ params_b_2 sc_in sc_lv 32 signal 7 } 
	{ params_b_3 sc_in sc_lv 32 signal 8 } 
	{ v_meas sc_in sc_lv 12 signal 9 } 
	{ u sc_out sc_lv 10 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "params_vRef", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_vRef", "role": "default" }} , 
 	{ "name": "params_a_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_a_0", "role": "default" }} , 
 	{ "name": "params_a_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_a_1", "role": "default" }} , 
 	{ "name": "params_a_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_a_2", "role": "default" }} , 
 	{ "name": "params_a_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_a_3", "role": "default" }} , 
 	{ "name": "params_b_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_b_0", "role": "default" }} , 
 	{ "name": "params_b_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_b_1", "role": "default" }} , 
 	{ "name": "params_b_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_b_2", "role": "default" }} , 
 	{ "name": "params_b_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "params_b_3", "role": "default" }} , 
 	{ "name": "v_meas", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "v_meas", "role": "default" }} , 
 	{ "name": "u", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "u", "role": "default" }}  ]}
set Spec2ImplPortList { 
	params_vRef { ap_none {  { params_vRef in_data 0 32 } } }
	params_a_0 { ap_none {  { params_a_0 in_data 0 32 } } }
	params_a_1 { ap_none {  { params_a_1 in_data 0 32 } } }
	params_a_2 { ap_none {  { params_a_2 in_data 0 32 } } }
	params_a_3 { ap_none {  { params_a_3 in_data 0 32 } } }
	params_b_0 { ap_none {  { params_b_0 in_data 0 32 } } }
	params_b_1 { ap_none {  { params_b_1 in_data 0 32 } } }
	params_b_2 { ap_none {  { params_b_2 in_data 0 32 } } }
	params_b_3 { ap_none {  { params_b_3 in_data 0 32 } } }
	v_meas { ap_none {  { v_meas in_data 0 12 } } }
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
