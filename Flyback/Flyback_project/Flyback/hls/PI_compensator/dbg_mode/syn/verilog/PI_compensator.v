// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="PI_compensator,hls_ip_2015_4,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.256000,HLS_SYN_LAT=23,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=5,HLS_SYN_FF=1526,HLS_SYN_LUT=2955}" *)

module PI_compensator (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        v_meas,
        u,
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 33'b1;
parameter    ap_ST_st2_fsm_1 = 33'b10;
parameter    ap_ST_st3_fsm_2 = 33'b100;
parameter    ap_ST_st4_fsm_3 = 33'b1000;
parameter    ap_ST_st5_fsm_4 = 33'b10000;
parameter    ap_ST_st6_fsm_5 = 33'b100000;
parameter    ap_ST_st7_fsm_6 = 33'b1000000;
parameter    ap_ST_st8_fsm_7 = 33'b10000000;
parameter    ap_ST_st9_fsm_8 = 33'b100000000;
parameter    ap_ST_st10_fsm_9 = 33'b1000000000;
parameter    ap_ST_st11_fsm_10 = 33'b10000000000;
parameter    ap_ST_st12_fsm_11 = 33'b100000000000;
parameter    ap_ST_st13_fsm_12 = 33'b1000000000000;
parameter    ap_ST_st14_fsm_13 = 33'b10000000000000;
parameter    ap_ST_st15_fsm_14 = 33'b100000000000000;
parameter    ap_ST_st16_fsm_15 = 33'b1000000000000000;
parameter    ap_ST_st17_fsm_16 = 33'b10000000000000000;
parameter    ap_ST_st18_fsm_17 = 33'b100000000000000000;
parameter    ap_ST_st19_fsm_18 = 33'b1000000000000000000;
parameter    ap_ST_st20_fsm_19 = 33'b10000000000000000000;
parameter    ap_ST_st21_fsm_20 = 33'b100000000000000000000;
parameter    ap_ST_st22_fsm_21 = 33'b1000000000000000000000;
parameter    ap_ST_st23_fsm_22 = 33'b10000000000000000000000;
parameter    ap_ST_st24_fsm_23 = 33'b100000000000000000000000;
parameter    ap_ST_st25_fsm_24 = 33'b1000000000000000000000000;
parameter    ap_ST_st26_fsm_25 = 33'b10000000000000000000000000;
parameter    ap_ST_st27_fsm_26 = 33'b100000000000000000000000000;
parameter    ap_ST_st28_fsm_27 = 33'b1000000000000000000000000000;
parameter    ap_ST_st29_fsm_28 = 33'b10000000000000000000000000000;
parameter    ap_ST_st30_fsm_29 = 33'b100000000000000000000000000000;
parameter    ap_ST_st31_fsm_30 = 33'b1000000000000000000000000000000;
parameter    ap_ST_st32_fsm_31 = 33'b10000000000000000000000000000000;
parameter    ap_ST_st33_fsm_32 = 33'b100000000000000000000000000000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv2_0 = 2'b00;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    ap_const_int64_8 = 8;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 7;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv32_17 = 32'b10111;
parameter    ap_const_lv32_15 = 32'b10101;
parameter    ap_const_lv32_1C = 32'b11100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_A = 32'b1010;
parameter    ap_const_lv32_B = 32'b1011;
parameter    ap_const_lv32_C = 32'b1100;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_11 = 32'b10001;
parameter    ap_const_lv32_16 = 32'b10110;
parameter    ap_const_lv32_1D = 32'b11101;
parameter    ap_const_lv32_1E = 32'b11110;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv32_18 = 32'b11000;
parameter    ap_const_lv32_D = 32'b1101;
parameter    ap_const_lv32_14 = 32'b10100;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv8_FF = 8'b11111111;
parameter    ap_const_lv23_0 = 23'b00000000000000000000000;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv2_3 = 2'b11;
parameter    ap_const_lv9_181 = 9'b110000001;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv8_7F = 8'b1111111;
parameter    ap_const_lv5_4 = 5'b100;
parameter    ap_const_lv5_2 = 5'b10;
parameter    ap_true = 1'b1;
parameter    C_S_AXI_AXILITES_WSTRB_WIDTH = (C_S_AXI_AXILITES_DATA_WIDTH / ap_const_int64_8);
parameter    C_S_AXI_WSTRB_WIDTH = (C_S_AXI_DATA_WIDTH / ap_const_int64_8);

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [11:0] v_meas;
output  [9:0] u;
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1 : 0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [32:0] ap_CS_fsm = 33'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_51;
wire   [31:0] v_ref;
wire   [9:0] X_MAX;
wire   [31:0] Kp;
wire   [31:0] Ki2;
wire   [31:0] yVmeasDbg;
reg    yVmeasDbg_ap_vld;
wire   [31:0] yDbg;
reg    yDbg_ap_vld;
wire   [31:0] eDbg;
reg    eDbg_ap_vld;
wire   [9:0] uDbg;
reg    uDbg_ap_vld;
reg   [1:0] sat = 2'b00;
reg   [31:0] x_integral = 32'b00000000000000000000000000000000;
wire    PI_compensator_AXILiteS_s_axi_U_ap_dummy_ce;
wire   [31:0] grp_fu_173_p2;
reg   [31:0] reg_189;
reg    ap_sig_cseq_ST_st17_fsm_16;
reg    ap_sig_bdd_117;
reg    ap_sig_cseq_ST_st24_fsm_23;
reg    ap_sig_bdd_124;
wire   [31:0] grp_fu_168_p2;
reg   [31:0] reg_195;
reg    ap_sig_cseq_ST_st22_fsm_21;
reg    ap_sig_bdd_134;
reg    ap_sig_cseq_ST_st29_fsm_28;
reg    ap_sig_bdd_141;
wire   [31:0] y1_fu_201_p1;
wire   [31:0] grp_fu_177_p1;
reg   [31:0] y_reg_652;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_bdd_156;
reg   [31:0] Ki2_read_reg_659;
reg    ap_sig_cseq_ST_st7_fsm_6;
reg    ap_sig_bdd_165;
reg   [31:0] Kp_read_reg_664;
reg   [9:0] X_MAX_read_reg_669;
reg   [31:0] e_reg_679;
reg    ap_sig_cseq_ST_st11_fsm_10;
reg    ap_sig_bdd_179;
wire   [0:0] grp_fu_180_p2;
reg   [0:0] tmp_8_reg_687;
reg    ap_sig_cseq_ST_st12_fsm_11;
reg    ap_sig_bdd_188;
wire   [31:0] tmp_fu_206_p1;
reg   [31:0] tmp_reg_692;
reg    ap_sig_cseq_ST_st13_fsm_12;
reg    ap_sig_bdd_197;
wire   [0:0] or_cond_fu_261_p2;
reg   [0:0] or_cond_reg_697;
wire   [0:0] tmp_2_fu_267_p2;
reg   [0:0] tmp_2_reg_701;
wire   [0:0] tmp_11_fu_273_p2;
reg   [0:0] tmp_11_reg_706;
reg    ap_sig_cseq_ST_st18_fsm_17;
reg    ap_sig_bdd_215;
reg   [31:0] tmp_7_reg_719;
wire   [0:0] tmp_16_fu_324_p2;
reg   [0:0] tmp_16_reg_728;
reg    ap_sig_cseq_ST_st23_fsm_22;
reg    ap_sig_bdd_225;
wire   [0:0] tmp_18_fu_359_p2;
reg   [0:0] tmp_18_reg_735;
wire   [0:0] tmp_22_fu_371_p2;
reg   [0:0] tmp_22_reg_740;
wire   [31:0] x_integral_new_fu_394_p3;
reg   [31:0] x_integral_new_reg_745;
wire   [0:0] tmp_27_fu_460_p2;
reg   [0:0] tmp_27_reg_750;
reg    ap_sig_cseq_ST_st30_fsm_29;
reg    ap_sig_bdd_240;
wire   [31:0] x_1_fu_466_p3;
reg   [31:0] x_1_reg_755;
reg    ap_sig_cseq_ST_st31_fsm_30;
reg    ap_sig_bdd_249;
reg   [0:0] tmp_32_reg_761;
wire   [31:0] x_1_tmp_7_fu_519_p3;
reg    ap_sig_cseq_ST_st32_fsm_31;
reg    ap_sig_bdd_259;
reg   [31:0] x_assign_reg_157;
wire   [1:0] storemerge1_fu_405_p3;
wire   [9:0] tmp_37_fu_637_p3;
reg    ap_sig_cseq_ST_st33_fsm_32;
reg    ap_sig_bdd_274;
reg   [31:0] grp_fu_168_p0;
reg   [31:0] grp_fu_168_p1;
reg    ap_sig_cseq_ST_st25_fsm_24;
reg    ap_sig_bdd_283;
reg   [31:0] grp_fu_173_p1;
reg    ap_sig_cseq_ST_st14_fsm_13;
reg    ap_sig_bdd_292;
reg    ap_sig_cseq_ST_st21_fsm_20;
reg    ap_sig_bdd_299;
reg   [31:0] grp_fu_177_p0;
reg   [31:0] grp_fu_180_p0;
reg   [31:0] grp_fu_180_p1;
wire   [31:0] e_to_int_fu_221_p1;
wire   [7:0] tmp_1_fu_224_p4;
wire   [22:0] tmp_14_fu_234_p1;
wire   [0:0] notrhs_fu_244_p2;
wire   [0:0] notlhs_fu_238_p2;
wire   [0:0] tmp_6_fu_250_p2;
wire   [0:0] tmp_3_fu_213_p3;
wire   [0:0] tmp_9_fu_256_p2;
wire   [31:0] tmp_5_to_int_fu_288_p1;
wire   [7:0] tmp_12_fu_292_p4;
wire   [22:0] tmp_19_fu_302_p1;
wire   [0:0] notrhs2_fu_312_p2;
wire   [0:0] notlhs2_fu_306_p2;
wire   [0:0] tmp_13_fu_318_p2;
wire   [31:0] tmp_7_to_int_fu_330_p1;
wire   [7:0] tmp_17_fu_333_p4;
wire   [22:0] tmp_25_fu_343_p1;
wire   [0:0] notrhs4_fu_353_p2;
wire   [0:0] notlhs4_fu_347_p2;
wire   [0:0] tmp_20_fu_365_p2;
wire   [0:0] tmp_21_fu_185_p2;
wire   [0:0] sel_tmp_fu_377_p2;
wire   [0:0] sel_tmp1_fu_382_p2;
wire   [31:0] sel_tmp2_fu_387_p3;
wire   [1:0] sel_tmp6_cast_fu_401_p1;
wire   [31:0] x_to_int_fu_424_p1;
wire   [7:0] tmp_23_fu_428_p4;
wire   [22:0] tmp_30_fu_438_p1;
wire   [0:0] notrhs5_fu_448_p2;
wire   [0:0] notlhs5_fu_442_p2;
wire   [0:0] tmp_24_fu_454_p2;
wire   [31:0] x_1_to_int_fu_474_p1;
wire   [7:0] tmp_28_fu_477_p4;
wire   [22:0] tmp_35_fu_487_p1;
wire   [0:0] notrhs6_fu_497_p2;
wire   [0:0] notlhs6_fu_491_p2;
wire   [0:0] tmp_29_fu_503_p2;
wire   [0:0] tmp_31_fu_509_p2;
wire   [0:0] tmp_33_fu_514_p2;
wire   [31:0] p_Val2_s_fu_525_p1;
wire   [22:0] loc_V_1_fu_539_p1;
wire   [23:0] p_Result_s_fu_543_p3;
wire   [7:0] loc_V_fu_529_p4;
wire   [8:0] tmp_i_i_i_cast8_fu_555_p1;
wire   [8:0] sh_assign_fu_559_p2;
wire   [7:0] tmp_4_i_i_fu_573_p2;
wire   [0:0] isNeg_fu_565_p3;
wire  signed [8:0] tmp_4_i_i_cast_fu_579_p1;
wire   [8:0] sh_assign_1_fu_583_p3;
wire  signed [31:0] sh_assign_1_cast_fu_591_p1;
wire  signed [23:0] sh_assign_1_cast_cast_fu_595_p1;
wire   [61:0] tmp_2_i_i_fu_551_p1;
wire   [61:0] tmp_6_i_i_fu_599_p1;
wire   [23:0] tmp_7_i_i_fu_603_p2;
wire   [0:0] tmp_41_fu_615_p3;
wire   [61:0] tmp_9_i_i_fu_609_p2;
wire   [9:0] tmp_34_fu_623_p1;
wire   [9:0] tmp_36_fu_627_p4;
reg   [1:0] grp_fu_168_opcode;
wire    grp_fu_168_ce;
wire    grp_fu_173_ce;
wire    grp_fu_177_ce;
reg   [4:0] grp_fu_180_opcode;
wire   [4:0] tmp_21_fu_185_opcode;
wire   [0:0] or_cond2_fu_279_p2;
reg   [32:0] ap_NS_fsm;


PI_compensator_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
PI_compensator_AXILiteS_s_axi_U(
    .AWVALID( s_axi_AXILiteS_AWVALID ),
    .AWREADY( s_axi_AXILiteS_AWREADY ),
    .AWADDR( s_axi_AXILiteS_AWADDR ),
    .WVALID( s_axi_AXILiteS_WVALID ),
    .WREADY( s_axi_AXILiteS_WREADY ),
    .WDATA( s_axi_AXILiteS_WDATA ),
    .WSTRB( s_axi_AXILiteS_WSTRB ),
    .ARVALID( s_axi_AXILiteS_ARVALID ),
    .ARREADY( s_axi_AXILiteS_ARREADY ),
    .ARADDR( s_axi_AXILiteS_ARADDR ),
    .RVALID( s_axi_AXILiteS_RVALID ),
    .RREADY( s_axi_AXILiteS_RREADY ),
    .RDATA( s_axi_AXILiteS_RDATA ),
    .RRESP( s_axi_AXILiteS_RRESP ),
    .BVALID( s_axi_AXILiteS_BVALID ),
    .BREADY( s_axi_AXILiteS_BREADY ),
    .BRESP( s_axi_AXILiteS_BRESP ),
    .ACLK( ap_clk ),
    .ARESET( ap_rst_n_inv ),
    .ACLK_EN( PI_compensator_AXILiteS_s_axi_U_ap_dummy_ce ),
    .v_ref( v_ref ),
    .X_MAX( X_MAX ),
    .Kp( Kp ),
    .Ki2( Ki2 ),
    .yVmeasDbg( yVmeasDbg ),
    .yVmeasDbg_ap_vld( yVmeasDbg_ap_vld ),
    .yDbg( yDbg ),
    .yDbg_ap_vld( yDbg_ap_vld ),
    .eDbg( eDbg ),
    .eDbg_ap_vld( eDbg_ap_vld ),
    .uDbg( uDbg ),
    .uDbg_ap_vld( uDbg_ap_vld )
);

PI_compensator_faddfsub_32ns_32ns_32_5_full_dsp #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
PI_compensator_faddfsub_32ns_32ns_32_5_full_dsp_U0(
    .clk( ap_clk ),
    .reset( ap_rst_n_inv ),
    .din0( grp_fu_168_p0 ),
    .din1( grp_fu_168_p1 ),
    .opcode( grp_fu_168_opcode ),
    .ce( grp_fu_168_ce ),
    .dout( grp_fu_168_p2 )
);

PI_compensator_fmul_32ns_32ns_32_4_max_dsp #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
PI_compensator_fmul_32ns_32ns_32_4_max_dsp_U1(
    .clk( ap_clk ),
    .reset( ap_rst_n_inv ),
    .din0( e_reg_679 ),
    .din1( grp_fu_173_p1 ),
    .ce( grp_fu_173_ce ),
    .dout( grp_fu_173_p2 )
);

PI_compensator_sitofp_32ns_32_6 #(
    .ID( 1 ),
    .NUM_STAGE( 6 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
PI_compensator_sitofp_32ns_32_6_U2(
    .clk( ap_clk ),
    .reset( ap_rst_n_inv ),
    .din0( grp_fu_177_p0 ),
    .ce( grp_fu_177_ce ),
    .dout( grp_fu_177_p1 )
);

PI_compensator_fcmp_32ns_32ns_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
PI_compensator_fcmp_32ns_32ns_1_1_U3(
    .din0( grp_fu_180_p0 ),
    .din1( grp_fu_180_p1 ),
    .opcode( grp_fu_180_opcode ),
    .dout( grp_fu_180_p2 )
);

PI_compensator_fcmp_32ns_32ns_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
PI_compensator_fcmp_32ns_32ns_1_1_U4(
    .din0( reg_195 ),
    .din1( tmp_7_reg_719 ),
    .opcode( tmp_21_fu_185_opcode ),
    .dout( tmp_21_fu_185_p2 )
);



always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        Ki2_read_reg_659 <= Ki2;
        Kp_read_reg_664 <= Kp;
        X_MAX_read_reg_669 <= X_MAX;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        e_reg_679 <= grp_fu_168_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12)) begin
        or_cond_reg_697 <= or_cond_fu_261_p2;
        tmp_reg_692[9 : 0] <= tmp_fu_206_p1[9 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st17_fsm_16) | (ap_const_logic_1 == ap_sig_cseq_ST_st24_fsm_23))) begin
        reg_189 <= grp_fu_173_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21) | (ap_const_logic_1 == ap_sig_cseq_ST_st29_fsm_28))) begin
        reg_195 <= grp_fu_168_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st24_fsm_23)) begin
        sat <= storemerge1_fu_405_p3;
        x_integral <= x_integral_new_fu_394_p3;
        x_integral_new_reg_745 <= x_integral_new_fu_394_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12) & (or_cond_fu_261_p2 == ap_const_lv1_0))) begin
        tmp_11_reg_706 <= tmp_11_fu_273_p2;
        tmp_2_reg_701 <= tmp_2_fu_267_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st23_fsm_22)) begin
        tmp_16_reg_728 <= tmp_16_fu_324_p2;
        tmp_18_reg_735 <= tmp_18_fu_359_p2;
        tmp_22_reg_740 <= tmp_22_fu_371_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st30_fsm_29)) begin
        tmp_27_reg_750 <= tmp_27_fu_460_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st31_fsm_30)) begin
        tmp_32_reg_761 <= grp_fu_180_p2;
        x_1_reg_755 <= x_1_fu_466_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21)) begin
        tmp_7_reg_719 <= grp_fu_177_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11)) begin
        tmp_8_reg_687 <= grp_fu_180_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st32_fsm_31)) begin
        x_assign_reg_157 <= x_1_tmp_7_fu_519_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        y_reg_652 <= grp_fu_177_p1;
    end
