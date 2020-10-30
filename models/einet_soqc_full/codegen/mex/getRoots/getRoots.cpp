/*
 * getRoots.cpp
 *
 * Code generation for function 'getRoots'
 *
 */

/* Include files */
#include "getRoots.h"
#include "getRoots_data.h"
#include "getRoots_emxutil.h"
#include "mwmathutil.h"
#include "roots.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 10,    /* lineNo */
  "getRoots",                          /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 17,  /* lineNo */
  "getRoots",                          /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 22,  /* lineNo */
  "getRoots",                          /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 24,  /* lineNo */
  "getRoots",                          /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pathName */
};

static emlrtRSInfo cc_emlrtRSI = { 31, /* lineNo */
  "getRoots_internal",                 /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pathName */
};

static emlrtMCInfo c_emlrtMCI = { 27,  /* lineNo */
  5,                                   /* colNo */
  "error",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\lang\\error.m"/* pName */
};

static emlrtDCInfo emlrtDCI = { 12,    /* lineNo */
  20,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo b_emlrtDCI = { 15,  /* lineNo */
  23,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  4                                    /* checkKind */
};

static emlrtDCInfo c_emlrtDCI = { 20,  /* lineNo */
  23,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  4                                    /* checkKind */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  31,                                  /* lineNo */
  13,                                  /* colNo */
  "r",                                 /* aName */
  "getRoots_internal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  0                                    /* checkKind */
};

static emlrtECInfo emlrtECI = { -1,    /* nDims */
  31,                                  /* lineNo */
  9,                                   /* colNo */
  "getRoots_internal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  17,                                  /* lineNo */
  52,                                  /* colNo */
  "x",                                 /* aName */
  "@(x,j) x(:,j)",                     /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  22,                                  /* lineNo */
  50,                                  /* colNo */
  "x",                                 /* aName */
  "@(x,j) x(j,:)",                     /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = { 1,   /* iFirst */
  2,                                   /* iLast */
  12,                                  /* lineNo */
  13,                                  /* colNo */
  "size(p,dim)",                       /* aName */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo l_emlrtRTEI = { 10,/* lineNo */
  9,                                   /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo m_emlrtRTEI = { 17,/* lineNo */
  35,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo n_emlrtRTEI = { 22,/* lineNo */
  35,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo o_emlrtRTEI = { 17,/* lineNo */
  13,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo p_emlrtRTEI = { 22,/* lineNo */
  13,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo q_emlrtRTEI = { 17,/* lineNo */
  48,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo r_emlrtRTEI = { 22,/* lineNo */
  48,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRTEInfo s_emlrtRTEI = { 1, /* lineNo */
  14,                                  /* colNo */
  "getRoots",                          /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoots.m"/* pName */
};

static emlrtRSInfo ec_emlrtRSI = { 27, /* lineNo */
  "error",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\lang\\error.m"/* pathName */
};

/* Function Declarations */
static void error(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location);

/* Function Definitions */
static void error(const emlrtStack *sp, const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = b;
  emlrtCallMATLABR2012b(sp, 0, NULL, 1, &pArray, "error", true, location);
}

void getRoots(const emlrtStack *sp, const emxArray_real_T *p, real_T dim,
              emxArray_creal_T *r)
{
  emxArray_creal_T *b_r;
  int32_T c_r[1];
  emxArray_real_T b_p;
  int32_T d_r[1];
  int32_T i;
  emxArray_creal_T *e_r;
  real_T d;
  int32_T loop_ub;
  const mxArray *y;
  const mxArray *m;
  static const int32_T iv[2] = { 1, 43 };

  int32_T i1;
  static const char_T varargin_1[43] = { 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n',
    ' ', 'n', 'o', 't', ' ', 'd', 'e', 'f', 'i', 'n', 'e', 'd', ' ', 'f', 'o',
    'r', ' ', 'm', 'u', 'l', 't', 'i', 'd', 'i', 'm', 'e', 'n', 's', 'i', 'o',
    'n', 'a', 'l', ' ', 'p' };

  emxArray_real_T *c_p;
  emxArray_real_T *d_p;
  int32_T b_i;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);

  /*  returns root k of the polynomial given by p */
  /*  if p is a vector, then simply call r = roots(p) and returns r(k) */
  /*  if p is a matrix it defines a polynomial of degree size(p,dim) */
  /*       and the k root is returned for all the coefficient sets along the other dimension than dim */
  emxInit_creal_T(sp, &b_r, 1, &s_emlrtRTEI, true);
  if ((p->size[0] == 1) || (p->size[1] == 1)) {
    c_r[0] = p->size[0] * p->size[1];
    b_p = *p;
    d_r[0] = c_r[0];
    b_p.size = &d_r[0];
    b_p.numDimensions = 1;
    st.site = &emlrtRSI;
    roots(&st, &b_p, b_r);
    i = r->size[0] * r->size[1];
    r->size[0] = b_r->size[0];
    r->size[1] = 1;
    emxEnsureCapacity_creal_T(sp, r, i, &l_emlrtRTEI);
    loop_ub = b_r->size[0];
    for (i = 0; i < loop_ub; i++) {
      r->data[i] = b_r->data[i];
    }
  } else {
    if (dim != static_cast<int32_T>(muDoubleScalarFloor(dim))) {
      emlrtIntegerCheckR2012b(dim, &emlrtDCI, sp);
    }

    if (dim <= 2.0) {
      i = static_cast<int32_T>(dim);
      if ((i < 1) || (i > 2)) {
        emlrtDynamicBoundsCheckR2012b(i, 1, 2, &d_emlrtBCI, sp);
      }

      i = p->size[i - 1] - 1;
    } else {
      i = 0;
    }

    /*  number of roots is one less than the number of coefficients of p */
    emxInit_creal_T(sp, &e_r, 2, &n_emlrtRTEI, true);
    if (dim == 1.0) {
      d = static_cast<real_T>((i + 1)) - 1.0;
      if (!(d >= 0.0)) {
        emlrtNonNegativeCheckR2012b(d, &b_emlrtDCI, sp);
      }

      st.site = &b_emlrtRSI;
      i1 = e_r->size[0] * e_r->size[1];
      e_r->size[0] = i;
      e_r->size[1] = p->size[1];
      emxEnsureCapacity_creal_T(&st, e_r, i1, &m_emlrtRTEI);
      loop_ub = i * p->size[1];
      for (i = 0; i < loop_ub; i++) {
        e_r->data[i].re = 0.0;
        e_r->data[i].im = 0.0;
      }

      i = p->size[1];
      emxInit_real_T(&st, &c_p, 1, &q_emlrtRTEI, true);
      for (b_i = 0; b_i < i; b_i++) {
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > e_r->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, e_r->size[1], &emlrtBCI, &st);
        }

        b_st.site = &cc_emlrtRSI;
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > p->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, p->size[1], &b_emlrtBCI, &b_st);
        }

        loop_ub = p->size[0];
        i1 = c_p->size[0];
        c_p->size[0] = p->size[0];
        emxEnsureCapacity_real_T(&st, c_p, i1, &q_emlrtRTEI);
        for (i1 = 0; i1 < loop_ub; i1++) {
          c_p->data[i1] = p->data[i1 + p->size[0] * b_i];
        }

        b_st.site = &cc_emlrtRSI;
        roots(&b_st, c_p, b_r);
        c_r[0] = e_r->size[0];
        emlrtSubAssignSizeCheckR2012b(&c_r[0], 1, &b_r->size[0], 1, &emlrtECI,
          &st);
        loop_ub = b_r->size[0];
        for (i1 = 0; i1 < loop_ub; i1++) {
          e_r->data[i1 + e_r->size[0] * b_i] = b_r->data[i1];
        }

        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b(&st);
        }
      }

      emxFree_real_T(&c_p);
      i = r->size[0] * r->size[1];
      r->size[0] = e_r->size[0];
      r->size[1] = e_r->size[1];
      emxEnsureCapacity_creal_T(sp, r, i, &o_emlrtRTEI);
      loop_ub = e_r->size[0] * e_r->size[1];
      for (i = 0; i < loop_ub; i++) {
        r->data[i] = e_r->data[i];
      }
    } else if (dim == 2.0) {
      d = static_cast<real_T>((i + 1)) - 1.0;
      if (!(d >= 0.0)) {
        emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
      }

      st.site = &c_emlrtRSI;
      i1 = e_r->size[0] * e_r->size[1];
      e_r->size[0] = i;
      e_r->size[1] = p->size[0];
      emxEnsureCapacity_creal_T(&st, e_r, i1, &n_emlrtRTEI);
      loop_ub = i * p->size[0];
      for (i = 0; i < loop_ub; i++) {
        e_r->data[i].re = 0.0;
        e_r->data[i].im = 0.0;
      }

      i = p->size[0];
      emxInit_real_T(&st, &d_p, 2, &r_emlrtRTEI, true);
      for (b_i = 0; b_i < i; b_i++) {
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > e_r->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, e_r->size[1], &emlrtBCI, &st);
        }

        b_st.site = &cc_emlrtRSI;
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > p->size[0])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, p->size[0], &c_emlrtBCI, &b_st);
        }

        loop_ub = p->size[1];
        i1 = d_p->size[0] * d_p->size[1];
        d_p->size[0] = 1;
        d_p->size[1] = p->size[1];
        emxEnsureCapacity_real_T(&st, d_p, i1, &r_emlrtRTEI);
        for (i1 = 0; i1 < loop_ub; i1++) {
          d_p->data[i1] = p->data[b_i + p->size[0] * i1];
        }

        b_st.site = &cc_emlrtRSI;
        b_roots(&b_st, d_p, b_r);
        c_r[0] = e_r->size[0];
        emlrtSubAssignSizeCheckR2012b(&c_r[0], 1, &b_r->size[0], 1, &emlrtECI,
          &st);
        loop_ub = b_r->size[0];
        for (i1 = 0; i1 < loop_ub; i1++) {
          e_r->data[i1 + e_r->size[0] * b_i] = b_r->data[i1];
        }

        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b(&st);
        }
      }

      emxFree_real_T(&d_p);
      i = r->size[0] * r->size[1];
      r->size[0] = e_r->size[1];
      r->size[1] = e_r->size[0];
      emxEnsureCapacity_creal_T(sp, r, i, &p_emlrtRTEI);
      loop_ub = e_r->size[0];
      for (i = 0; i < loop_ub; i++) {
        b_i = e_r->size[1];
        for (i1 = 0; i1 < b_i; i1++) {
          r->data[i1 + r->size[0] * i].re = e_r->data[i + e_r->size[0] * i1].re;
          r->data[i1 + r->size[0] * i].im = -e_r->data[i + e_r->size[0] * i1].im;
        }
      }
    } else {
      st.site = &d_emlrtRSI;
      y = NULL;
      m = emlrtCreateCharArray(2, iv);
      emlrtInitCharArrayR2013a(&st, 43, m, &varargin_1[0]);
      emlrtAssign(&y, m);
      b_st.site = &ec_emlrtRSI;
      error(&b_st, y, &c_emlrtMCI);
    }

    emxFree_creal_T(&e_r);
  }

  emxFree_creal_T(&b_r);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (getRoots.cpp) */
