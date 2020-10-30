/*
 * schur.cpp
 *
 * Code generation for function 'schur'
 *
 */

/* Include files */
#include "schur.h"
#include "anyNonFinite.h"
#include "eml_int_forloop_overflow_check.h"
#include "getRoots.h"
#include "getRoots_data.h"
#include "getRoots_emxutil.h"
#include "lapacke.h"
#include "rt_nonfinite.h"
#include "warning.h"

/* Variable Definitions */
static emlrtRSInfo x_emlrtRSI = { 35,  /* lineNo */
  "schur",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pathName */
};

static emlrtRSInfo y_emlrtRSI = { 43,  /* lineNo */
  "schur",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pathName */
};

static emlrtRSInfo ab_emlrtRSI = { 60, /* lineNo */
  "schur",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pathName */
};

static emlrtRSInfo bb_emlrtRSI = { 61, /* lineNo */
  "schur",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pathName */
};

static emlrtRSInfo cb_emlrtRSI = { 83, /* lineNo */
  "schur",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pathName */
};

static emlrtRSInfo db_emlrtRSI = { 48, /* lineNo */
  "triu",                              /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\elmat\\triu.m"/* pathName */
};

static emlrtRSInfo eb_emlrtRSI = { 47, /* lineNo */
  "triu",                              /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\elmat\\triu.m"/* pathName */
};

static emlrtRSInfo fb_emlrtRSI = { 15, /* lineNo */
  "xgehrd",                            /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pathName */
};

static emlrtRSInfo gb_emlrtRSI = { 84, /* lineNo */
  "ceval_xgehrd",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pathName */
};

static emlrtRSInfo ob_emlrtRSI = { 28, /* lineNo */
  "xhseqr",                            /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pathName */
};

static emlrtRSInfo pb_emlrtRSI = { 127,/* lineNo */
  "ceval_xhseqr",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pathName */
};

static emlrtRTEInfo k_emlrtRTEI = { 18,/* lineNo */
  15,                                  /* colNo */
  "schur",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pName */
};

static emlrtRTEInfo lb_emlrtRTEI = { 42,/* lineNo */
  9,                                   /* colNo */
  "schur",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pName */
};

static emlrtRTEInfo mb_emlrtRTEI = { 15,/* lineNo */
  5,                                   /* colNo */
  "xgehrd",                            /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pName */
};

static emlrtRTEInfo nb_emlrtRTEI = { 28,/* lineNo */
  9,                                   /* colNo */
  "xhseqr",                            /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pName */
};

static emlrtRTEInfo ob_emlrtRTEI = { 1,/* lineNo */
  18,                                  /* colNo */
  "schur",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\schur.m"/* pName */
};

static emlrtRTEInfo pb_emlrtRTEI = { 100,/* lineNo */
  9,                                   /* colNo */
  "xhseqr",                            /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pName */
};