end

always @ (ap_sig_cseq_ST_st33_fsm_32) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st33_fsm_32)) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st33_fsm_32) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st33_fsm_32)) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_179) begin
    if (ap_sig_bdd_179) begin
        ap_sig_cseq_ST_st11_fsm_10 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st11_fsm_10 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_188) begin
    if (ap_sig_bdd_188) begin
        ap_sig_cseq_ST_st12_fsm_11 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st12_fsm_11 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_197) begin
    if (ap_sig_bdd_197) begin
        ap_sig_cseq_ST_st13_fsm_12 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st13_fsm_12 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_292) begin
    if (ap_sig_bdd_292) begin
        ap_sig_cseq_ST_st14_fsm_13 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st14_fsm_13 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_117) begin
    if (ap_sig_bdd_117) begin
        ap_sig_cseq_ST_st17_fsm_16 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st17_fsm_16 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_215) begin
    if (ap_sig_bdd_215) begin
        ap_sig_cseq_ST_st18_fsm_17 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st18_fsm_17 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_51) begin
    if (ap_sig_bdd_51) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_299) begin
    if (ap_sig_bdd_299) begin
        ap_sig_cseq_ST_st21_fsm_20 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st21_fsm_20 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_134) begin
    if (ap_sig_bdd_134) begin
        ap_sig_cseq_ST_st22_fsm_21 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st22_fsm_21 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_225) begin
    if (ap_sig_bdd_225) begin
        ap_sig_cseq_ST_st23_fsm_22 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st23_fsm_22 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_124) begin
    if (ap_sig_bdd_124) begin
        ap_sig_cseq_ST_st24_fsm_23 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st24_fsm_23 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_283) begin
    if (ap_sig_bdd_283) begin
        ap_sig_cseq_ST_st25_fsm_24 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st25_fsm_24 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_141) begin
    if (ap_sig_bdd_141) begin
        ap_sig_cseq_ST_st29_fsm_28 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st29_fsm_28 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_240) begin
    if (ap_sig_bdd_240) begin
        ap_sig_cseq_ST_st30_fsm_29 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st30_fsm_29 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_249) begin
    if (ap_sig_bdd_249) begin
        ap_sig_cseq_ST_st31_fsm_30 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st31_fsm_30 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_259) begin
    if (ap_sig_bdd_259) begin
        ap_sig_cseq_ST_st32_fsm_31 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st32_fsm_31 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_274) begin
    if (ap_sig_bdd_274) begin
        ap_sig_cseq_ST_st33_fsm_32 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st33_fsm_32 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_156) begin
    if (ap_sig_bdd_156) begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_165) begin
    if (ap_sig_bdd_165) begin
        ap_sig_cseq_ST_st7_fsm_6 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st7_fsm_6 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st33_fsm_32) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st33_fsm_32)) begin
        eDbg_ap_vld = ap_const_logic_1;
    end else begin
        eDbg_ap_vld = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st18_fsm_17 or ap_sig_cseq_ST_st25_fsm_24) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        grp_fu_168_opcode = ap_const_lv2_1;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st18_fsm_17) | (ap_const_logic_1 == ap_sig_cseq_ST_st25_fsm_24))) begin
        grp_fu_168_opcode = ap_const_lv2_0;
    end else begin
        grp_fu_168_opcode = 'bx;
    end
