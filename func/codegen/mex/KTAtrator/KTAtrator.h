/*
 * KTAtrator.h
 *
 * Code generation for function 'KTAtrator'
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
CODEGEN_EXPORT_SYM void KTAtrator(const emlrtStack *sp, struct0_T *par, const
  real_T x0_data[], const int32_T x0_size[2], real_T tTrans, real_T tTotal,
  const emxArray_char_T *ktIterN, const emxArray_char_T *plotStyle, boolean_T
  plotTimeEvol, boolean_T ignore_H_KTz, emxArray_real_T *xData);

/* End of code generation (KTAtrator.h) */
