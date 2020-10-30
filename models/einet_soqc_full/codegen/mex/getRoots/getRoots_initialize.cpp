/*
 * getRoots_initialize.cpp
 *
 * Code generation for function 'getRoots_initialize'
 *
 */

/* Include files */
#include "getRoots_initialize.h"
#include "_coder_getRoots_mex.h"
#include "getRoots.h"
#include "getRoots_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getRoots_initialize()
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

/* End of code generation (getRoots_initialize.cpp) */
