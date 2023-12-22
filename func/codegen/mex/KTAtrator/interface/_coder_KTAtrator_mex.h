/*
 * _coder_KTAtrator_mex.h
 *
 * Code generation for function '_coder_KTAtrator_mex'
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
MEXFUNCTION_LINKAGE void KTAtrator_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[8]);
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
  const mxArray *prhs[]);
emlrtCTX mexFunctionCreateRootTLS();

/* End of code generation (_coder_KTAtrator_mex.h) */
