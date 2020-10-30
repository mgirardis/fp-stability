/*
 * getRoot_terminate.cpp
 *
 * Code generation for function 'getRoot_terminate'
 *
 */

/* Include files */
#include "getRoot_terminate.h"
#include "_coder_getRoot_mex.h"
#include "getRoot.h"
#include "getRoot_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getRoot_atexit()
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

void getRoot_terminate()
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (getRoot_terminate.cpp) */
