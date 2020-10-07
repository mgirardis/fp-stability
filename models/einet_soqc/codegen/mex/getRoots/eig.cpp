/*
 * eig.cpp
 *
 * Code generation for function 'eig'
 *
 */

/* Include files */
#include "eig.h"
#include "anyNonFinite.h"
#include "eml_int_forloop_overflow_check.h"
#include "getRoots.h"
#include "getRoots_data.h"
#include "getRoots_emxutil.h"
#include "lapacke.h"
#include "rt_nonfinite.h"
#include "schur.h"
#include "warning.h"

/* Variable Definitions */
static emlrtRSInfo p_emlrtRSI = { 186, /* lineNo */
  "eig",                               /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pathName */
};

static emlrtRSInfo q_emlrtRSI = { 149, /* lineNo */
  "eig",                               /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pathName */
};

static emlrtRSInfo r_emlrtRSI = { 131, /* lineNo */
  "eig",                               /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pathName */
};

static emlrtRSInfo s_emlrtRSI = { 130, /* lineNo */
  "eig",                               /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pathName */
};

static emlrtRSInfo t_emlrtRSI = { 76,  /* lineNo */
  "eig",                               /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pathName */
};

static emlrtRSInfo ub_emlrtRSI = { 291,/* lineNo */
  "mainDiagZeroImag",                  /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pathName */
};

static emlrtRSInfo vb_emlrtRSI = { 33, /* lineNo */
  "xgeev",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pathName */
};

static emlrtRSInfo wb_emlrtRSI = { 101,/* lineNo */
  "ceval_xgeev",                       /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pathName */
};

static emlrtRTEInfo h_emlrtRTEI = { 57,/* lineNo */
  27,                                  /* colNo */
  "eig",                               /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pName */
};

static emlrtRTEInfo cb_emlrtRTEI = { 114,/* lineNo */
  9,                                   /* colNo */
  "eig",                               /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pName */
};

static emlrtRTEInfo db_emlrtRTEI = { 95,/* lineNo */
  9,                                   /* colNo */
  "eig",                               /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pName */
};

static emlrtRTEInfo eb_emlrtRTEI = { 80,/* lineNo */
  13,                                  /* colNo */
  "eig",                               /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pName */
};

static emlrtRTEInfo fb_emlrtRTEI = { 130,/* lineNo */
  13,                                  /* colNo */
  "eig",                               /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pName */
};

static emlrtRTEInfo gb_emlrtRTEI = { 47,/* lineNo */
  5,                                   /* colNo */
  "xgeev",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pName */
};

static emlrtRTEInfo hb_emlrtRTEI = { 131,/* lineNo */
  17,                                  /* colNo */
  "eig",                               /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\matfun\\eig.m"/* pName */
};

static emlrtRTEInfo ib_emlrtRTEI = { 33,/* lineNo */
  5,                                   /* colNo */
  "xgeev",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pName */
};

static emlrtRTEInfo jb_emlrtRTEI = { 45,/* lineNo */
  5,                                   /* colNo */
  "xgeev",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pName */
};

