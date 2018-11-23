; ModuleID = 'D:/flyback_controller/hls/digital_compensator/dbg_mode/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@y_1 = internal unnamed_addr global float 0.000000e+00
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@e_2 = internal unnamed_addr global float 0.000000e+00
@e_1 = internal unnamed_addr global float 0.000000e+00
@RAM_1P_str = internal unnamed_addr constant [7 x i8] c"RAM_1P\00"
@Dig_compensator_str = internal unnamed_addr constant [16 x i8] c"Dig_compensator\00"
@p_str3 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare i62 @llvm.part.select.i62(i62, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_Write.s_axilite.i10P(i10*, i10) {
entry:
  store i10 %1, i10* %0
  ret void
}

define weak void @_ssdm_op_Write.s_axilite.floatP(float*, float) {
entry:
  store float %1, float* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_none.i10P(i10*, i10) {
entry:
  store i10 %1, i10* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecMemCore(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.s_axilite.i32(i32) {
entry:
  ret i32 %0
}

define weak float @_ssdm_op_Read.s_axilite.float(float) {
entry:
  ret float %0
}

define weak i12 @_ssdm_op_Read.ap_none.i12(i12) {
entry:
  ret i12 %0
}

define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_7 = trunc i32 %empty to i8
  ret i8 %empty_7
}

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i12 @_ssdm_op_PartSelect.i12.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i10 @_ssdm_op_PartSelect.i10.i62.i32.i32(i62, i32, i32) nounwind readnone {
entry:
  %empty = call i62 @llvm.part.select.i62(i62 %0, i32 %1, i32 %2)
  %empty_8 = trunc i62 %empty to i10
  ret i10 %empty_8
}

define weak i1 @_ssdm_op_BitSelect.i1.i9.i32(i9, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i9
  %empty_9 = shl i9 1, %empty
  %empty_10 = and i9 %0, %empty_9
  %empty_11 = icmp ne i9 %empty_10, 0
  ret i1 %empty_11
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_12 = shl i24 1, %empty
  %empty_13 = and i24 %0, %empty_12
  %empty_14 = icmp ne i24 %empty_13, 0
  ret i1 %empty_14
}

define weak i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1, i23) nounwind readnone {
entry:
  %empty = zext i1 %0 to i24
  %empty_15 = zext i23 %1 to i24
  %empty_16 = shl i24 %empty, 23
  %empty_17 = or i24 %empty_16, %empty_15
  ret i24 %empty_17
}

declare void @_GLOBAL__I_a() nounwind

define void @Dig_compensator(float %params_vRef, [3 x float]* byval %params_coef, i32 %params_y_max, i32 %params_adcMask, i12 zeroext %v_meas, i10* %u, float* %yVmeasDbg, float* %yDbg, float* %eDbg, i10* %uDbg) {
._crit_edge_ifconv:
  %e_load_s = alloca float
  %y_load_s = alloca float
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_vRef), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([3 x float]* %params_coef), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %params_y_max), !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %params_adcMask), !map !23
  call void (...)* @_ssdm_op_SpecBitsMap(i12 %v_meas), !map !27
  call void (...)* @_ssdm_op_SpecBitsMap(i10* %u), !map !31
  call void (...)* @_ssdm_op_SpecBitsMap(float* %yVmeasDbg), !map !35
  call void (...)* @_ssdm_op_SpecBitsMap(float* %yDbg), !map !39
  call void (...)* @_ssdm_op_SpecBitsMap(float* %eDbg), !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i10* %uDbg), !map !47
  call void (...)* @_ssdm_op_SpecTopModule([16 x i8]* @Dig_compensator_str) nounwind
  %v_meas_read = call i12 @_ssdm_op_Read.ap_none.i12(i12 %v_meas)
  %params_adcMask_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %params_adcMask)
  %params_y_max_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %params_y_max)
  %params_vRef_read = call float @_ssdm_op_Read.s_axilite.float(float %params_vRef)
  call void (...)* @_ssdm_op_SpecInterface(i32 %params_adcMask, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %params_y_max, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  %params_coef_addr = getelementptr [3 x float]* %params_coef, i64 0, i64 0
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([3 x float]* %params_coef, [1 x i8]* @p_str3, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str3, i32 -1, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3)
  call void (...)* @_ssdm_op_SpecInterface([3 x float]* %params_coef, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float %params_vRef, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %yVmeasDbg, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i10* %uDbg, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %eDbg, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %yDbg, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i12 %v_meas, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i10* %u, [8 x i8]* @p_str2, i32 1, i32 1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_8 = trunc i32 %params_adcMask_read to i12
  %tmp_1 = and i12 %tmp_8, %v_meas_read
  %tmp_1_cast = zext i12 %tmp_1 to i32
  %v_measReal = sitofp i32 %tmp_1_cast to float
  %e = fsub float %params_vRef_read, %v_measReal
  %params_coef_load = load float* %params_coef_addr, align 4
  %tmp_2 = fmul float %params_coef_load, %e
  %params_coef_addr_1 = getelementptr [3 x float]* %params_coef, i64 0, i64 1
  %params_coef_load_1 = load float* %params_coef_addr_1, align 4
  %e_1_load = load float* @e_1, align 4
  %tmp_3 = fmul float %params_coef_load_1, %e_1_load
  %tmp_4 = fadd float %tmp_2, %tmp_3
  %params_coef_addr_2 = getelementptr [3 x float]* %params_coef, i64 0, i64 2
  %params_coef_load_2 = load float* %params_coef_addr_2, align 4
  %e_2_load = load float* @e_2, align 4
  %tmp_5 = fmul float %params_coef_load_2, %e_2_load
  %tmp_6 = fadd float %tmp_4, %tmp_5
  %y_1_load = load float* @y_1, align 4
  %tmp_7 = fadd float %tmp_6, %y_1_load
  %tmp_7_to_int = bitcast float %tmp_7 to i32
  %tmp = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %tmp_7_to_int, i32 23, i32 30)
  %tmp_15 = trunc i32 %tmp_7_to_int to i23
  %notlhs = icmp ne i8 %tmp, -1
  %notrhs = icmp eq i23 %tmp_15, 0
  %tmp_10 = or i1 %notrhs, %notlhs
  %tmp_11 = fcmp ogt float %tmp_7, 0.000000e+00
  %tmp_13 = and i1 %tmp_10, %tmp_11
  %tmp_9 = select i1 %tmp_13, float %tmp_7, float 0.000000e+00
  %tmp_s = sitofp i32 %params_y_max_read to float
  %tmp_9_to_int = bitcast float %tmp_9 to i32
  %tmp_14 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %tmp_9_to_int, i32 23, i32 30)
  %tmp_17 = trunc i32 %tmp_9_to_int to i23
  %tmp_10_to_int = bitcast float %tmp_s to i32
  %tmp_16 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %tmp_10_to_int, i32 23, i32 30)
  %tmp_23 = trunc i32 %tmp_10_to_int to i23
  %notlhs2 = icmp ne i8 %tmp_14, -1
  %notrhs3 = icmp eq i23 %tmp_17, 0
  %tmp_18 = or i1 %notrhs3, %notlhs2
  %notlhs4 = icmp ne i8 %tmp_16, -1
  %notrhs5 = icmp eq i23 %tmp_23, 0
  %tmp_19 = or i1 %notrhs5, %notlhs4
  %tmp_20 = and i1 %tmp_18, %tmp_19
  %tmp_21 = fcmp olt float %tmp_9, %tmp_s
  %tmp_22 = and i1 %tmp_20, %tmp_21
  %x_assign = select i1 %tmp_22, float %tmp_9, float %tmp_s
  %p_Val2_s = bitcast float %x_assign to i32
  %loc_V = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_Val2_s, i32 23, i32 30) nounwind
  %loc_V_1 = trunc i32 %p_Val2_s to i23
  %p_Result_s = call i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1 true, i23 %loc_V_1) nounwind
  %tmp_2_i_i = zext i24 %p_Result_s to i62
  %tmp_i_i_i_cast1 = zext i8 %loc_V to i9
  %sh_assign = add i9 -127, %tmp_i_i_i_cast1
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign, i32 8)
  %tmp_4_i_i = sub i8 127, %loc_V
  %tmp_4_i_i_cast = sext i8 %tmp_4_i_i to i9
  %sh_assign_1 = select i1 %isNeg, i9 %tmp_4_i_i_cast, i9 %sh_assign
  %sh_assign_1_cast = sext i9 %sh_assign_1 to i32
  %sh_assign_1_cast_cast = sext i9 %sh_assign_1 to i24
  %tmp_6_i_i = zext i32 %sh_assign_1_cast to i62
  %tmp_7_i_i = lshr i24 %p_Result_s, %sh_assign_1_cast_cast
  %tmp_9_i_i = shl i62 %tmp_2_i_i, %tmp_6_i_i
  %tmp_29 = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %tmp_7_i_i, i32 23)
  %tmp_24 = zext i1 %tmp_29 to i10
  %tmp_25 = call i10 @_ssdm_op_PartSelect.i10.i62.i32.i32(i62 %tmp_9_i_i, i32 23, i32 32)
  %tmp_26 = select i1 %isNeg, i10 %tmp_24, i10 %tmp_25
  call void @_ssdm_op_Write.ap_none.i10P(i10* %u, i10 %tmp_26)
  store float %y_1_load, float* %y_load_s
  store float %e_1_load, float* %e_load_s
  br label %branch2

