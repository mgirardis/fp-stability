/*
 * getRoot.cpp
 *
 * Code generation for function 'getRoot'
 *
 */

/* Include files */
#include "getRoot.h"
#include "getRoot_data.h"
#include "getRoot_emxutil.h"
#include "mwmathutil.h"
#include "roots.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 10,    /* lineNo */
  "getRoot",                           /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 18,  /* lineNo */
  "getRoot",                           /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 24,  /* lineNo */
  "getRoot",                           /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 26,  /* lineNo */
  "getRoot",                           /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pathName */
};

static emlrtRSInfo cc_emlrtRSI = { 33, /* lineNo */
  "getRoot_internal",                  /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pathName */
};

static emlrtMCInfo c_emlrtMCI = { 27,  /* lineNo */
  5,                                   /* colNo */
  "error",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\lang\\error.m"/* pName */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  24,                                  /* lineNo */
  51,                                  /* colNo */
  "x",                                 /* aName */
  "@(x,j) x(j,:)",                     /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  18,                                  /* lineNo */
  53,                                  /* colNo */
  "x",                                 /* aName */
  "@(x,j) x(:,j)",                     /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  11,                                  /* lineNo */
  9,                                   /* colNo */
  "r",                                 /* aName */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  0                                    /* checkKind */
};

static emlrtDCInfo emlrtDCI = { 11,    /* lineNo */
  9,                                   /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  1                                    /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  34,                                  /* lineNo */
  16,                                  /* colNo */
  "rr",                                /* aName */
  "getRoot_internal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  0                                    /* checkKind */
};

static emlrtDCInfo b_emlrtDCI = { 34,  /* lineNo */
  16,                                  /* colNo */
  "getRoot_internal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  1                                    /* checkKind */
};

