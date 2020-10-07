/*
 * roots.cpp
 *
 * Code generation for function 'roots'
 *
 */

/* Include files */
#include "roots.h"
#include "eig.h"
#include "eml_int_forloop_overflow_check.h"
#include "getRoot.h"
#include "getRoot_data.h"
#include "getRoot_emxutil.h"
#include "indexShapeCheck.h"
#include "mwmathutil.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo e_emlrtRSI = { 77,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo f_emlrtRSI = { 103, /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo g_emlrtRSI = { 98,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo h_emlrtRSI = { 97,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo i_emlrtRSI = { 94,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo j_emlrtRSI = { 88,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo k_emlrtRSI = { 82,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo l_emlrtRSI = { 27,  /* lineNo */
  "roots",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRSInfo m_emlrtRSI = { 110, /* lineNo */
  "any_nonfinite",                     /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pathName */
};

static emlrtRTEInfo emlrtRTEI = { 28,  /* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo b_emlrtRTEI = { 51,/* lineNo */
  1,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo c_emlrtRTEI = { 54,/* lineNo */
  1,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo d_emlrtRTEI = { 85,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo e_emlrtRTEI = { 102,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtDCInfo c_emlrtDCI = { 32,  /* lineNo */
  1,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m",/* pName */
  4                                    /* checkKind */
};

static emlrtRTEInfo u_emlrtRTEI = { 32,/* lineNo */
  1,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo v_emlrtRTEI = { 1, /* lineNo */
  14,                                  /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo w_emlrtRTEI = { 77,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo x_emlrtRTEI = { 87,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo y_emlrtRTEI = { 82,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo ab_emlrtRTEI = { 103,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo bb_emlrtRTEI = { 59,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

static emlrtRTEInfo cb_emlrtRTEI = { 97,/* lineNo */
  5,                                   /* colNo */
  "roots",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\polyfun\\roots.m"/* pName */
};

/* Function Definitions */
void b_roots(const emlrtStack *sp, const emxArray_real_T *c, emxArray_creal_T *r)
{
  boolean_T p;
  int32_T k2;
  boolean_T exitg1;
  real_T x;
  int32_T i;
  int32_T k1;
  int32_T nTrailingZeros;
  emxArray_real_T *ctmp;
  int32_T companDim;
  int32_T iv[2];
  boolean_T exitg2;
  emxArray_creal_T *a;
  emxArray_creal_T *eiga;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);
  st.site = &l_emlrtRSI;
  p = false;
  b_st.site = &m_emlrtRSI;
  if ((1 <= c->size[1]) && (c->size[1] > 2147483646)) {
    c_st.site = &n_emlrtRSI;
    check_forloop_overflow_error(&c_st);
  }

  k2 = 0;
  exitg1 = false;
  while ((!exitg1) && (k2 <= c->size[1] - 1)) {
    x = c->data[k2];
    if (muDoubleScalarIsInf(x) || muDoubleScalarIsNaN(x)) {
      p = true;
      exitg1 = true;
    } else {
      k2++;
    }
  }

  if (p) {
    emlrtErrorWithMessageIdR2018a(sp, &emlrtRTEI, "MATLAB:roots:NonFiniteInput",
      "MATLAB:roots:NonFiniteInput", 0);
  }

  i = c->size[1] - 1;
  if (i < 0) {
    emlrtNonNegativeCheckR2012b(static_cast<real_T>(i), &c_emlrtDCI, sp);
  }

  k2 = r->size[0];
  r->size[0] = i;
  emxEnsureCapacity_creal_T(sp, r, k2, &u_emlrtRTEI);
  k2 = c->size[1] - 1;
  if (k2 < 0) {
    emlrtNonNegativeCheckR2012b(static_cast<real_T>(k2), &c_emlrtDCI, sp);
  }

  for (i = 0; i < k2; i++) {
    r->data[i].re = 0.0;
    r->data[i].im = 0.0;
  }

  k1 = 1;
  while ((k1 <= c->size[1]) && (!(c->data[k1 - 1] != 0.0))) {
    k1++;
  }

  k2 = c->size[1];
  while ((k2 >= k1) && (!(c->data[k2 - 1] != 0.0))) {
    k2--;
  }

  if (k2 > c->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &b_emlrtRTEI,
      "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
  }

  nTrailingZeros = c->size[1] - k2;
  if (nTrailingZeros > c->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &c_emlrtRTEI,
      "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
  }

  if (k1 < k2) {
    emxInit_real_T(sp, &ctmp, 2, &bb_emlrtRTEI, true);
    companDim = k2 - k1;
    i = ctmp->size[0] * ctmp->size[1];
    ctmp->size[0] = c->size[0];
    ctmp->size[1] = c->size[1];
    emxEnsureCapacity_real_T(sp, ctmp, i, &v_emlrtRTEI);
    exitg1 = false;
    while ((!exitg1) && (companDim > 0)) {
      k2 = 0;
      exitg2 = false;
      while ((!exitg2) && (k2 + 1 <= companDim)) {
        ctmp->data[k2] = c->data[k1 + k2] / c->data[k1 - 1];
        if (muDoubleScalarIsInf(muDoubleScalarAbs(ctmp->data[k2]))) {
          exitg2 = true;
        } else {
          k2++;
        }
      }

      if (k2 + 1 > companDim) {
        exitg1 = true;
      } else {
        k1++;
        companDim--;
      }
    }

    if (companDim < 1) {
      if (1 > nTrailingZeros) {
        i = 0;
      } else {
        i = nTrailingZeros;
      }

      iv[0] = 1;
      iv[1] = i;
      st.site = &k_emlrtRSI;
      indexShapeCheck(&st, r->size[0], iv);
      k2 = r->size[0];
      r->size[0] = i;
      emxEnsureCapacity_creal_T(sp, r, k2, &y_emlrtRTEI);
    } else {
      if (companDim > c->size[1]) {
        emlrtErrorWithMessageIdR2018a(sp, &d_emlrtRTEI,
          "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
      }

      emxInit_creal_T(sp, &a, 2, &x_emlrtRTEI, true);
      i = a->size[0] * a->size[1];
      a->size[0] = companDim;
      a->size[1] = companDim;
      emxEnsureCapacity_creal_T(sp, a, i, &x_emlrtRTEI);
      k2 = companDim * companDim;
      for (i = 0; i < k2; i++) {
        a->data[i].re = 0.0;
        a->data[i].im = 0.0;
      }

      st.site = &j_emlrtRSI;
      for (k2 = 0; k2 <= companDim - 2; k2++) {
        a->data[a->size[0] * k2].re = -ctmp->data[k2];
        a->data[a->size[0] * k2].im = 0.0;
        a->data[(k2 + a->size[0] * k2) + 1].re = 1.0;
        a->data[(k2 + a->size[0] * k2) + 1].im = 0.0;
      }

      a->data[a->size[0] * (companDim - 1)].re = -ctmp->data[companDim - 1];
      a->data[a->size[0] * (companDim - 1)].im = 0.0;
      st.site = &i_emlrtRSI;
      if ((1 <= nTrailingZeros) && (nTrailingZeros > 2147483646)) {
        b_st.site = &n_emlrtRSI;
        check_forloop_overflow_error(&b_st);
      }

      for (k2 = 0; k2 < nTrailingZeros; k2++) {
        r->data[k2].re = 0.0;
        r->data[k2].im = 0.0;
      }

      emxInit_creal_T(sp, &eiga, 1, &cb_emlrtRTEI, true);
      st.site = &h_emlrtRSI;
      eig(&st, a, eiga);
      st.site = &g_emlrtRSI;
      emxFree_creal_T(&a);
      for (k2 = 0; k2 < companDim; k2++) {
        r->data[k2 + nTrailingZeros] = eiga->data[k2];
      }

      emxFree_creal_T(&eiga);
      k2 = nTrailingZeros + companDim;
      if (k2 > c->size[1]) {
        emlrtErrorWithMessageIdR2018a(sp, &e_emlrtRTEI,
          "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
      }

      if (1 > k2) {
        i = 0;
      } else {
        i = k2;
      }

      iv[0] = 1;
      iv[1] = i;
      st.site = &f_emlrtRSI;
      indexShapeCheck(&st, r->size[0], iv);
      k2 = r->size[0];
      r->size[0] = i;
      emxEnsureCapacity_creal_T(sp, r, k2, &ab_emlrtRTEI);
    }

    emxFree_real_T(&ctmp);
  } else {
    if (1 > nTrailingZeros) {
      i = 0;
    } else {
      i = nTrailingZeros;
    }

    iv[0] = 1;
    iv[1] = i;
    st.site = &e_emlrtRSI;
    indexShapeCheck(&st, r->size[0], iv);
    k2 = r->size[0];
    r->size[0] = i;
    emxEnsureCapacity_creal_T(sp, r, k2, &w_emlrtRTEI);
  }

  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

void roots(const emlrtStack *sp, const emxArray_real_T *c, emxArray_creal_T *r)
{
  boolean_T p;
  int32_T k2;
  boolean_T exitg1;
  int32_T i;
  int32_T k1;
  int32_T nTrailingZeros;
  emxArray_real_T *ctmp;
  int32_T companDim;
  int32_T iv[2];
  boolean_T exitg2;
  emxArray_creal_T *a;
  emxArray_creal_T *eiga;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);
  st.site = &l_emlrtRSI;
  p = false;
  b_st.site = &m_emlrtRSI;
  if ((1 <= c->size[0]) && (c->size[0] > 2147483646)) {
    c_st.site = &n_emlrtRSI;
    check_forloop_overflow_error(&c_st);
  }

  k2 = 0;
  exitg1 = false;
  while ((!exitg1) && (k2 <= c->size[0] - 1)) {
    if (muDoubleScalarIsInf(c->data[k2]) || muDoubleScalarIsNaN(c->data[k2])) {
      p = true;
      exitg1 = true;
    } else {
      k2++;
    }
  }

  if (p) {
    emlrtErrorWithMessageIdR2018a(sp, &emlrtRTEI, "MATLAB:roots:NonFiniteInput",
      "MATLAB:roots:NonFiniteInput", 0);
  }

  i = c->size[0] - 1;
  if (i < 0) {
    emlrtNonNegativeCheckR2012b(static_cast<real_T>(i), &c_emlrtDCI, sp);
  }

  k2 = r->size[0];
  r->size[0] = i;
  emxEnsureCapacity_creal_T(sp, r, k2, &u_emlrtRTEI);
  k2 = c->size[0] - 1;
  if (k2 < 0) {
    emlrtNonNegativeCheckR2012b(static_cast<real_T>(k2), &c_emlrtDCI, sp);
  }

  for (i = 0; i < k2; i++) {
    r->data[i].re = 0.0;
    r->data[i].im = 0.0;
  }

  k1 = 1;
  while ((k1 <= c->size[0]) && (!(c->data[k1 - 1] != 0.0))) {
    k1++;
  }

  k2 = c->size[0];
  while ((k2 >= k1) && (!(c->data[k2 - 1] != 0.0))) {
    k2--;
  }

  if (k2 > c->size[0]) {
    emlrtErrorWithMessageIdR2018a(sp, &b_emlrtRTEI,
      "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
  }

  nTrailingZeros = c->size[0] - k2;
  if (nTrailingZeros > c->size[0]) {
    emlrtErrorWithMessageIdR2018a(sp, &c_emlrtRTEI,
      "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
  }

  if (k1 < k2) {
    emxInit_real_T(sp, &ctmp, 1, &bb_emlrtRTEI, true);
    companDim = k2 - k1;
    i = ctmp->size[0];
    ctmp->size[0] = c->size[0];
    emxEnsureCapacity_real_T(sp, ctmp, i, &v_emlrtRTEI);
    exitg1 = false;
    while ((!exitg1) && (companDim > 0)) {
      k2 = 0;
      exitg2 = false;
      while ((!exitg2) && (k2 + 1 <= companDim)) {
        ctmp->data[k2] = c->data[k1 + k2] / c->data[k1 - 1];
        if (muDoubleScalarIsInf(muDoubleScalarAbs(ctmp->data[k2]))) {
          exitg2 = true;
        } else {
          k2++;
        }
      }

      if (k2 + 1 > companDim) {
        exitg1 = true;
      } else {
        k1++;
        companDim--;
      }
    }

    if (companDim < 1) {
      if (1 > nTrailingZeros) {
        i = 0;
      } else {
        i = nTrailingZeros;
      }

      iv[0] = 1;
      iv[1] = i;
      st.site = &k_emlrtRSI;
      indexShapeCheck(&st, r->size[0], iv);
      k2 = r->size[0];
      r->size[0] = i;
      emxEnsureCapacity_creal_T(sp, r, k2, &y_emlrtRTEI);
    } else {
      if (companDim > c->size[0]) {
        emlrtErrorWithMessageIdR2018a(sp, &d_emlrtRTEI,
          "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
      }

      emxInit_creal_T(sp, &a, 2, &x_emlrtRTEI, true);
      i = a->size[0] * a->size[1];
      a->size[0] = companDim;
      a->size[1] = companDim;
      emxEnsureCapacity_creal_T(sp, a, i, &x_emlrtRTEI);
      k2 = companDim * companDim;
      for (i = 0; i < k2; i++) {
        a->data[i].re = 0.0;
        a->data[i].im = 0.0;
      }

      st.site = &j_emlrtRSI;
      for (k2 = 0; k2 <= companDim - 2; k2++) {
        a->data[a->size[0] * k2].re = -ctmp->data[k2];
        a->data[a->size[0] * k2].im = 0.0;
        a->data[(k2 + a->size[0] * k2) + 1].re = 1.0;
        a->data[(k2 + a->size[0] * k2) + 1].im = 0.0;
      }

      a->data[a->size[0] * (companDim - 1)].re = -ctmp->data[companDim - 1];
      a->data[a->size[0] * (companDim - 1)].im = 0.0;
      st.site = &i_emlrtRSI;
      if ((1 <= nTrailingZeros) && (nTrailingZeros > 2147483646)) {
        b_st.site = &n_emlrtRSI;
        check_forloop_overflow_error(&b_st);
      }

      for (k2 = 0; k2 < nTrailingZeros; k2++) {
        r->data[k2].re = 0.0;
        r->data[k2].im = 0.0;
      }

      emxInit_creal_T(sp, &eiga, 1, &cb_emlrtRTEI, true);
      st.site = &h_emlrtRSI;
      eig(&st, a, eiga);
      st.site = &g_emlrtRSI;
      emxFree_creal_T(&a);
      for (k2 = 0; k2 < companDim; k2++) {
        r->data[k2 + nTrailingZeros] = eiga->data[k2];
      }

      emxFree_creal_T(&eiga);
      k2 = nTrailingZeros + companDim;
      if (k2 > c->size[0]) {
        emlrtErrorWithMessageIdR2018a(sp, &e_emlrtRTEI,
          "Coder:builtins:AssertionFailed", "Coder:builtins:AssertionFailed", 0);
      }

      if (1 > k2) {
        i = 0;
      } else {
        i = k2;
      }

      iv[0] = 1;
      iv[1] = i;
      st.site = &f_emlrtRSI;
      indexShapeCheck(&st, r->size[0], iv);
      k2 = r->size[0];
      r->size[0] = i;
      emxEnsureCapacity_creal_T(sp, r, k2, &ab_emlrtRTEI);
    }

    emxFree_real_T(&ctmp);
  } else {
    if (1 > nTrailingZeros) {
      i = 0;
    } else {
      i = nTrailingZeros;
    }

    iv[0] = 1;
    iv[1] = i;
    st.site = &e_emlrtRSI;
    indexShapeCheck(&st, r->size[0], iv);
    k2 = r->size[0];
    r->size[0] = i;
    emxEnsureCapacity_creal_T(sp, r, k2, &w_emlrtRTEI);
  }

  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (roots.cpp) */
