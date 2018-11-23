; ModuleID = 'D:/flyback_controller/hls/digital_compensator/sysgen_test/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@x_integral = internal unnamed_addr global float 0.000000e+00, align 4
@sat = internal unnamed_addr global i2 0
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@digital_compensator_str = internal unnamed_addr constant [20 x i8] c"digital_compensator\00"
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1

declare i62 @llvm.part.select.i62(i62, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @digital_compensator(float %v_ref, i12 zeroext %v_meas, float %Kp, float %Ki2, i10* %u) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(float %v_ref) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i12 %v_meas) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(float %Kp) nounwind, !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(float %Ki2) nounwind, !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i10* %u) nounwind, !map !25
  call void (...)* @_ssdm_op_SpecTopModule([20 x i8]* @digital_compensator_str) nounwind
  %Ki2_read = call float @_ssdm_op_Read.ap_auto.float(float %Ki2) nounwind
  %Kp_read = call float @_ssdm_op_Read.ap_auto.float(float %Kp) nounwind
  %v_meas_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %v_meas) nounwind
  %v_ref_read = call float @_ssdm_op_Read.ap_auto.float(float %v_ref) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i10* %u, [8 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %tmp = zext i12 %v_meas_read to i32
  %tmp_s = sitofp i32 %tmp to double
  %tmp_1 = fmul double %tmp_s, 3.300000e+00
  %tmp_2 = fmul double %tmp_1, 0x3F30000000000000
  %tmp_3 = fmul double %tmp_2, 8.000000e+00
  %y = fptrunc double %tmp_3 to float
  %e = fsub float %v_ref_read, %y
  %sat_load = load i2* @sat, align 1
  %tmp_4 = call i1 @_ssdm_op_BitSelect.i1.i2.i32(i2 %sat_load, i32 1)
  %e_to_int = bitcast float %e to i32
  %tmp_5 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %e_to_int, i32 23, i32 30)
  %tmp_7 = trunc i32 %e_to_int to i23
  %notlhs = icmp ne i8 %tmp_5, -1
  %notrhs = icmp eq i23 %tmp_7, 0
  %tmp_10 = or i1 %notrhs, %notlhs
  %tmp_11 = fcmp olt float %e, 0.000000e+00
  %tmp_13 = and i1 %tmp_10, %tmp_11
  %or_cond = and i1 %tmp_4, %tmp_13
  br i1 %or_cond, label %._crit_edge, label %1

; <label>:1                                       ; preds = %0
  %tmp_6 = icmp eq i2 %sat_load, 1
  %tmp_14 = fcmp ogt float %e, 0.000000e+00
  %tmp_15 = and i1 %tmp_10, %tmp_14
  %or_cond2 = and i1 %tmp_6, %tmp_15
  br i1 %or_cond2, label %._crit_edge, label %_ifconv1

._crit_edge:                                      ; preds = %1, %0
  br label %_ifconv

_ifconv1:                                         ; preds = %1
  %x_integral_load = load float* @x_integral, align 4
  %tmp_8 = fmul float %e, %Ki2_read
  %tmp_9 = fadd float %x_integral_load, %tmp_8
  %tmp_9_to_int = bitcast float %tmp_9 to i32
  %tmp_16 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %tmp_9_to_int, i32 23, i32 30)
  %tmp_17 = trunc i32 %tmp_9_to_int to i23
  %notlhs2 = icmp ne i8 %tmp_16, -1
  %notrhs2 = icmp eq i23 %tmp_17, 0
  %tmp_18 = or i1 %notrhs2, %notlhs2
  %tmp_19 = fcmp olt float %tmp_9, 0.000000e+00
  %tmp_20 = and i1 %tmp_18, %tmp_19
  %tmp_21 = fcmp ogt float %tmp_9, 1.000000e+03
  %tmp_22 = and i1 %tmp_18, %tmp_21
  %sel_tmp = xor i1 %tmp_20, true
  %sel_tmp2 = and i1 %tmp_22, %sel_tmp
  %sel_tmp3 = select i1 %tmp_20, float 0.000000e+00, float 1.000000e+03
  %tmp_23 = or i1 %tmp_20, %sel_tmp2
  %x_integral_new = select i1 %tmp_23, float %sel_tmp3, float %tmp_9
  %sel_tmp7_cast = zext i1 %sel_tmp2 to i2
  %storemerge1 = select i1 %tmp_20, i2 -1, i2 %sel_tmp7_cast
  store i2 %storemerge1, i2* @sat, align 1
  %tmp_12 = fmul float %e, %Kp_read
  %x = fadd float %tmp_12, %x_integral_new
  %x_to_int = bitcast float %x to i32
  %tmp_24 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %x_to_int, i32 23, i32 30)
  %tmp_25 = trunc i32 %x_to_int to i23
  %notlhs4 = icmp ne i8 %tmp_24, -1
  %notrhs4 = icmp eq i23 %tmp_25, 0
  %tmp_26 = or i1 %notrhs4, %notlhs4
  %tmp_27 = fcmp ogt float %x, 0.000000e+00
  %tmp_28 = and i1 %tmp_26, %tmp_27
  %x_1 = select i1 %tmp_28, float %x, float 0.000000e+00
  %x_1_to_int = bitcast float %x_1 to i32
  %tmp_29 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %x_1_to_int, i32 23, i32 30)
  %tmp_30 = trunc i32 %x_1_to_int to i23
  %notlhs5 = icmp ne i8 %tmp_29, -1
  %notrhs5 = icmp eq i23 %tmp_30, 0
  %tmp_31 = or i1 %notrhs5, %notlhs5
  %tmp_32 = fcmp olt float %x_1, 1.000000e+03
  %tmp_33 = and i1 %tmp_31, %tmp_32
  %x_2 = select i1 %tmp_33, float %x_1, float 1.000000e+03
  store float %x_integral_new, float* @x_integral, align 4
  br label %_ifconv

