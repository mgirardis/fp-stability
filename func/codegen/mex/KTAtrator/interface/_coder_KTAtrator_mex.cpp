/*
 * _coder_KTAtrator_mex.cpp
 *
 * Code generation for function '_coder_KTAtrator_mex'
 *
 */

/* Include files */
#include "_coder_KTAtrator_mex.h"
#include "KTAtrator.h"
#include "KTAtrator_data.h"
#include "KTAtrator_initialize.h"
#include "KTAtrator_terminate.h"
#include "_coder_KTAtrator_api.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void KTAtrator_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[8]);

/* Function Definitions */
void KTAtrator_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
  mxArray *prhs[8])
{
  const mxArray *outputs[1];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 8) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 8, 4, 9,
                        "KTAtrator");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 9,
                        "KTAtrator");
  }

  /* Call the function. */
  KTAtrator_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(KTAtrator_atexit);

  /* Module initialization. */
  KTAtrator_initialize();

  /* Dispatch the entry-point. */
  KTAtrator_mexFunction(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  KTAtrator_terminate();
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_KTAtrator_mex.cpp) */
