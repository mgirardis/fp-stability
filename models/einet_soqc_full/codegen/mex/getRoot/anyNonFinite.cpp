/*
 * anyNonFinite.cpp
 *
 * Code generation for function 'anyNonFinite'
 *
 */

/* Include files */
#include "anyNonFinite.h"
#include "eml_int_forloop_overflow_check.h"
#include "getRoot.h"
#include "getRoot_data.h"
#include "mwmathutil.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo u_emlrtRSI = { 29,  /* lineNo */
  "anyNonFinite",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\anyNonFinite.m"/* pathName */
};

static emlrtRSInfo v_emlrtRSI = { 44,  /* lineNo */
  "vAllOrAny",                         /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\vAllOrAny.m"/* pathName */
};

static emlrtRSInfo w_emlrtRSI = { 103, /* lineNo */
  "flatVectorAllOrAny",                /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\vAllOrAny.m"/* pathName */
};

/* Function Definitions */
boolean_T anyNonFinite(const emlrtStack *sp, const emxArray_creal_T *x)
{
  boolean_T p;
  int32_T nx;
  int32_T k;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &u_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  b_st.site = &v_emlrtRSI;
  nx = x->size[0] * x->size[1];
  p = true;
  c_st.site = &w_emlrtRSI;
  if ((1 <= nx) && (nx > 2147483646)) {
    d_st.site = &n_emlrtRSI;
    check_forloop_overflow_error(&d_st);
  }

  for (k = 0; k < nx; k++) {
    if ((!p) || (muDoubleScalarIsInf(x->data[k].re) || muDoubleScalarIsInf
                 (x->data[k].im) || (muDoubleScalarIsNaN(x->data[k].re) ||
          muDoubleScalarIsNaN(x->data[k].im)))) {
      p = false;
    }
  }

  return !p;
}

/* End of code generation (anyNonFinite.cpp) */