branch2:                                          ; preds = %branch2.backedge, %._crit_edge_ifconv
  %i = phi i2 [ -2, %._crit_edge_ifconv ], [ %i_1, %branch2.backedge ]
  %tmp_12 = icmp eq i2 %i, 0
  %empty_18 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2)
  br i1 %tmp_12, label %2, label %0

; <label>:0                                       ; preds = %branch2
  %e_load = load float* %e_load_s
  %i_1 = add i2 %i, -1
  %cond = icmp eq i2 %i_1, 0
  %e_load_2_phi = select i1 %cond, float %e, float %e_load
  %cond1 = icmp eq i2 %i, 1
  br i1 %cond1, label %branch7, label %branch8

; <label>:1                                       ; preds = %branch8, %branch7
  %y_load = load float* %y_load_s
  %y_load_1_phi = select i1 %cond, float %x_assign, float %y_load
  br i1 %cond1, label %branch1, label %branch2.backedge

; <label>:2                                       ; preds = %branch2
  call void @_ssdm_op_Write.s_axilite.floatP(float* %yVmeasDbg, float %v_measReal)
  call void @_ssdm_op_Write.s_axilite.floatP(float* %yDbg, float %x_assign)
  call void @_ssdm_op_Write.s_axilite.floatP(float* %eDbg, float %e)
  call void @_ssdm_op_Write.s_axilite.i10P(i10* %uDbg, i10 %tmp_26)
  ret void