static emlrtBCInfo e_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  34,                                  /* lineNo */
  9,                                   /* colNo */
  "r",                                 /* aName */
  "getRoot_internal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo l_emlrtRTEI = { 23,/* lineNo */
  13,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo m_emlrtRTEI = { 17,/* lineNo */
  13,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo n_emlrtRTEI = { 11,/* lineNo */
  9,                                   /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo o_emlrtRTEI = { 24,/* lineNo */
  13,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo p_emlrtRTEI = { 18,/* lineNo */
  13,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo q_emlrtRTEI = { 18,/* lineNo */
  49,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo r_emlrtRTEI = { 24,/* lineNo */
  49,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo s_emlrtRTEI = { 1, /* lineNo */
  10,                                  /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
};

static emlrtRTEInfo t_emlrtRTEI = { 33,/* lineNo */
  9,                                   /* colNo */
  "getRoot",                           /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\models\\einet_soqc\\getRoot.m"/* pName */
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

void getRoot(const emlrtStack *sp, const emxArray_real_T *p, real_T k, real_T
             dim, emxArray_creal_T *r)
{
  emxArray_creal_T *b_r;
  emxArray_creal_T *rr;
  int32_T loop_ub;
  emxArray_real_T b_p;
  emxArray_creal_T *c_r;
  int32_T c_p[1];
  int32_T i;
  const mxArray *y;
  const mxArray *m;
  static const int32_T iv[2] = { 1, 43 };

  static const char_T varargin_1[43] = { 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n',
    ' ', 'n', 'o', 't', ' ', 'd', 'e', 'f', 'i', 'n', 'e', 'd', ' ', 'f', 'o',
    'r', ' ', 'm', 'u', 'l', 't', 'i', 'd', 'i', 'm', 'e', 'n', 's', 'i', 'o',
    'n', 'a', 'l', ' ', 'p' };

  emxArray_real_T *d_p;
  int32_T b_i;
  emxArray_real_T *e_p;
  int32_T i1;
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
    loop_ub = p->size[0] * p->size[1];
    b_p = *p;
    c_p[0] = loop_ub;
    b_p.size = &c_p[0];
    b_p.numDimensions = 1;
    st.site = &emlrtRSI;
    roots(&st, &b_p, b_r);
    i = r->size[0] * r->size[1];
    r->size[0] = 1;
    r->size[1] = 1;
    emxEnsureCapacity_creal_T(sp, r, i, &n_emlrtRTEI);
    i = static_cast<int32_T>(muDoubleScalarFloor(k));
    if (k != i) {
      emlrtIntegerCheckR2012b(k, &emlrtDCI, sp);
    }

    if ((static_cast<int32_T>(k) < 1) || (static_cast<int32_T>(k) > b_r->size[0]))
    {
      emlrtDynamicBoundsCheckR2012b(static_cast<int32_T>(k), 1, b_r->size[0],
        &c_emlrtBCI, sp);
    }

    r->data[0].re = b_r->data[static_cast<int32_T>(k) - 1].re;
    if (static_cast<int32_T>(k) != i) {
      emlrtIntegerCheckR2012b(k, &emlrtDCI, sp);
    }

    if (static_cast<int32_T>(k) > b_r->size[0]) {
      emlrtDynamicBoundsCheckR2012b(static_cast<int32_T>(k), 1, b_r->size[0],
        &c_emlrtBCI, sp);
    }

    r->data[0].im = b_r->data[static_cast<int32_T>(k) - 1].im;
  } else {
    emxInit_creal_T(sp, &rr, 1, &t_emlrtRTEI, true);
    if (dim == 1.0) {
      emxInit_creal_T(sp, &c_r, 2, &s_emlrtRTEI, true);

      /*              getCoeff = @(x,j) x(:,j); */
      i = c_r->size[0] * c_r->size[1];
      c_r->size[0] = 1;
      c_r->size[1] = p->size[1];
      emxEnsureCapacity_creal_T(sp, c_r, i, &m_emlrtRTEI);
      loop_ub = p->size[1];
      for (i = 0; i < loop_ub; i++) {
        c_r->data[i].re = 0.0;
        c_r->data[i].im = 0.0;
      }

      st.site = &b_emlrtRSI;
      i = p->size[1];
      emxInit_real_T(&st, &e_p, 1, &q_emlrtRTEI, true);
      for (b_i = 0; b_i < i; b_i++) {
        b_st.site = &cc_emlrtRSI;
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > p->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, p->size[1], &b_emlrtBCI, &b_st);
        }

        loop_ub = p->size[0];
        i1 = e_p->size[0];
        e_p->size[0] = p->size[0];
        emxEnsureCapacity_real_T(&st, e_p, i1, &q_emlrtRTEI);
        for (i1 = 0; i1 < loop_ub; i1++) {
          e_p->data[i1] = p->data[i1 + p->size[0] * b_i];
        }

        b_st.site = &cc_emlrtRSI;
        roots(&b_st, e_p, rr);
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > c_r->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, c_r->size[1], &e_emlrtBCI, &st);
        }

        loop_ub = static_cast<int32_T>(muDoubleScalarFloor(k));
        if (k != loop_ub) {
          emlrtIntegerCheckR2012b(k, &b_emlrtDCI, &st);
        }

        if ((static_cast<int32_T>(k) < 1) || (static_cast<int32_T>(k) > rr->
             size[0])) {
          emlrtDynamicBoundsCheckR2012b(static_cast<int32_T>(k), 1, rr->size[0],
            &d_emlrtBCI, &st);
        }

        c_r->data[i1 - 1].re = rr->data[static_cast<int32_T>(k) - 1].re;
        if (static_cast<int32_T>(k) != loop_ub) {
          emlrtIntegerCheckR2012b(k, &b_emlrtDCI, &st);
        }

        if ((static_cast<int32_T>(k) < 1) || (static_cast<int32_T>(k) > rr->
             size[0])) {
          emlrtDynamicBoundsCheckR2012b(static_cast<int32_T>(k), 1, rr->size[0],
            &d_emlrtBCI, &st);
        }

        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > c_r->size[1])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, c_r->size[1], &e_emlrtBCI, &st);
        }

        c_r->data[i1 - 1].im = rr->data[static_cast<int32_T>(k) - 1].im;
        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b(&st);
        }
      }

      emxFree_real_T(&e_p);
      i = r->size[0] * r->size[1];
      r->size[0] = 1;
      r->size[1] = c_r->size[1];
      emxEnsureCapacity_creal_T(sp, r, i, &p_emlrtRTEI);
      loop_ub = c_r->size[0] * c_r->size[1];
      for (i = 0; i < loop_ub; i++) {
        r->data[i] = c_r->data[i];
      }

      emxFree_creal_T(&c_r);
    } else if (dim == 2.0) {
      /*              getCoeff = @(x,j) x(j,:); */
      i = b_r->size[0];
      b_r->size[0] = p->size[0];
      emxEnsureCapacity_creal_T(sp, b_r, i, &l_emlrtRTEI);
      loop_ub = p->size[0];
      for (i = 0; i < loop_ub; i++) {
        b_r->data[i].re = 0.0;
        b_r->data[i].im = 0.0;
      }

      st.site = &c_emlrtRSI;
      i = p->size[0];
      emxInit_real_T(&st, &d_p, 2, &r_emlrtRTEI, true);
      for (b_i = 0; b_i < i; b_i++) {
        b_st.site = &cc_emlrtRSI;
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > p->size[0])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, p->size[0], &emlrtBCI, &b_st);
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
        b_roots(&b_st, d_p, rr);
        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > b_r->size[0])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, b_r->size[0], &e_emlrtBCI, &st);
        }

        loop_ub = static_cast<int32_T>(muDoubleScalarFloor(k));
        if (k != loop_ub) {
          emlrtIntegerCheckR2012b(k, &b_emlrtDCI, &st);
        }

        if ((static_cast<int32_T>(k) < 1) || (static_cast<int32_T>(k) > rr->
             size[0])) {
          emlrtDynamicBoundsCheckR2012b(static_cast<int32_T>(k), 1, rr->size[0],
            &d_emlrtBCI, &st);
        }

        b_r->data[i1 - 1].re = rr->data[static_cast<int32_T>(k) - 1].re;
        if (static_cast<int32_T>(k) != loop_ub) {
          emlrtIntegerCheckR2012b(k, &b_emlrtDCI, &st);
        }

        if ((static_cast<int32_T>(k) < 1) || (static_cast<int32_T>(k) > rr->
             size[0])) {
          emlrtDynamicBoundsCheckR2012b(static_cast<int32_T>(k), 1, rr->size[0],
            &d_emlrtBCI, &st);
        }

        i1 = b_i + 1;
        if ((i1 < 1) || (i1 > b_r->size[0])) {
          emlrtDynamicBoundsCheckR2012b(i1, 1, b_r->size[0], &e_emlrtBCI, &st);
        }

        b_r->data[i1 - 1].im = rr->data[static_cast<int32_T>(k) - 1].im;
        if (*emlrtBreakCheckR2012bFlagVar != 0) {
          emlrtBreakCheckR2012b(&st);
        }
      }

      emxFree_real_T(&d_p);
      i = r->size[0] * r->size[1];
      r->size[0] = b_r->size[0];
      r->size[1] = 1;
      emxEnsureCapacity_creal_T(sp, r, i, &o_emlrtRTEI);
      loop_ub = b_r->size[0];
      for (i = 0; i < loop_ub; i++) {
        r->data[i] = b_r->data[i];
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

    emxFree_creal_T(&rr);
  }

  emxFree_creal_T(&b_r);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (getRoot.cpp) */
