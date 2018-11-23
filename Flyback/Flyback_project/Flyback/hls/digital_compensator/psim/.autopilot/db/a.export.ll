; ModuleID = 'D:/flyback_controller/hls/digital_compensator/psim/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@y_3 = internal unnamed_addr global float 0.000000e+00
@y_2 = internal unnamed_addr global float 0.000000e+00
@y_1 = internal unnamed_addr global float 0.000000e+00
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@e_3 = internal unnamed_addr global float 0.000000e+00
@e_2 = internal unnamed_addr global float 0.000000e+00
@e_1 = internal unnamed_addr global float 0.000000e+00
@Dig_compensator_str = internal unnamed_addr constant [16 x i8] c"Dig_compensator\00"
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

declare i62 @llvm.part.select.i62(i62, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_none.i10P(i10*, i10) {
entry:
  store i10 %1, i10* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
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

define weak i12 @_ssdm_op_Read.ap_none.i12(i12) {
entry:
  ret i12 %0
}

define weak float @_ssdm_op_Read.ap_none.float(float) {
entry:
  ret float %0
}

define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_6 = trunc i32 %empty to i8
  ret i8 %empty_6
}

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i2 @_ssdm_op_PartSelect.i2.i3.i32.i32(i3, i32, i32) nounwind readnone

define weak i10 @_ssdm_op_PartSelect.i10.i62.i32.i32(i62, i32, i32) nounwind readnone {
entry:
  %empty = call i62 @llvm.part.select.i62(i62 %0, i32 %1, i32 %2)
  %empty_7 = trunc i62 %empty to i10
  ret i10 %empty_7
}

define weak float @_ssdm_op_Mux.ap_auto.4float.i2(float, float, float, float, i2) {
entry:
  switch i2 %4, label %case3 [
    i2 0, label %case0
    i2 1, label %case1
    i2 -2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi float [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret float %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

define weak i1 @_ssdm_op_BitSelect.i1.i9.i32(i9, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i9
  %empty_8 = shl i9 1, %empty
  %empty_9 = and i9 %0, %empty_8
  %empty_10 = icmp ne i9 %empty_9, 0
  ret i1 %empty_10
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_11 = shl i24 1, %empty
  %empty_12 = and i24 %0, %empty_11
  %empty_13 = icmp ne i24 %empty_12, 0
  ret i1 %empty_13
}

define weak i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1, i23) nounwind readnone {
entry:
  %empty = zext i1 %0 to i24
  %empty_14 = zext i23 %1 to i24
  %empty_15 = shl i24 %empty, 23
  %empty_16 = or i24 %empty_15, %empty_14
  ret i24 %empty_16
}

declare void @_GLOBAL__I_a() nounwind

define void @Dig_compensator(float %params_vRef, float %params_a_0, float %params_a_1, float %params_a_2, float %params_a_3, float %params_b_0, float %params_b_1, float %params_b_2, float %params_b_3, i12 zeroext %v_meas, i10* %u) {
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_a_3), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_a_2), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_a_1), !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_a_0), !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_b_3), !map !31
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_b_2), !map !35
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_b_1), !map !39
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_b_0), !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(float %params_vRef), !map !47
  call void (...)* @_ssdm_op_SpecBitsMap(i12 %v_meas), !map !53
  call void (...)* @_ssdm_op_SpecBitsMap(i10* %u), !map !57
  call void (...)* @_ssdm_op_SpecTopModule([16 x i8]* @Dig_compensator_str) nounwind
  %v_meas_read = call i12 @_ssdm_op_Read.ap_none.i12(i12 %v_meas)
  %params_b_3_read = call float @_ssdm_op_Read.ap_none.float(float %params_b_3)
  %params_b_2_read = call float @_ssdm_op_Read.ap_none.float(float %params_b_2)
  %params_b_1_read = call float @_ssdm_op_Read.ap_none.float(float %params_b_1)
  %params_b_0_read = call float @_ssdm_op_Read.ap_none.float(float %params_b_0)
  %params_a_3_read = call float @_ssdm_op_Read.ap_none.float(float %params_a_3)
  %params_a_2_read = call float @_ssdm_op_Read.ap_none.float(float %params_a_2)
  %params_a_1_read = call float @_ssdm_op_Read.ap_none.float(float %params_a_1)
  %params_vRef_read = call float @_ssdm_op_Read.ap_none.float(float %params_vRef)
  call void (...)* @_ssdm_op_SpecInterface(float %params_a_0, float %params_a_1, float %params_a_2, float %params_a_3, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float %params_b_0, float %params_b_1, float %params_b_2, float %params_b_3, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float %params_vRef, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %tmp_s = zext i12 %v_meas_read to i32
  call void (...)* @_ssdm_op_SpecInterface(i12 %v_meas, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i10* %u, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %tmp_1 = sitofp i32 %tmp_s to double
  %tmp_2 = fmul double %tmp_1, 3.300000e+00
  %tmp_3 = fmul double %tmp_2, 0x3F30000000000000
  %v_measReal = fptrunc double %tmp_3 to float
  %e = fsub float %params_vRef_read, %v_measReal
  br label %1

; <label>:1                                       ; preds = %2, %0
  %i = phi i3 [ 0, %0 ], [ %i_3, %2 ]
  %num = phi float [ 0.000000e+00, %0 ], [ %num_1, %2 ]
  %exitcond1 = icmp eq i3 %i, -4
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %i_3 = add i3 %i, 1
  br i1 %exitcond1, label %.preheader.preheader, label %2

.preheader.preheader:                             ; preds = %1
  %y_3_load = load float* @y_3, align 4
  %y_1_load = load float* @y_1, align 4
  %y_2_load = load float* @y_2, align 4
  br label %.preheader

; <label>:2                                       ; preds = %1
  %tmp_8 = trunc i3 %i to i2
  %tmp = call float @_ssdm_op_Mux.ap_auto.4float.i2(float %params_b_0_read, float %params_b_1_read, float %params_b_2_read, float %params_b_3_read, i2 %tmp_8)
  %e_1_load_1 = load float* @e_1, align 4
  %e_2_load_1 = load float* @e_2, align 4
  %e_3_load = load float* @e_3, align 4
  %tmp_4 = call float @_ssdm_op_Mux.ap_auto.4float.i2(float %e, float %e_1_load_1, float %e_2_load_1, float %e_3_load, i2 %tmp_8)
  %tmp_6 = fmul float %tmp, %tmp_4
  %num_1 = fadd float %num, %tmp_6
  br label %1

.preheader:                                       ; preds = %_ifconv, %.preheader.preheader
  %i_1 = phi i3 [ %i_4, %_ifconv ], [ 1, %.preheader.preheader ]
  %den = phi float [ %den_1, %_ifconv ], [ 0.000000e+00, %.preheader.preheader ]
  %exitcond = icmp eq i3 %i_1, -4
  %empty_17 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  br i1 %exitcond, label %._crit_edge_ifconv, label %_ifconv

_ifconv:                                          ; preds = %.preheader
  %tmp_27 = trunc i3 %i_1 to i2
  %sel_tmp = icmp eq i2 %tmp_27, -2
  %sel_tmp1 = select i1 %sel_tmp, float %params_a_2_read, float %params_a_3_read
  %sel_tmp2 = icmp eq i2 %tmp_27, 1
  %params_a_load_phi = select i1 %sel_tmp2, float %params_a_1_read, float %sel_tmp1
  %sel_tmp5 = select i1 %sel_tmp, float %y_2_load, float %y_3_load
  %y_load_phi = select i1 %sel_tmp2, float %y_1_load, float %sel_tmp5
  %tmp_14 = fmul float %params_a_load_phi, %y_load_phi
  %den_1 = fadd float %den, %tmp_14
  %i_4 = add i3 1, %i_1
  br label %.preheader

._crit_edge_ifconv:                               ; preds = %.preheader
  %y_2_load_1 = alloca float
  %y_1_load_1 = alloca float
  %tmp_7 = fsub float %num, %den
  %tmp_7_to_int = bitcast float %tmp_7 to i32
  %tmp_5 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %tmp_7_to_int, i32 23, i32 30)
  %tmp_16 = trunc i32 %tmp_7_to_int to i23
  %notlhs = icmp ne i8 %tmp_5, -1
  %notrhs = icmp eq i23 %tmp_16, 0
  %tmp_10 = or i1 %notrhs, %notlhs
  %tmp_11 = fcmp ogt float %tmp_7, 0.000000e+00
  %tmp_12 = and i1 %tmp_10, %tmp_11
  %tmp_9 = select i1 %tmp_12, float %tmp_7, float 0.000000e+00
  %tmp_9_to_int = bitcast float %tmp_9 to i32
  %tmp_15 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %tmp_9_to_int, i32 23, i32 30)
  %tmp_20 = trunc i32 %tmp_9_to_int to i23
  %notlhs1 = icmp ne i8 %tmp_15, -1
  %notrhs1 = icmp eq i23 %tmp_20, 0
  %tmp_17 = or i1 %notrhs1, %notlhs1
  %tmp_18 = fcmp olt float %tmp_9, 8.000000e+02
  %tmp_19 = and i1 %tmp_17, %tmp_18
  %x_assign = select i1 %tmp_19, float %tmp_9, float 8.000000e+02
  %p_Val2_s = bitcast float %x_assign to i32
  %loc_V = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_Val2_s, i32 23, i32 30) nounwind
  %loc_V_1 = trunc i32 %p_Val2_s to i23
  %p_Result_s = call i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1 true, i23 %loc_V_1) nounwind
  %tmp_2_i_i = zext i24 %p_Result_s to i62
  %tmp_i_i_i_cast = zext i8 %loc_V to i9
  %sh_assign = add i9 -127, %tmp_i_i_i_cast
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign, i32 8)
  %tmp_4_i_i = sub i8 127, %loc_V
  %tmp_4_i_i_cast = sext i8 %tmp_4_i_i to i9
  %sh_assign_1 = select i1 %isNeg, i9 %tmp_4_i_i_cast, i9 %sh_assign
  %sh_assign_1_cast = sext i9 %sh_assign_1 to i32
  %sh_assign_1_cast_cast = sext i9 %sh_assign_1 to i24
  %tmp_6_i_i = zext i32 %sh_assign_1_cast to i62
  %tmp_7_i_i = lshr i24 %p_Result_s, %sh_assign_1_cast_cast
  %tmp_9_i_i = shl i62 %tmp_2_i_i, %tmp_6_i_i
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %tmp_7_i_i, i32 23)
  %tmp_21 = zext i1 %tmp_26 to i10
  %tmp_22 = call i10 @_ssdm_op_PartSelect.i10.i62.i32.i32(i62 %tmp_9_i_i, i32 23, i32 32)
  %tmp_23 = select i1 %isNeg, i10 %tmp_21, i10 %tmp_22
  call void @_ssdm_op_Write.ap_none.i10P(i10* %u, i10 %tmp_23)
  store float %y_1_load, float* %y_1_load_1
  store float %y_2_load, float* %y_2_load_1
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %._crit_edge_ifconv
  %i_2 = phi i2 [ -1, %._crit_edge_ifconv ], [ %i_5, %.backedge.backedge ]
  %tmp_13 = icmp eq i2 %i_2, 0
  %empty_18 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  br i1 %tmp_13, label %3, label %_ifconv8

