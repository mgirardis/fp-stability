/*
 * KTAtrator_emxutil.h
 *
 * Code generation for function 'KTAtrator_emxutil'
 *
 */

#pragma once

/* Include files */
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "KTAtrator_types.h"

/* Function Declarations */
CODEGEN_EXPORT_SYM void emxEnsureCapacity_char_T(const emlrtStack *sp,
  emxArray_char_T *emxArray, int32_T oldNumel, const emlrtRTEInfo *srcLocation);
CODEGEN_EXPORT_SYM void emxEnsureCapacity_int32_T(const emlrtStack *sp,
  emxArray_int32_T *emxArray, int32_T oldNumel, const emlrtRTEInfo *srcLocation);
CODEGEN_EXPORT_SYM void emxEnsureCapacity_real_T(const emlrtStack *sp,
  emxArray_real_T *emxArray, int32_T oldNumel, const emlrtRTEInfo *srcLocation);
CODEGEN_EXPORT_SYM void emxFreeStruct_struct0_T(struct0_T *pStruct);
CODEGEN_EXPORT_SYM void emxFree_char_T(emxArray_char_T **pEmxArray);
CODEGEN_EXPORT_SYM void emxFree_int32_T(emxArray_int32_T **pEmxArray);
CODEGEN_EXPORT_SYM void emxFree_real_T(emxArray_real_T **pEmxArray);
CODEGEN_EXPORT_SYM void emxInitStruct_struct0_T(const emlrtStack *sp, struct0_T *
  pStruct, const emlrtRTEInfo *srcLocation, boolean_T doPush);
CODEGEN_EXPORT_SYM void emxInit_char_T(const emlrtStack *sp, emxArray_char_T
  **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T
  doPush);
CODEGEN_EXPORT_SYM void emxInit_int32_T(const emlrtStack *sp, emxArray_int32_T **
  pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T
  doPush);
CODEGEN_EXPORT_SYM void emxInit_real_T(const emlrtStack *sp, emxArray_real_T
  **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T
  doPush);

/* End of code generation (KTAtrator_emxutil.h) */
