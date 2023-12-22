/*
 * KTAtrator_initialize.cpp
 *
 * Code generation for function 'KTAtrator_initialize'
 *
 */

/* Include files */
#include "KTAtrator_initialize.h"
#include "KTAtrator.h"
#include "KTAtrator_data.h"
#include "_coder_KTAtrator_mex.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void KTAtrator_initialize()
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

/* End of code generation (KTAtrator_initialize.cpp) */
