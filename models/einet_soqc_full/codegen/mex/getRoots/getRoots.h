/*
 * getRoots.h
 *
 * Code generation for function 'getRoots'
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
CODEGEN_EXPORT_SYM void getRoots(const emlrtStack *sp, const emxArray_real_T *p,
  real_T dim, emxArray_creal_T *r);

/* End of code generation (getRoots.h) */