_ifconv8:                                         ; preds = %.backedge
  %i_5 = add i2 %i_2, -1
  %e_2_load = load float* @e_2, align 4
  %e_1_load = load float* @e_1, align 4
  %sel_tmp9 = icmp eq i2 %i_5, 1
  %sel_tmp3 = select i1 %sel_tmp9, float %e_1_load, float %e_2_load
  %sel_tmp4 = icmp eq i2 %i_5, 0
  %e_load_1_phi = select i1 %sel_tmp4, float %e, float %sel_tmp3
  switch i2 %i_2, label %branch19 [
    i2 1, label %branch17
    i2 -2, label %branch18
  ]

_ifconv13:                                        ; preds = %branch19, %branch18, %branch17
  %y_2_load_2 = load float* %y_2_load_1
  %y_1_load_2 = load float* %y_1_load_1
  %sel_tmp6 = select i1 %sel_tmp9, float %y_1_load_2, float %y_2_load_2
  %y_load_1_phi = select i1 %sel_tmp4, float %x_assign, float %sel_tmp6
  switch i2 %i_2, label %branch7 [
    i2 1, label %branch5
    i2 -2, label %branch6
  ]

; <label>:3                                       ; preds = %.backedge
  ret void

branch5:                                          ; preds = %_ifconv13
  store float %y_load_1_phi, float* @y_1, align 4
  store float %y_load_1_phi, float* %y_1_load_1
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %branch5, %branch6, %branch7
  br label %.backedge

