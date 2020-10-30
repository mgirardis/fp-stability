/*
 * _coder_getRoots_mex.cpp
 *
 * Code generation for function '_coder_getRoots_mex'
 *
 */

/* Include files */
#include "_coder_getRoots_mex.h"
#include "_coder_getRoots_api.h"
#include "getRoots.h"
#include "getRoots_data.h"
#include "getRoots_initialize.h"
#include "getRoots_terminate.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void getRoots_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[2]);

/* Function Definitions */
void getRoots_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
  mxArray *prhs[2])
{
  const mxArray *outputs[1];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 2, 4, 8,
                        "getRoots");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 8,
                        "getRoots");
  }

  /* Call the function. */
  getRoots_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(getRoots_atexit);

  /* Module initialization. */
  getRoots_initialize();

  /* Dispatch the entry-point. */
  getRoots_mexFunction(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  getRoots_terminate();
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_getRoots_mex.cpp) */
