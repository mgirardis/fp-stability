/*
 * getRoots_terminate.cpp
 *
 * Code generation for function 'getRoots_terminate'
 *
 */

/* Include files */
#include "getRoots_terminate.h"
#include "_coder_getRoots_mex.h"
#include "getRoots.h"
#include "getRoots_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getRoots_atexit()
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

void getRoots_terminate()
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (getRoots_terminate.cpp) */