end

always @ (v_ref or x_integral or reg_189 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st18_fsm_17 or ap_sig_cseq_ST_st25_fsm_24) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st25_fsm_24)) begin
        grp_fu_168_p0 = reg_189;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st18_fsm_17)) begin
        grp_fu_168_p0 = x_integral;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        grp_fu_168_p0 = v_ref;
    end else begin
        grp_fu_168_p0 = 'bx;
    end
end

always @ (reg_189 or y_reg_652 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st18_fsm_17 or x_integral_new_reg_745 or ap_sig_cseq_ST_st25_fsm_24) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st25_fsm_24)) begin
        grp_fu_168_p1 = x_integral_new_reg_745;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st18_fsm_17)) begin
        grp_fu_168_p1 = reg_189;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        grp_fu_168_p1 = y_reg_652;
    end else begin
        grp_fu_168_p1 = 'bx;
    end
end

always @ (Ki2_read_reg_659 or Kp_read_reg_664 or ap_sig_cseq_ST_st14_fsm_13 or ap_sig_cseq_ST_st21_fsm_20) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20)) begin
        grp_fu_173_p1 = Kp_read_reg_664;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st14_fsm_13)) begin
        grp_fu_173_p1 = Ki2_read_reg_659;
    end else begin
        grp_fu_173_p1 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st17_fsm_16 or y1_fu_201_p1 or tmp_reg_692) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st17_fsm_16)) begin
        grp_fu_177_p0 = tmp_reg_692;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        grp_fu_177_p0 = y1_fu_201_p1;
    end else begin
        grp_fu_177_p0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st12_fsm_11 or ap_sig_cseq_ST_st13_fsm_12 or or_cond_fu_261_p2 or ap_sig_cseq_ST_st23_fsm_22 or ap_sig_cseq_ST_st30_fsm_29 or ap_sig_cseq_ST_st31_fsm_30) begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12) & (or_cond_fu_261_p2 == ap_const_lv1_0)) | (ap_const_logic_1 == ap_sig_cseq_ST_st30_fsm_29))) begin
        grp_fu_180_opcode = ap_const_lv5_2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11) | (ap_const_logic_1 == ap_sig_cseq_ST_st23_fsm_22) | (ap_const_logic_1 == ap_sig_cseq_ST_st31_fsm_30))) begin
        grp_fu_180_opcode = ap_const_lv5_4;
    end else begin
        grp_fu_180_opcode = 'bx;
    end
