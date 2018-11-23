/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void digital_compensator(float llvm_cbe_v_ref, signed short llvm_cbe_v_meas, float llvm_cbe_Kp, float llvm_cbe_Ki2, signed short *llvm_cbe_u);


/* Global Variable Definitions and Initialization */
static unsigned char aesl_internal_digital_compensator_OC_sat;
static float aesl_internal_digital_compensator_OC_x_integral;


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }
static const ConstantDoubleTy FPConstant0 = 0x400A666666666666ULL;    /* 3.300000e+00 */
static const ConstantDoubleTy FPConstant1 = 0x3F30000000000000ULL;    /* 2.441406e-04 */
static const ConstantDoubleTy FPConstant2 = 0x4020000000000000ULL;    /* 8.000000e+00 */
static const ConstantFloatTy FPConstant3 = 0x447A0000U;    /* 1.000000e+03 */

void digital_compensator(float llvm_cbe_v_ref, signed short llvm_cbe_v_meas, float llvm_cbe_Kp, float llvm_cbe_Ki2, signed short *llvm_cbe_u) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  double llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  double llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  double llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  double llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  float llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  float llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  unsigned char llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_or_2e_cond_count = 0;
  bool llvm_cbe_or_2e_cond;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  float llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  float llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  float llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  float llvm_cbe_tmp__12;
  float llvm_cbe_tmp__12__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned char llvm_cbe_storemerge1;
  unsigned char llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  float llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  float llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  float llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  float llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  float llvm_cbe_tmp__17;
  float llvm_cbe_tmp__17__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  unsigned short llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @digital_compensator\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = zext i12 %%v_meas to i32, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_11_count);
  llvm_cbe_tmp__1 = (unsigned int )((unsigned int )(unsigned short )llvm_cbe_v_meas&4095U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sitofp i32 %%1 to double, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_12_count);
  llvm_cbe_tmp__2 = (double )((double )(signed int )llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__2, *(long long*)(&llvm_cbe_tmp__2));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = fmul double %%2, 3.300000e+00, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_13_count);
  llvm_cbe_tmp__3 = (double )llvm_cbe_tmp__2 * (*(double*)&FPConstant0);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__3, *(long long*)(&llvm_cbe_tmp__3));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = fmul double %%3, 0x3F30000000000000, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_14_count);
  llvm_cbe_tmp__4 = (double )llvm_cbe_tmp__3 * (*(double*)&FPConstant1);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__4, *(long long*)(&llvm_cbe_tmp__4));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = fmul double %%4, 8.000000e+00, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_15_count);
  llvm_cbe_tmp__5 = (double )llvm_cbe_tmp__4 * (*(double*)&FPConstant2);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__5, *(long long*)(&llvm_cbe_tmp__5));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = fptrunc double %%5 to float, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_16_count);
  llvm_cbe_tmp__6 = (float )((float )llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__6, *(int*)(&llvm_cbe_tmp__6));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = fsub float %%v_ref, %%6, !dbg !2 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__7 = (float )((float )(llvm_cbe_v_ref - llvm_cbe_tmp__6));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__7, *(int*)(&llvm_cbe_tmp__7));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i8* @aesl_internal_digital_compensator.sat, align 1, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__8 = (unsigned char )*(&aesl_internal_digital_compensator_OC_sat);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
  if (((( char )llvm_cbe_tmp__8) < (( char )((unsigned char )0)))) {
    goto llvm_cbe_tmp__19;
  } else {
    goto llvm_cbe_thread_2d_pre_2d_split;
  }

llvm_cbe_tmp__19:
  if ((llvm_fcmp_olt(llvm_cbe_tmp__7, 0x0p0))) {
    goto llvm_cbe_tmp__20;
  } else {
    goto llvm_cbe_thread_2d_pre_2d_split_2e_thread;
  }

llvm_cbe_thread_2d_pre_2d_split:
if (AESL_DEBUG_TRACE)
printf("\n  %%or.cond = and i1 %%12, %%13, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_or_2e_cond_count);
  llvm_cbe_or_2e_cond = (bool )((((( char )llvm_cbe_tmp__8) > (( char )((unsigned char )0))) & (llvm_fcmp_ogt(llvm_cbe_tmp__7, 0x0p0)))&1);
if (AESL_DEBUG_TRACE)
printf("\nor.cond = 0x%X\n", llvm_cbe_or_2e_cond);
  if (llvm_cbe_or_2e_cond) {
    goto llvm_cbe_tmp__20;
  } else {
    goto llvm_cbe_thread_2d_pre_2d_split_2e_thread;
  }

llvm_cbe_tmp__20:
  goto llvm_cbe_tmp__21;

llvm_cbe_thread_2d_pre_2d_split_2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load float* @aesl_internal_digital_compensator.x_integral, align 4, !dbg !3 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_34_count);
  llvm_cbe_tmp__9 = (float )*(&aesl_internal_digital_compensator_OC_x_integral);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__9, *(int*)(&llvm_cbe_tmp__9));
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = fmul float %%7, %%Ki2, !dbg !3 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_35_count);
  llvm_cbe_tmp__10 = (float )((float )(llvm_cbe_tmp__7 * llvm_cbe_Ki2));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__10, *(int*)(&llvm_cbe_tmp__10));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = fadd float %%15, %%16, !dbg !3 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_36_count);
  llvm_cbe_tmp__11 = (float )((float )(llvm_cbe_tmp__9 + llvm_cbe_tmp__10));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__11, *(int*)(&llvm_cbe_tmp__11));
