/*
 * getRoots_emxutil.h
 *
 * Code generation for function 'getRoots_emxutil'
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
#include "getRoots_types.h"

/* Function Declarations */
CODEGEN_EXPORT_SYM void emxEnsureCapacity_creal_T(const emlrtStack *sp,
  emxArray_creal_T *emxArray, int32_T oldNumel, const emlrtRTEInfo *srcLocation);
CODEGEN_EXPORT_SYM void emxEnsureCapacity_real_T(const emlrtStack *sp,
  emxArray_real_T *emxArray, int32_T oldNumel, const emlrtRTEInfo *srcLocation);
CODEGEN_EXPORT_SYM void emxFree_creal_T(emxArray_creal_T **pEmxArray);
CODEGEN_EXPORT_SYM void emxFree_real_T(emxArray_real_T **pEmxArray);
CODEGEN_EXPORT_SYM void emxInit_creal_T(const emlrtStack *sp, emxArray_creal_T **
  pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T
  doPush);
CODEGEN_EXPORT_SYM void emxInit_real_T(const emlrtStack *sp, emxArray_real_T
  **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T
  doPush);

/* End of code generation (getRoots_emxutil.h) */