/* Function Definitions */
void eig(const emlrtStack *sp, const emxArray_creal_T *A, emxArray_creal_T *V)
{
  int32_T info;
  boolean_T p;
  int32_T i;
  int32_T j;
  emxArray_creal_T *b_A;
  boolean_T exitg2;
  int32_T exitg1;
  int32_T n;
  ptrdiff_t info_t;
  creal_T vl;
  creal_T vr;
  static const char_T fname[13] = { 'L', 'A', 'P', 'A', 'C', 'K', 'E', '_', 'z',
    'g', 'e', 'e', 'v' };

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
    emlrtErrorWithMessageIdR2018a(sp, &h_emlrtRTEI,
      "MATLAB:eig:inputMustBeSquareStandard",
      "MATLAB:eig:inputMustBeSquareStandard", 0);
  }

  info = 0;
  st.site = &t_emlrtRSI;
  if (anyNonFinite(&st, A)) {
    if ((A->size[0] == 1) && (A->size[1] == 1)) {
      i = V->size[0];
      V->size[0] = 1;
      emxEnsureCapacity_creal_T(sp, V, i, &eb_emlrtRTEI);
      V->data[0].re = rtNaN;
      V->data[0].im = 0.0;
    } else {
      i = V->size[0];
      V->size[0] = A->size[0];
      emxEnsureCapacity_creal_T(sp, V, i, &db_emlrtRTEI);
      j = A->size[0];
      for (i = 0; i < j; i++) {
        V->data[i].re = rtNaN;
        V->data[i].im = 0.0;
      }
    }
  } else {
    if ((A->size[0] == 1) && (A->size[1] == 1)) {
      i = V->size[0];
      V->size[0] = 1;
      emxEnsureCapacity_creal_T(sp, V, i, &cb_emlrtRTEI);
      V->data[0] = A->data[0];
    } else {
      p = (A->size[0] == A->size[1]);
      if (p) {
        j = 0;
        exitg2 = false;
        while ((!exitg2) && (j <= A->size[1] - 1)) {
          i = 0;
          do {
            exitg1 = 0;
            if (i <= j) {
              if ((!(A->data[i + A->size[0] * j].re == A->data[j + A->size[0] *
                     i].re)) || (!(A->data[i + A->size[0] * j].im == -A->data[j
                                   + A->size[0] * i].im))) {
                p = false;
                exitg1 = 1;
              } else {
                i++;
              }
            } else {
              j++;
              exitg1 = 2;
            }
          } while (exitg1 == 0);

          if (exitg1 == 1) {
            exitg2 = true;
          }
        }
      }

      emxInit_creal_T(sp, &b_A, 2, &jb_emlrtRTEI, true);
      if (p) {
        i = b_A->size[0] * b_A->size[1];
        b_A->size[0] = A->size[0];
        b_A->size[1] = A->size[1];
        emxEnsureCapacity_creal_T(sp, b_A, i, &fb_emlrtRTEI);
        j = A->size[0] * A->size[1];
        for (i = 0; i < j; i++) {
          b_A->data[i] = A->data[i];
        }

        st.site = &s_emlrtRSI;
        schur(&st, b_A);
        st.site = &r_emlrtRSI;
        n = b_A->size[0];
        i = V->size[0];
        V->size[0] = b_A->size[0];
        emxEnsureCapacity_creal_T(&st, V, i, &hb_emlrtRTEI);
        b_st.site = &ub_emlrtRSI;
        if ((1 <= b_A->size[0]) && (b_A->size[0] > 2147483646)) {
          c_st.site = &n_emlrtRSI;
          check_forloop_overflow_error(&c_st);
        }

        for (j = 0; j < n; j++) {
          V->data[j].re = b_A->data[j + b_A->size[0] * j].re;
          V->data[j].im = 0.0;
        }
      } else {
        st.site = &q_emlrtRSI;
        b_st.site = &vb_emlrtRSI;
        i = b_A->size[0] * b_A->size[1];
        b_A->size[0] = A->size[0];
        b_A->size[1] = A->size[1];
        emxEnsureCapacity_creal_T(&b_st, b_A, i, &gb_emlrtRTEI);
        j = A->size[0] * A->size[1];
        for (i = 0; i < j; i++) {
          b_A->data[i] = A->data[i];
        }

        i = V->size[0];
        V->size[0] = A->size[1];
        emxEnsureCapacity_creal_T(&b_st, V, i, &ib_emlrtRTEI);
        info_t = LAPACKE_zgeev(102, 'N', 'N', (ptrdiff_t)A->size[1],
          (lapack_complex_double *)&b_A->data[0], (ptrdiff_t)A->size[0],
          (lapack_complex_double *)&V->data[0], (lapack_complex_double *)&vl,
          (ptrdiff_t)1, (lapack_complex_double *)&vr, (ptrdiff_t)1);
        info = (int32_T)info_t;
        c_st.site = &wb_emlrtRSI;
        if (info < 0) {
          if (info == -1010) {
            emlrtErrorWithMessageIdR2018a(&c_st, &i_emlrtRTEI, "MATLAB:nomem",
              "MATLAB:nomem", 0);
          } else {
            emlrtErrorWithMessageIdR2018a(&c_st, &j_emlrtRTEI,
              "Coder:toolbox:LAPACKCallErrorInfo",
              "Coder:toolbox:LAPACKCallErrorInfo", 5, 4, 13, fname, 12, info);
          }
        }
      }

      emxFree_creal_T(&b_A);
    }

    if (info != 0) {
      st.site = &p_emlrtRSI;
      b_warning(&st);
    }
  }

  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (eig.cpp) */