if (AESL_DEBUG_TRACE)
printf("\n  store float %%17, float* @aesl_internal_digital_compensator.x_integral, align 4, !dbg !3 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_37_count);
  *(&aesl_internal_digital_compensator_OC_x_integral) = llvm_cbe_tmp__11;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__11);
  if ((llvm_fcmp_olt(llvm_cbe_tmp__11, 0x0p0))) {
    goto llvm_cbe_tmp__22;
  } else {
    goto llvm_cbe_tmp__23;
  }

llvm_cbe_tmp__22:
if (AESL_DEBUG_TRACE)
printf("\n  store float 0.000000e+00, float* @aesl_internal_digital_compensator.x_integral, align 4, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_40_count);
  *(&aesl_internal_digital_compensator_OC_x_integral) = 0x0p0;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", 0x0p0);
  llvm_cbe_tmp__12__PHI_TEMPORARY = (float )0x0p0;   /* for PHI node */
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned char )((unsigned char )-1);   /* for PHI node */
  goto llvm_cbe_tmp__24;

llvm_cbe_tmp__23:
  if ((llvm_fcmp_ogt(llvm_cbe_tmp__11, (*(float*)&FPConstant3)))) {
    goto llvm_cbe_tmp__25;
  } else {
    llvm_cbe_tmp__12__PHI_TEMPORARY = (float )llvm_cbe_tmp__11;   /* for PHI node */
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned char )((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_tmp__24;
  }

llvm_cbe_tmp__25:
if (AESL_DEBUG_TRACE)
printf("\n  store float 1.000000e+03, float* @aesl_internal_digital_compensator.x_integral, align 4, !dbg !5 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_44_count);
  *(&aesl_internal_digital_compensator_OC_x_integral) = (*(float*)&FPConstant3);
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", (*(float*)&FPConstant3));
  llvm_cbe_tmp__12__PHI_TEMPORARY = (float )(*(float*)&FPConstant3);   /* for PHI node */
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned char )((unsigned char )1);   /* for PHI node */
  goto llvm_cbe_tmp__24;

llvm_cbe_tmp__24:
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = phi float [ 0.000000e+00, %%19 ], [ 1.000000e+03, %%22 ], [ %%17, %%20  for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__12 = (float )llvm_cbe_tmp__12__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = %f",llvm_cbe_tmp__12);
printf("\n = %f",0x0p0);
printf("\n = %f",(*(float*)&FPConstant3));
printf("\n = %f",llvm_cbe_tmp__11);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i8 [ -1, %%19 ], [ 1, %%22 ], [ 0, %%20  for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned char )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",((unsigned char )-1));
printf("\n = 0x%X",((unsigned char )1));
printf("\n = 0x%X",((unsigned char )0));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%storemerge1, i8* @aesl_internal_digital_compensator.sat, align 1, !dbg !5 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_47_count);
  *(&aesl_internal_digital_compensator_OC_sat) = llvm_cbe_storemerge1;
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = fmul float %%7, %%Kp, !dbg !3 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_48_count);
  llvm_cbe_tmp__13 = (float )((float )(llvm_cbe_tmp__7 * llvm_cbe_Kp));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__13, *(int*)(&llvm_cbe_tmp__13));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = fadd float %%25, %%24, !dbg !3 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_49_count);
  llvm_cbe_tmp__14 = (float )((float )(llvm_cbe_tmp__13 + llvm_cbe_tmp__12));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__14, *(int*)(&llvm_cbe_tmp__14));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = select i1 %%27, float %%26, float 0.000000e+00, !dbg !5 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_57_count);
  llvm_cbe_tmp__15 = (float )(((llvm_fcmp_ogt(llvm_cbe_tmp__14, 0x0p0))) ? ((float )llvm_cbe_tmp__14) : ((float )0x0p0));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__15, *(int*)(&llvm_cbe_tmp__15));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = select i1 %%29, float %%28, float 1.000000e+03, !dbg !5 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_65_count);
  llvm_cbe_tmp__16 = (float )(((llvm_fcmp_olt(llvm_cbe_tmp__15, (*(float*)&FPConstant3)))) ? ((float )llvm_cbe_tmp__15) : ((float )(*(float*)&FPConstant3)));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__16, *(int*)(&llvm_cbe_tmp__16));
  llvm_cbe_tmp__17__PHI_TEMPORARY = (float )llvm_cbe_tmp__16;   /* for PHI node */
  goto llvm_cbe_tmp__21;

llvm_cbe_tmp__21:
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = phi float [ %%30, %%23 ], [ undef, %%14  for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_73_count);
  llvm_cbe_tmp__17 = (float )llvm_cbe_tmp__17__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = %f",llvm_cbe_tmp__17);
printf("\n = %f",llvm_cbe_tmp__16);
printf("\n = %f",((float )/*UNDEF*/0));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = fptoui float %%32 to i10, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__18 = (unsigned short )((unsigned short )llvm_cbe_tmp__17&1023U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  store i10 %%33, i10* %%u, align 2, !dbg !4 for 0x%I64xth hint within @digital_compensator  --> \n", ++aesl_llvm_cbe_75_count);
  *llvm_cbe_u = ((llvm_cbe_tmp__18) & 1023ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @digital_compensator}\n");
  return;
}

