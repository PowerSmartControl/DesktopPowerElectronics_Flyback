// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================

// AXILiteS
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of v_ref
//        bit 31~0 - v_ref[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of X_MAX
//        bit 9~0 - X_MAX[9:0] (Read/Write)
//        others  - reserved
// 0x1c : reserved
// 0x20 : Data signal of Kp
//        bit 31~0 - Kp[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of Ki2
//        bit 31~0 - Ki2[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of yVmeasDbg
//        bit 31~0 - yVmeasDbg[31:0] (Read)
// 0x34 : Control signal of yVmeasDbg
//        bit 0  - yVmeasDbg_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of yDbg
//        bit 31~0 - yDbg[31:0] (Read)
// 0x3c : Control signal of yDbg
//        bit 0  - yDbg_ap_vld (Read/COR)
//        others - reserved
// 0x40 : Data signal of eDbg
//        bit 31~0 - eDbg[31:0] (Read)
// 0x44 : Control signal of eDbg
//        bit 0  - eDbg_ap_vld (Read/COR)
//        others - reserved
// 0x48 : Data signal of uDbg
//        bit 9~0 - uDbg[9:0] (Read)
//        others  - reserved
// 0x4c : Control signal of uDbg
//        bit 0  - uDbg_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPI_COMPENSATOR_AXILITES_ADDR_V_REF_DATA     0x10
#define XPI_COMPENSATOR_AXILITES_BITS_V_REF_DATA     32
#define XPI_COMPENSATOR_AXILITES_ADDR_X_MAX_DATA     0x18
#define XPI_COMPENSATOR_AXILITES_BITS_X_MAX_DATA     10
#define XPI_COMPENSATOR_AXILITES_ADDR_KP_DATA        0x20
#define XPI_COMPENSATOR_AXILITES_BITS_KP_DATA        32
#define XPI_COMPENSATOR_AXILITES_ADDR_KI2_DATA       0x28
#define XPI_COMPENSATOR_AXILITES_BITS_KI2_DATA       32
#define XPI_COMPENSATOR_AXILITES_ADDR_YVMEASDBG_DATA 0x30
#define XPI_COMPENSATOR_AXILITES_BITS_YVMEASDBG_DATA 32
#define XPI_COMPENSATOR_AXILITES_ADDR_YVMEASDBG_CTRL 0x34
#define XPI_COMPENSATOR_AXILITES_ADDR_YDBG_DATA      0x38
#define XPI_COMPENSATOR_AXILITES_BITS_YDBG_DATA      32
#define XPI_COMPENSATOR_AXILITES_ADDR_YDBG_CTRL      0x3c
#define XPI_COMPENSATOR_AXILITES_ADDR_EDBG_DATA      0x40
#define XPI_COMPENSATOR_AXILITES_BITS_EDBG_DATA      32
#define XPI_COMPENSATOR_AXILITES_ADDR_EDBG_CTRL      0x44
#define XPI_COMPENSATOR_AXILITES_ADDR_UDBG_DATA      0x48
#define XPI_COMPENSATOR_AXILITES_BITS_UDBG_DATA      10
#define XPI_COMPENSATOR_AXILITES_ADDR_UDBG_CTRL      0x4c

