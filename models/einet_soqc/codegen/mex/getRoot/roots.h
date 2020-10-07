/*
 * roots.h
 *
 * Code generation for function 'roots'
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
void b_roots(const emlrtStack *sp, const emxArray_real_T *c, emxArray_creal_T *r);
void roots(const emlrtStack *sp, const emxArray_real_T *c, emxArray_creal_T *r);

/* End of code generation (roots.h) */