end

always @ (reg_195 or e_reg_679 or ap_sig_cseq_ST_st12_fsm_11 or ap_sig_cseq_ST_st13_fsm_12 or ap_sig_cseq_ST_st23_fsm_22 or ap_sig_cseq_ST_st30_fsm_29 or x_1_fu_466_p3 or ap_sig_cseq_ST_st31_fsm_30) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st31_fsm_30)) begin
        grp_fu_180_p0 = x_1_fu_466_p3;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st23_fsm_22) | (ap_const_logic_1 == ap_sig_cseq_ST_st30_fsm_29))) begin
        grp_fu_180_p0 = reg_195;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11) | (ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12))) begin
        grp_fu_180_p0 = e_reg_679;
    end else begin
        grp_fu_180_p0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st12_fsm_11 or ap_sig_cseq_ST_st13_fsm_12 or tmp_7_reg_719 or ap_sig_cseq_ST_st23_fsm_22 or ap_sig_cseq_ST_st30_fsm_29 or ap_sig_cseq_ST_st31_fsm_30) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st31_fsm_30)) begin
        grp_fu_180_p1 = tmp_7_reg_719;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11) | (ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12) | (ap_const_logic_1 == ap_sig_cseq_ST_st23_fsm_22) | (ap_const_logic_1 == ap_sig_cseq_ST_st30_fsm_29))) begin
        grp_fu_180_p1 = ap_const_lv32_0;
    end else begin
        grp_fu_180_p1 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st33_fsm_32) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st33_fsm_32)) begin
        uDbg_ap_vld = ap_const_logic_1;
    end else begin
        uDbg_ap_vld = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st33_fsm_32) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st33_fsm_32)) begin
        yDbg_ap_vld = ap_const_logic_1;
    end else begin
        yDbg_ap_vld = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st33_fsm_32) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st33_fsm_32)) begin
        yVmeasDbg_ap_vld = ap_const_logic_1;
    end else begin
        yVmeasDbg_ap_vld = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm or or_cond_reg_697 or or_cond2_fu_279_p2) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            ap_NS_fsm = ap_ST_st3_fsm_2;
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st4_fsm_3;
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st6_fsm_5 : 
        begin
            ap_NS_fsm = ap_ST_st7_fsm_6;
        end
        ap_ST_st7_fsm_6 : 
        begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st8_fsm_7 : 
        begin
            ap_NS_fsm = ap_ST_st9_fsm_8;
        end
        ap_ST_st9_fsm_8 : 
        begin
            ap_NS_fsm = ap_ST_st10_fsm_9;
        end
        ap_ST_st10_fsm_9 : 
        begin
            ap_NS_fsm = ap_ST_st11_fsm_10;
        end
        ap_ST_st11_fsm_10 : 
        begin
            ap_NS_fsm = ap_ST_st12_fsm_11;
        end
        ap_ST_st12_fsm_11 : 
        begin
            ap_NS_fsm = ap_ST_st13_fsm_12;
        end
        ap_ST_st13_fsm_12 : 
        begin
            ap_NS_fsm = ap_ST_st14_fsm_13;
        end
        ap_ST_st14_fsm_13 : 
        begin
            if ((~(or_cond_reg_697 == ap_const_lv1_0) | ~(ap_const_lv1_0 == or_cond2_fu_279_p2))) begin
                ap_NS_fsm = ap_ST_st33_fsm_32;
            end else begin
                ap_NS_fsm = ap_ST_st15_fsm_14;
            end
        end
        ap_ST_st15_fsm_14 : 
        begin
            ap_NS_fsm = ap_ST_st16_fsm_15;
        end
        ap_ST_st16_fsm_15 : 
        begin
            ap_NS_fsm = ap_ST_st17_fsm_16;
        end
        ap_ST_st17_fsm_16 : 
        begin
            ap_NS_fsm = ap_ST_st18_fsm_17;
        end
        ap_ST_st18_fsm_17 : 
        begin
            ap_NS_fsm = ap_ST_st19_fsm_18;
        end
        ap_ST_st19_fsm_18 : 
        begin
            ap_NS_fsm = ap_ST_st20_fsm_19;
        end
        ap_ST_st20_fsm_19 : 
        begin
            ap_NS_fsm = ap_ST_st21_fsm_20;
        end
        ap_ST_st21_fsm_20 : 
        begin
            ap_NS_fsm = ap_ST_st22_fsm_21;
        end
        ap_ST_st22_fsm_21 : 
        begin
            ap_NS_fsm = ap_ST_st23_fsm_22;
        end
        ap_ST_st23_fsm_22 : 
        begin
            ap_NS_fsm = ap_ST_st24_fsm_23;
        end
        ap_ST_st24_fsm_23 : 
        begin
            ap_NS_fsm = ap_ST_st25_fsm_24;
        end
        ap_ST_st25_fsm_24 : 
        begin
            ap_NS_fsm = ap_ST_st26_fsm_25;
        end
        ap_ST_st26_fsm_25 : 
        begin
            ap_NS_fsm = ap_ST_st27_fsm_26;
        end
        ap_ST_st27_fsm_26 : 
        begin
            ap_NS_fsm = ap_ST_st28_fsm_27;
        end
        ap_ST_st28_fsm_27 : 
        begin
            ap_NS_fsm = ap_ST_st29_fsm_28;
        end
        ap_ST_st29_fsm_28 : 
        begin
            ap_NS_fsm = ap_ST_st30_fsm_29;
        end
        ap_ST_st30_fsm_29 : 
        begin
            ap_NS_fsm = ap_ST_st31_fsm_30;
        end
        ap_ST_st31_fsm_30 : 
        begin
            ap_NS_fsm = ap_ST_st32_fsm_31;
        end
        ap_ST_st32_fsm_31 : 
        begin
            ap_NS_fsm = ap_ST_st33_fsm_32;
        end
        ap_ST_st33_fsm_32 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