_ifconv:                                          ; preds = %_ifconv1, %._crit_edge
  %x_assign = phi float [ undef, %._crit_edge ], [ %x_2, %_ifconv1 ]
  %p_Val2_s = bitcast float %x_assign to i32
  %loc_V = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_Val2_s, i32 23, i32 30) nounwind
  %loc_V_1 = trunc i32 %p_Val2_s to i23
  %p_Result_s = call i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1 true, i23 %loc_V_1) nounwind
  %tmp_2_i_i = zext i24 %p_Result_s to i62
  %tmp_i_i_i_cast9 = zext i8 %loc_V to i9
  %sh_assign = add i9 -127, %tmp_i_i_i_cast9
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign, i32 8)
  %tmp_4_i_i = sub i8 127, %loc_V
  %tmp_4_i_i_cast = sext i8 %tmp_4_i_i to i9
  %sh_assign_1 = select i1 %isNeg, i9 %tmp_4_i_i_cast, i9 %sh_assign
  %sh_assign_1_cast = sext i9 %sh_assign_1 to i32
  %sh_assign_1_cast_cast = sext i9 %sh_assign_1 to i24
  %tmp_6_i_i = zext i32 %sh_assign_1_cast to i62
  %tmp_7_i_i = lshr i24 %p_Result_s, %sh_assign_1_cast_cast
  %tmp_9_i_i = shl i62 %tmp_2_i_i, %tmp_6_i_i
  %tmp_39 = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %tmp_7_i_i, i32 23)
  %tmp_34 = zext i1 %tmp_39 to i10
  %tmp_35 = call i10 @_ssdm_op_PartSelect.i10.i62.i32.i32(i62 %tmp_9_i_i, i32 23, i32 32)
  %tmp_36 = select i1 %isNeg, i10 %tmp_34, i10 %tmp_35
  call void @_ssdm_op_Write.ap_none.i10P(i10* %u, i10 %tmp_36) nounwind
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

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i12 @_ssdm_op_Read.ap_auto.i12(i12) {
entry:
  ret i12 %0
}

define weak float @_ssdm_op_Read.ap_auto.float(float) {
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

define weak i10 @_ssdm_op_PartSelect.i10.i62.i32.i32(i62, i32, i32) nounwind readnone {
entry:
  %empty = call i62 @llvm.part.select.i62(i62 %0, i32 %1, i32 %2)
  %empty_7 = trunc i62 %empty to i10
  ret i10 %empty_7
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

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_14 = shl i2 1, %empty
  %empty_15 = and i2 %0, %empty_14
  %empty_16 = icmp ne i2 %empty_15, 0
  ret i1 %empty_16
}

define weak i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1, i23) nounwind readnone {
entry:
  %empty = zext i1 %0 to i24
  %empty_17 = zext i23 %1 to i24
  %empty_18 = shl i24 %empty, 23
  %empty_19 = or i24 %empty_18, %empty_17
  ret i24 %empty_19
}

declare void @_GLOBAL__I_a() nounwind

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
!10 = metadata !{metadata !"v_ref", metadata !11, metadata !"float", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 11, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"v_meas", metadata !11, metadata !"uint12", i32 0, i32 11}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 31, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"Kp", metadata !11, metadata !"float", i32 0, i32 31}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 31, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"Ki2", metadata !11, metadata !"float", i32 0, i32 31}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 9, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"u", metadata !5, metadata !"uint10", i32 0, i32 9}
