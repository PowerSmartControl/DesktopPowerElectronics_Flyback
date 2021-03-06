// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.1
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdig_compensator.h"

extern XDig_compensator_Config XDig_compensator_ConfigTable[];

XDig_compensator_Config *XDig_compensator_LookupConfig(u16 DeviceId) {
	XDig_compensator_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDIG_COMPENSATOR_NUM_INSTANCES; Index++) {
		if (XDig_compensator_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDig_compensator_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDig_compensator_Initialize(XDig_compensator *InstancePtr, u16 DeviceId) {
	XDig_compensator_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDig_compensator_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDig_compensator_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