assign PI_compensator_AXILiteS_s_axi_U_ap_dummy_ce = ap_const_logic_1;


always @ (ap_rst_n) begin
    ap_rst_n_inv = ~ap_rst_n;
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_117 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_10]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_124 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_17]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_134 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_15]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_141 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1C]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_156 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_5]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_165 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_6]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_179 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_A]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_188 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_B]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_197 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_C]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_215 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_11]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_225 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_16]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_240 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1D]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_249 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1E]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_259 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1F]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_274 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_20]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_283 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_18]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_292 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_D]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_299 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_14]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_51 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

assign eDbg = e_reg_679;

assign e_to_int_fu_221_p1 = e_reg_679;

assign grp_fu_168_ce = ap_const_logic_1;

assign grp_fu_173_ce = ap_const_logic_1;

assign grp_fu_177_ce = ap_const_logic_1;

assign isNeg_fu_565_p3 = sh_assign_fu_559_p2[ap_const_lv32_8];

assign loc_V_1_fu_539_p1 = p_Val2_s_fu_525_p1[22:0];

assign loc_V_fu_529_p4 = {{p_Val2_s_fu_525_p1[ap_const_lv32_1E : ap_const_lv32_17]}};

assign notlhs2_fu_306_p2 = (tmp_12_fu_292_p4 != ap_const_lv8_FF? 1'b1: 1'b0);

