/*
 * _coder_getRoot_mex.cpp
 *
 * Code generation for function '_coder_getRoot_mex'
 *
 */

/* Include files */
#include "_coder_getRoot_mex.h"
#include "_coder_getRoot_api.h"
#include "getRoot.h"
#include "getRoot_data.h"
#include "getRoot_initialize.h"
#include "getRoot_terminate.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void getRoot_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[3]);

/* Function Definitions */
void getRoot_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
  mxArray *prhs[3])
{
  const mxArray *outputs[1];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 3) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 3, 4, 7,
                        "getRoot");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 7,
                        "getRoot");
  }

  /* Call the function. */
  getRoot_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(getRoot_atexit);

  /* Module initialization. */
  getRoot_initialize();

  /* Dispatch the entry-point. */
  getRoot_mexFunction(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  getRoot_terminate();
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_getRoot_mex.cpp) */