branch6:                                          ; preds = %_ifconv13
  store float %y_load_1_phi, float* @y_2, align 4
  store float %y_load_1_phi, float* %y_2_load_1
  br label %.backedge.backedge

branch7:                                          ; preds = %_ifconv13
  store float %y_load_1_phi, float* @y_3, align 4
  br label %.backedge.backedge

branch17:                                         ; preds = %_ifconv8
  store float %e_load_1_phi, float* @e_1, align 4
  br label %_ifconv13

branch18:                                         ; preds = %_ifconv8
  store float %e_load_1_phi, float* @e_2, align 4
  br label %_ifconv13

branch19:                                         ; preds = %_ifconv8
  store float %e_load_1_phi, float* @e_3, align 4
  br label %_ifconv13
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
!10 = metadata !{metadata !"params.a", metadata !11, metadata !"float", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 3, i32 3, i32 2}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"params.a", metadata !17, metadata !"float", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 2, i32 2, i32 2}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"params.a", metadata !23, metadata !"float", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 1, i32 1, i32 2}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 31, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"params.a", metadata !29, metadata !"float", i32 0, i32 31}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 0, i32 2}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 0, i32 31, metadata !33}
!33 = metadata !{metadata !34}
!34 = metadata !{metadata !"params.b", metadata !11, metadata !"float", i32 0, i32 31}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 31, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"params.b", metadata !17, metadata !"float", i32 0, i32 31}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 31, metadata !41}
!41 = metadata !{metadata !42}
!42 = metadata !{metadata !"params.b", metadata !23, metadata !"float", i32 0, i32 31}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 31, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"params.b", metadata !29, metadata !"float", i32 0, i32 31}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 31, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"params.vRef", metadata !51, metadata !"float", i32 0, i32 31}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 0, i32 0}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 0, i32 11, metadata !55}
!55 = metadata !{metadata !56}
!56 = metadata !{metadata !"v_meas", metadata !51, metadata !"uint12", i32 0, i32 11}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 0, i32 9, metadata !59}
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !"u", metadata !5, metadata !"uint10", i32 0, i32 9}
