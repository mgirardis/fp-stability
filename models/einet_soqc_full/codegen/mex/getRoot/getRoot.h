/*
 * getRoot.h
 *
 * Code generation for function 'getRoot'
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
#include "getRoot_types.h"

/* Function Declarations */
CODEGEN_EXPORT_SYM void getRoot(const emlrtStack *sp, const emxArray_real_T *p,
  real_T k, real_T dim, emxArray_creal_T *r);

/* End of code generation (getRoot.h) */