assign notlhs4_fu_347_p2 = (tmp_17_fu_333_p4 != ap_const_lv8_FF? 1'b1: 1'b0);

assign notlhs5_fu_442_p2 = (tmp_23_fu_428_p4 != ap_const_lv8_FF? 1'b1: 1'b0);

assign notlhs6_fu_491_p2 = (tmp_28_fu_477_p4 != ap_const_lv8_FF? 1'b1: 1'b0);

assign notlhs_fu_238_p2 = (tmp_1_fu_224_p4 != ap_const_lv8_FF? 1'b1: 1'b0);

assign notrhs2_fu_312_p2 = (tmp_19_fu_302_p1 == ap_const_lv23_0? 1'b1: 1'b0);

assign notrhs4_fu_353_p2 = (tmp_25_fu_343_p1 == ap_const_lv23_0? 1'b1: 1'b0);

assign notrhs5_fu_448_p2 = (tmp_30_fu_438_p1 == ap_const_lv23_0? 1'b1: 1'b0);

assign notrhs6_fu_497_p2 = (tmp_35_fu_487_p1 == ap_const_lv23_0? 1'b1: 1'b0);

assign notrhs_fu_244_p2 = (tmp_14_fu_234_p1 == ap_const_lv23_0? 1'b1: 1'b0);