branch1:                                          ; preds = %1
  store float %y_load_1_phi, float* @y_1, align 4
  store float %y_load_1_phi, float* %y_load_s
  br label %branch2.backedge

branch2.backedge:                                 ; preds = %branch1, %1
  br label %branch2

branch7:                                          ; preds = %0
  store float %e_load_2_phi, float* @e_1, align 4
  store float %e_load_2_phi, float* %e_load_s
  br label %1

branch8:                                          ; preds = %0
  store float %e_load_2_phi, float* @e_2, align 4
  br label %1
}

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"params.vRef", metadata !11, metadata !"float", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"params.coef", metadata !17, metadata !"float", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 2, i32 1}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"params.y_max", metadata !11, metadata !"int", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"params.adcMask", metadata !11, metadata !"int", i32 0, i32 31}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 11, metadata !29}
!29 = metadata !{metadata !30}
!30 = metadata !{metadata !"v_meas", metadata !11, metadata !"uint12", i32 0, i32 11}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 0, i32 9, metadata !33}
!33 = metadata !{metadata !34}
!34 = metadata !{metadata !"u", metadata !5, metadata !"uint10", i32 0, i32 9}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 31, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"yVmeasDbg", metadata !5, metadata !"float", i32 0, i32 31}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 31, metadata !41}
!41 = metadata !{metadata !42}
!42 = metadata !{metadata !"yDbg", metadata !5, metadata !"float", i32 0, i32 31}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 31, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"eDbg", metadata !5, metadata !"float", i32 0, i32 31}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 9, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"uDbg", metadata !5, metadata !"uint10", i32 0, i32 9}