/* Function Definitions */
void schur(const emlrtStack *sp, emxArray_creal_T *A)
{
  emxArray_creal_T *tau;
  int32_T m;
  int32_T istart;
  int32_T j;
  int32_T i;
  int32_T jend;
  emxArray_creal_T *w;
  ptrdiff_t info_t;
  creal_T z;
  boolean_T p;
  static const char_T fname[14] = { 'L', 'A', 'P', 'A', 'C', 'K', 'E', '_', 'z',
    'g', 'e', 'h', 'r', 'd' };

  ptrdiff_t n_t;
  boolean_T b_p;
  static const char_T b_fname[14] = { 'L', 'A', 'P', 'A', 'C', 'K', 'E', '_',
    'z', 'h', 's', 'e', 'q', 'r' };

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
  if (A->size[0] != A->size[1]) {
    emlrtErrorWithMessageIdR2018a(sp, &k_emlrtRTEI, "Coder:MATLAB:square",
      "Coder:MATLAB:square", 0);
  }

  st.site = &x_emlrtRSI;
  if (anyNonFinite(&st, A)) {
    m = A->size[0];
    istart = A->size[1];
    j = A->size[0] * A->size[1];
    A->size[0] = m;
    A->size[1] = istart;
    emxEnsureCapacity_creal_T(sp, A, j, &lb_emlrtRTEI);
    for (j = 0; j < istart; j++) {
      for (i = 0; i < m; i++) {
        A->data[i + A->size[0] * j].re = rtNaN;
        A->data[i + A->size[0] * j].im = 0.0;
      }
    }

    st.site = &y_emlrtRSI;
    m = A->size[0];
    if (1 < A->size[0]) {
      istart = 2;
      if (A->size[0] - 2 < A->size[1] - 1) {
        jend = A->size[0] - 1;
      } else {
        jend = A->size[1];
      }

      b_st.site = &eb_emlrtRSI;
      if ((1 <= jend) && (jend > 2147483646)) {
        c_st.site = &n_emlrtRSI;
        check_forloop_overflow_error(&c_st);
      }

      for (j = 0; j < jend; j++) {
        b_st.site = &db_emlrtRSI;
        if ((istart <= m) && (m > 2147483646)) {
          c_st.site = &n_emlrtRSI;
          check_forloop_overflow_error(&c_st);
        }

        for (i = istart; i <= m; i++) {
          A->data[(i + A->size[0] * j) - 1].re = 0.0;
          A->data[(i + A->size[0] * j) - 1].im = 0.0;
        }

        istart++;
      }
    }
  } else {
    emxInit_creal_T(sp, &tau, 1, &ob_emlrtRTEI, true);
    st.site = &ab_emlrtRSI;
    b_st.site = &fb_emlrtRSI;
    j = tau->size[0];
    tau->size[0] = A->size[0] - 1;
    emxEnsureCapacity_creal_T(&b_st, tau, j, &mb_emlrtRTEI);
    if (A->size[0] > 1) {
      info_t = LAPACKE_zgehrd(102, (ptrdiff_t)A->size[0], (ptrdiff_t)1,
        (ptrdiff_t)A->size[0], (lapack_complex_double *)&A->data[0], (ptrdiff_t)
        A->size[0], (lapack_complex_double *)&tau->data[0]);
      m = (int32_T)info_t;
      c_st.site = &gb_emlrtRSI;
      if (m != 0) {
        p = true;
        if (m != -5) {
          if (m == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &i_emlrtRTEI, "MATLAB:nomem",
              "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &j_emlrtRTEI,
              "Coder:toolbox:LAPACKCallErrorInfo",
              "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 14, fname, 12, m);
          }
        }
      } else {
        p = false;
      }

      if (p) {
        istart = A->size[1];
        for (j = 0; j < istart; j++) {
          jend = A->size[0];
          for (i = 0; i < jend; i++) {
            A->data[i + A->size[0] * j].re = rtNaN;
            A->data[i + A->size[0] * j].im = 0.0;
          }
        }
      }
    }

    emxFree_creal_T(&tau);
    emxInit_creal_T(&b_st, &w, 2, &pb_emlrtRTEI, true);
    st.site = &bb_emlrtRSI;
    b_st.site = &ob_emlrtRSI;
    z.re = 0.0;
    z.im = 0.0;
    n_t = (ptrdiff_t)A->size[0];
    j = w->size[0] * w->size[1];
    w->size[0] = 1;
    w->size[1] = A->size[0];
    emxEnsureCapacity_creal_T(&b_st, w, j, &nb_emlrtRTEI);
    info_t = LAPACKE_zhseqr(102, 'S', 'N', n_t, (ptrdiff_t)1, (ptrdiff_t)A->
      size[0], (lapack_complex_double *)&A->data[0], n_t, (lapack_complex_double
      *)&w->data[0], (lapack_complex_double *)&z, (ptrdiff_t)A->size[0]);
    m = (int32_T)info_t;
    c_st.site = &pb_emlrtRSI;
    emxFree_creal_T(&w);
    if (m < 0) {
      p = true;
      b_p = false;
      if (m == -7) {
        b_p = true;
      } else {
        if (m == -10) {
          b_p = true;
        }
      }

      if (!b_p) {
        if (m == -1010) {
          emlrtErrorWithMessageIdR2018a(&c_st, &i_emlrtRTEI, "MATLAB:nomem",
            "MATLAB:nomem", 0);
        } else {
          emlrtErrorWithMessageIdR2018a(&c_st, &j_emlrtRTEI,
            "Coder:toolbox:LAPACKCallErrorInfo",
            "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 14, b_fname, 12, m);
        }
      }
    } else {
      p = false;
    }

    if (p) {
      istart = A->size[1];
      for (j = 0; j < istart; j++) {
        jend = A->size[0];
        for (i = 0; i < jend; i++) {
          A->data[i + A->size[0] * j].re = rtNaN;
          A->data[i + A->size[0] * j].im = 0.0;
        }
      }
    }

    if (m != 0) {
      st.site = &cb_emlrtRSI;
      warning(&st);
    }
  }

  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (schur.cpp) */
