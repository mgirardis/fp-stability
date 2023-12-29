/*
 * KTAtrator_terminate.cpp
 *
 * Code generation for function 'KTAtrator_terminate'
 *
 */

/* Include files */
#include "KTAtrator_terminate.h"
#include "KTAtrator.h"
#include "KTAtrator_data.h"
#include "_coder_KTAtrator_mex.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void KTAtrator_atexit()
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void KTAtrator_terminate()
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (KTAtrator_terminate.cpp) */