assign or_cond2_fu_279_p2 = (tmp_2_reg_701 & tmp_11_reg_706);

assign or_cond_fu_261_p2 = (tmp_3_fu_213_p3 & tmp_9_fu_256_p2);

assign p_Result_s_fu_543_p3 = {{ap_const_lv1_1}, {loc_V_1_fu_539_p1}};

assign p_Val2_s_fu_525_p1 = x_assign_reg_157;

assign sel_tmp1_fu_382_p2 = (tmp_22_reg_740 & sel_tmp_fu_377_p2);

assign sel_tmp2_fu_387_p3 = ((sel_tmp1_fu_382_p2[0:0] === 1'b1) ? tmp_7_reg_719 : reg_195);

assign sel_tmp6_cast_fu_401_p1 = sel_tmp1_fu_382_p2;

assign sel_tmp_fu_377_p2 = (tmp_16_reg_728 ^ ap_const_lv1_1);

assign sh_assign_1_cast_cast_fu_595_p1 = $signed(sh_assign_1_fu_583_p3);

assign sh_assign_1_cast_fu_591_p1 = $signed(sh_assign_1_fu_583_p3);

assign sh_assign_1_fu_583_p3 = ((isNeg_fu_565_p3[0:0] === 1'b1) ? tmp_4_i_i_cast_fu_579_p1 : sh_assign_fu_559_p2);

assign sh_assign_fu_559_p2 = ($signed(ap_const_lv9_181) + $signed(tmp_i_i_i_cast8_fu_555_p1));

assign storemerge1_fu_405_p3 = ((tmp_16_reg_728[0:0] === 1'b1) ? ap_const_lv2_3 : sel_tmp6_cast_fu_401_p1);

assign tmp_11_fu_273_p2 = (tmp_6_fu_250_p2 & grp_fu_180_p2);

assign tmp_12_fu_292_p4 = {{tmp_5_to_int_fu_288_p1[ap_const_lv32_1E : ap_const_lv32_17]}};

assign tmp_13_fu_318_p2 = (notrhs2_fu_312_p2 | notlhs2_fu_306_p2);

assign tmp_14_fu_234_p1 = e_to_int_fu_221_p1[22:0];

assign tmp_16_fu_324_p2 = (tmp_13_fu_318_p2 & grp_fu_180_p2);

assign tmp_17_fu_333_p4 = {{tmp_7_to_int_fu_330_p1[ap_const_lv32_1E : ap_const_lv32_17]}};

assign tmp_18_fu_359_p2 = (notrhs4_fu_353_p2 | notlhs4_fu_347_p2);

assign tmp_19_fu_302_p1 = tmp_5_to_int_fu_288_p1[22:0];

assign tmp_1_fu_224_p4 = {{e_to_int_fu_221_p1[ap_const_lv32_1E : ap_const_lv32_17]}};

assign tmp_20_fu_365_p2 = (tmp_13_fu_318_p2 & tmp_18_fu_359_p2);

assign tmp_21_fu_185_opcode = ap_const_lv5_2;

assign tmp_22_fu_371_p2 = (tmp_20_fu_365_p2 & tmp_21_fu_185_p2);

assign tmp_23_fu_428_p4 = {{x_to_int_fu_424_p1[ap_const_lv32_1E : ap_const_lv32_17]}};

assign tmp_24_fu_454_p2 = (notrhs5_fu_448_p2 | notlhs5_fu_442_p2);

assign tmp_25_fu_343_p1 = tmp_7_to_int_fu_330_p1[22:0];

assign tmp_27_fu_460_p2 = (tmp_24_fu_454_p2 & grp_fu_180_p2);

assign tmp_28_fu_477_p4 = {{x_1_to_int_fu_474_p1[ap_const_lv32_1E : ap_const_lv32_17]}};

assign tmp_29_fu_503_p2 = (notrhs6_fu_497_p2 | notlhs6_fu_491_p2);

assign tmp_2_fu_267_p2 = (sat == ap_const_lv2_1? 1'b1: 1'b0);

assign tmp_2_i_i_fu_551_p1 = p_Result_s_fu_543_p3;

assign tmp_30_fu_438_p1 = x_to_int_fu_424_p1[22:0];

assign tmp_31_fu_509_p2 = (tmp_29_fu_503_p2 & tmp_18_reg_735);

assign tmp_33_fu_514_p2 = (tmp_31_fu_509_p2 & tmp_32_reg_761);

assign tmp_34_fu_623_p1 = tmp_41_fu_615_p3;

assign tmp_35_fu_487_p1 = x_1_to_int_fu_474_p1[22:0];

assign tmp_36_fu_627_p4 = {{tmp_9_i_i_fu_609_p2[ap_const_lv32_20 : ap_const_lv32_17]}};

assign tmp_37_fu_637_p3 = ((isNeg_fu_565_p3[0:0] === 1'b1) ? tmp_34_fu_623_p1 : tmp_36_fu_627_p4);

assign tmp_3_fu_213_p3 = sat[ap_const_lv32_1];

assign tmp_41_fu_615_p3 = tmp_7_i_i_fu_603_p2[ap_const_lv32_17];

assign tmp_4_i_i_cast_fu_579_p1 = $signed(tmp_4_i_i_fu_573_p2);

assign tmp_4_i_i_fu_573_p2 = (ap_const_lv8_7F - loc_V_fu_529_p4);

assign tmp_5_to_int_fu_288_p1 = reg_195;

assign tmp_6_fu_250_p2 = (notrhs_fu_244_p2 | notlhs_fu_238_p2);

assign tmp_6_i_i_fu_599_p1 = $unsigned(sh_assign_1_cast_fu_591_p1);

assign tmp_7_i_i_fu_603_p2 = p_Result_s_fu_543_p3 >> sh_assign_1_cast_cast_fu_595_p1;

assign tmp_7_to_int_fu_330_p1 = tmp_7_reg_719;

assign tmp_9_fu_256_p2 = (tmp_6_fu_250_p2 & tmp_8_reg_687);

assign tmp_9_i_i_fu_609_p2 = tmp_2_i_i_fu_551_p1 << tmp_6_i_i_fu_599_p1;

assign tmp_fu_206_p1 = X_MAX_read_reg_669;

assign tmp_i_i_i_cast8_fu_555_p1 = loc_V_fu_529_p4;

assign u = tmp_37_fu_637_p3;

assign uDbg = tmp_37_fu_637_p3;

assign x_1_fu_466_p3 = ((tmp_27_reg_750[0:0] === 1'b1) ? reg_195 : ap_const_lv32_0);

assign x_1_tmp_7_fu_519_p3 = ((tmp_33_fu_514_p2[0:0] === 1'b1) ? x_1_reg_755 : tmp_7_reg_719);

assign x_1_to_int_fu_474_p1 = x_1_reg_755;

assign x_integral_new_fu_394_p3 = ((tmp_16_reg_728[0:0] === 1'b1) ? ap_const_lv32_0 : sel_tmp2_fu_387_p3);

assign x_to_int_fu_424_p1 = reg_195;

assign y1_fu_201_p1 = v_meas;

assign yDbg = y_reg_652;

assign yVmeasDbg = y_reg_652;
always @ (posedge ap_clk) begin
    tmp_reg_692[31:10] <= 22'b0000000000000000000000;
end



endmodule //PI_compensator
