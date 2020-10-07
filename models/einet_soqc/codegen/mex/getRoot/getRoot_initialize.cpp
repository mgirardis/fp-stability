/*
 * getRoot_initialize.cpp
 *
 * Code generation for function 'getRoot_initialize'
 *
 */

/* Include files */
#include "getRoot_initialize.h"
#include "_coder_getRoot_mex.h"
#include "getRoot.h"
#include "getRoot_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getRoot_initialize()
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (getRoot_initialize.cpp) */
