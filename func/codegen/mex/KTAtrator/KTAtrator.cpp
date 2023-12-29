/*
 * KTAtrator.cpp
 *
 * Code generation for function 'KTAtrator'
 *
 */

/* Include files */
#include "KTAtrator.h"
#include "KTAtrator_data.h"
#include "KTAtrator_emxutil.h"
#include "mwmathutil.h"
#include "rt_nonfinite.h"
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 22,    /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 24,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 26,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 28,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo e_emlrtRSI = { 30,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo f_emlrtRSI = { 32,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo g_emlrtRSI = { 34,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo h_emlrtRSI = { 53,  /* lineNo */
  "KTAtratorLocal",                    /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo i_emlrtRSI = { 58,  /* lineNo */
  "KTAtratorLocal",                    /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo j_emlrtRSI = { 73,  /* lineNo */
  "KTLogIterLocal",                    /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo k_emlrtRSI = { 79,  /* lineNo */
  "KTzLogIterLocal",                   /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo l_emlrtRSI = { 95,  /* lineNo */
  "KTTanhIterLocal",                   /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo m_emlrtRSI = { 100, /* lineNo */
  "KTzTanhIterLocal",                  /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo n_emlrtRSI = { 114, /* lineNo */
  "KT2TanhIterLocal",                  /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo o_emlrtRSI = { 120, /* lineNo */
  "KTz2TanhIterLocal",                 /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtMCInfo emlrtMCI = { 41,    /* lineNo */
  9,                                   /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtMCInfo b_emlrtMCI = { 43,  /* lineNo */
  13,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtMCInfo c_emlrtMCI = { 45,  /* lineNo */
  13,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtMCInfo d_emlrtMCI = { 27,  /* lineNo */
  5,                                   /* colNo */
  "error",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\lang\\error.m"/* pName */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  43,                                  /* lineNo */
  55,                                  /* colNo */
  "xData",                             /* aName */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  45,                                  /* lineNo */
  26,                                  /* colNo */
  "xData",                             /* aName */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  45,                                  /* lineNo */
  38,                                  /* colNo */
  "xData",                             /* aName */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  51,                                  /* lineNo */
  12,                                  /* colNo */
  "x0",                                /* aName */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo e_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  51,                                  /* lineNo */
  14,                                  /* colNo */
  "x0",                                /* aName */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo emlrtRTEI = { 52,  /* lineNo */
  13,                                  /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRTEInfo b_emlrtRTEI = { 57,/* lineNo */
  13,                                  /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtBCInfo f_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  56,                                  /* lineNo */
  11,                                  /* colNo */
  "xData",                             /* aName */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtECInfo emlrtECI = { -1,    /* nDims */
  56,                                  /* lineNo */
  5,                                   /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtDCInfo emlrtDCI = { 60,    /* lineNo */
  15,                                  /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  1                                    /* checkKind */
};

static emlrtBCInfo g_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  60,                                  /* lineNo */
  15,                                  /* colNo */
  "xData",                             /* aName */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtECInfo b_emlrtECI = { -1,  /* nDims */
  60,                                  /* lineNo */
  9,                                   /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtBCInfo h_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  73,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTLogIterLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo i_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  73,                                  /* lineNo */
  28,                                  /* colNo */
  "x",                                 /* aName */
  "KTLogIterLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo j_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  74,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTLogIterLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo k_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  74,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTLogIterLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo l_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  75,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTLogIterLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtDCInfo b_emlrtDCI = { 55,  /* lineNo */
  19,                                  /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo c_emlrtDCI = { 55,  /* lineNo */
  19,                                  /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  4                                    /* checkKind */
};

static emlrtDCInfo d_emlrtDCI = { 55,  /* lineNo */
  5,                                   /* colNo */
  "KTAtratorLocal",                    /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  1                                    /* checkKind */
};

static emlrtBCInfo m_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  69,                                  /* lineNo */
  9,                                   /* colNo */
  "p",                                 /* aName */
  "getParValAt",                       /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtDCInfo e_emlrtDCI = { 69,  /* lineNo */
  9,                                   /* colNo */
  "getParValAt",                       /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  1                                    /* checkKind */
};

static emlrtBCInfo n_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  93,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTTanhIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo o_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  94,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTTanhIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo p_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  94,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTTanhIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo q_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  95,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTTanhIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo r_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  113,                                 /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KT2TanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo s_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  114,                                 /* lineNo */
  34,                                  /* colNo */
  "x",                                 /* aName */
  "KT2TanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo t_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  114,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KT2TanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo u_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  115,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KT2TanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo v_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  79,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo w_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  79,                                  /* lineNo */
  28,                                  /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo x_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  79,                                  /* lineNo */
  35,                                  /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo y_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  80,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo ab_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  80,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo bb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  81,                                  /* lineNo */
  25,                                  /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo cb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  81,                                  /* lineNo */
  40,                                  /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo db_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  81,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo eb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  82,                                  /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTzLogIterLocal",                   /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo fb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  99,                                  /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo gb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  100,                                 /* lineNo */
  34,                                  /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo hb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  100,                                 /* lineNo */
  41,                                  /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo ib_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  100,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo jb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  101,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo kb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  102,                                 /* lineNo */
  25,                                  /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo lb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  102,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTzTanhIterLocal",                  /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo mb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  119,                                 /* lineNo */
  14,                                  /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo nb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  120,                                 /* lineNo */
  20,                                  /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo ob_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  120,                                 /* lineNo */
  34,                                  /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo pb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  120,                                 /* lineNo */
  41,                                  /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo qb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  120,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo rb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  121,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo sb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  122,                                 /* lineNo */
  25,                                  /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo tb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  122,                                 /* lineNo */
  7,                                   /* colNo */
  "x",                                 /* aName */
  "KTz2TanhIterLocal",                 /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo c_emlrtRTEI = { 53,/* lineNo */
  14,                                  /* colNo */
  "strfind",                           /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\strfun\\strfind.m"/* pName */
};

static emlrtRTEInfo d_emlrtRTEI = { 85,/* lineNo */
  13,                                  /* colNo */
  "strfind",                           /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\strfun\\strfind.m"/* pName */
};

static emlrtRTEInfo e_emlrtRTEI = { 28,/* lineNo */
  9,                                   /* colNo */
  "colon",                             /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\ops\\colon.m"/* pName */
};

static emlrtRTEInfo f_emlrtRTEI = { 45,/* lineNo */
  18,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRTEInfo g_emlrtRTEI = { 43,/* lineNo */
  18,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRTEInfo h_emlrtRTEI = { 45,/* lineNo */
  30,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRTEInfo i_emlrtRTEI = { 43,/* lineNo */
  47,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRTEInfo j_emlrtRTEI = { 43,/* lineNo */
  29,                                  /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRTEInfo k_emlrtRTEI = { 67,/* lineNo */
  1,                                   /* colNo */
  "strfind",                           /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\strfun\\strfind.m"/* pName */
};

static emlrtRTEInfo l_emlrtRTEI = { 55,/* lineNo */
  5,                                   /* colNo */
  "KTAtrator",                         /* fName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pName */
};

static emlrtRSInfo p_emlrtRSI = { 41,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo q_emlrtRSI = { 43,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo r_emlrtRSI = { 45,  /* lineNo */
  "KTAtrator",                         /* fcnName */
  "D:\\Dropbox\\p\\neuromat\\programas\\matlab\\fp-stability\\func\\KTAtrator.m"/* pathName */
};

static emlrtRSInfo s_emlrtRSI = { 27,  /* lineNo */
  "error",                             /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\lang\\error.m"/* pathName */
};

/* Function Declarations */
static void KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_H, const emxArray_real_T *par_I, const real_T x0_data[], const
  int32_T x0_size[2], real_T nDim, real_T tTrans, real_T tTotal, emxArray_real_T
  *xData);
static void KTz2TanhIterLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, real_T par_Q, const
  emxArray_real_T *par_I, real_T x_data[], const int32_T x_size[2], real_T t);
static void KTzLogIterLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, real_T x_data[], const int32_T x_size[2], real_T t);
static void KTzTanhIterLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, real_T x_data[], const int32_T x_size[2], real_T t);
static void b_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, const real_T x0_data[], const int32_T x0_size[2], real_T nDim, real_T
  tTrans, real_T tTotal, emxArray_real_T *xData);
static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u);
static void c_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_H, const emxArray_real_T *par_I, const real_T x0_data[], const
  int32_T x0_size[2], real_T nDim, real_T tTrans, real_T tTotal, emxArray_real_T
  *xData);
static void d_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, const real_T x0_data[], const int32_T x0_size[2], real_T nDim, real_T
  tTrans, real_T tTotal, emxArray_real_T *xData);
static void e_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_H, real_T par_Q, const emxArray_real_T *par_I, const real_T
  x0_data[], const int32_T x0_size[2], real_T nDim, real_T tTrans, real_T tTotal,
  emxArray_real_T *xData);
static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);
static void error(const emlrtStack *sp, const mxArray *b, const mxArray *c,
                  emlrtMCInfo *location);
static void f_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, real_T par_Q, const
  emxArray_real_T *par_I, const real_T x0_data[], const int32_T x0_size[2],
  real_T nDim, real_T tTrans, real_T tTotal, emxArray_real_T *xData);
static void figure(const emlrtStack *sp, emlrtMCInfo *location);
static real_T getParValAt(const emlrtStack *sp, const emxArray_real_T *p, real_T
  t);
static void plot(const emlrtStack *sp, const mxArray *b, const mxArray *c, const
                 mxArray *d, const mxArray *e, const mxArray *f, emlrtMCInfo
                 *location);

/* Function Definitions */
static void KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_H, const emxArray_real_T *par_I, const real_T x0_data[], const
  int32_T x0_size[2], real_T nDim, real_T tTrans, real_T tTotal, emxArray_real_T
  *xData)
{
  int32_T loop_ub;
  real_T x_data[3];
  int32_T i;
  int32_T t;
  real_T d;
  real_T arg;
  int32_T i1;
  int32_T iv[2];
  int32_T iv1[2];
  real_T b_t;
  int32_T c_t;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  if (1.0 > nDim) {
    loop_ub = 0;
  } else {
    if (1 > x0_size[1]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, x0_size[1], &d_emlrtBCI, sp);
    }

    loop_ub = static_cast<int32_T>(nDim);
    if ((loop_ub < 1) || (loop_ub > x0_size[1])) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, x0_size[1], &e_emlrtBCI, sp);
    }
  }

  if (0 <= loop_ub - 1) {
    memcpy(&x_data[0], &x0_data[0], loop_ub * sizeof(real_T));
  }

  i = static_cast<int32_T>(tTrans);
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, tTrans, mxDOUBLE_CLASS,
    static_cast<int32_T>(tTrans), &emlrtRTEI, sp);
  for (t = 0; t < i; t++) {
    st.site = &h_emlrtRSI;
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &h_emlrtBCI, &st);
    }

    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &i_emlrtBCI, &st);
    }

    b_st.site = &j_emlrtRSI;
    arg = (((x_data[0] - par_K * x_data[1]) + par_H) + getParValAt(&b_st, par_I,
            static_cast<real_T>(t) + 1.0)) / par_T;
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &k_emlrtBCI, &st);
    }

    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &j_emlrtBCI, &st);
    }

    x_data[1] = x_data[0];
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &l_emlrtBCI, &st);
    }

    x_data[0] = arg / (muDoubleScalarAbs(arg) + 1.0);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  d = (tTotal - tTrans) + 1.0;
  if (!(d >= 0.0)) {
    emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
  }

  arg = static_cast<int32_T>(muDoubleScalarFloor(d));
  if (d != arg) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, sp);
  }

  i = xData->size[0] * xData->size[1];
  i1 = static_cast<int32_T>(d);
  xData->size[0] = i1;
  xData->size[1] = static_cast<int32_T>(nDim);
  emxEnsureCapacity_real_T(sp, xData, i, &l_emlrtRTEI);
  if (d != arg) {
    emlrtIntegerCheckR2012b(d, &d_emlrtDCI, sp);
  }

  t = i1 * static_cast<int32_T>(nDim);
  for (i = 0; i < t; i++) {
    xData->data[i] = 0.0;
  }

  if (1 > i1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i1, &f_emlrtBCI, sp);
  }

  iv[0] = 1;
  iv[1] = static_cast<int32_T>(nDim);
  iv1[0] = 1;
  iv1[1] = loop_ub;
  emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &iv1[0], 2, &emlrtECI, sp);
  for (i = 0; i < loop_ub; i++) {
    xData->data[xData->size[0] * i] = x_data[i];
  }

  i = static_cast<int32_T>((tTotal + (1.0 - (tTrans + 1.0))));
  emlrtForLoopVectorCheckR2012b(tTrans + 1.0, 1.0, tTotal, mxDOUBLE_CLASS, i,
    &b_emlrtRTEI, sp);
  if (0 <= i - 1) {
    iv[0] = 1;
    iv1[0] = 1;
    iv1[1] = loop_ub;
  }

  for (t = 0; t < i; t++) {
    b_t = (tTrans + 1.0) + static_cast<real_T>(t);
    st.site = &i_emlrtRSI;
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &h_emlrtBCI, &st);
    }

    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &i_emlrtBCI, &st);
    }

    b_st.site = &j_emlrtRSI;
    arg = (((x_data[0] - par_K * x_data[1]) + par_H) + getParValAt(&b_st, par_I,
            b_t)) / par_T;
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &k_emlrtBCI, &st);
    }

    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &j_emlrtBCI, &st);
    }

    x_data[1] = x_data[0];
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &l_emlrtBCI, &st);
    }

    x_data[0] = arg / (muDoubleScalarAbs(arg) + 1.0);
    d = (b_t - tTrans) + 1.0;
    if (d != static_cast<int32_T>(muDoubleScalarFloor(d))) {
      emlrtIntegerCheckR2012b(d, &emlrtDCI, sp);
    }

    i1 = static_cast<int32_T>(d);
    if ((i1 < 1) || (i1 > xData->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, xData->size[0], &g_emlrtBCI, sp);
    }

    iv[1] = xData->size[1];
    emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &iv1[0], 2, &b_emlrtECI, sp);
    c_t = static_cast<int32_T>(((b_t - tTrans) + 1.0));
    for (i1 = 0; i1 < loop_ub; i1++) {
      xData->data[(c_t + xData->size[0] * i1) - 1] = x_data[i1];
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* xData = xData(tTrans:tTotal,:); */
}

static void KTz2TanhIterLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, real_T par_Q, const
  emxArray_real_T *par_I, real_T x_data[], const int32_T x_size[2], real_T t)
{
  int32_T i;
  real_T xAnt;
  real_T x;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &mb_emlrtBCI, sp);
  }

  xAnt = x_data[0];
  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &qb_emlrtBCI, sp);
  }

  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &nb_emlrtBCI, sp);
  }

  i = x_size[1];
  if (2 > i) {
    emlrtDynamicBoundsCheckR2012b(2, 1, i, &ob_emlrtBCI, sp);
  }

  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &pb_emlrtBCI, sp);
  }

  st.site = &o_emlrtRSI;
  x = ((((x_data[0] - par_K * x_data[1]) + x_data[2]) + par_Q) + getParValAt(&st,
        par_I, t)) / par_T;
  x_data[0] = muDoubleScalarTanh(x);
  i = x_size[1];
  if (2 > i) {
    emlrtDynamicBoundsCheckR2012b(2, 1, i, &rb_emlrtBCI, sp);
  }

  x_data[1] = muDoubleScalarTanh((xAnt + par_H) / par_T);
  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &tb_emlrtBCI, sp);
  }

  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &sb_emlrtBCI, sp);
  }

  x_data[2] = (1.0 - par_d) * x_data[2] - par_l * (xAnt - par_xR);
}

static void KTzLogIterLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, real_T x_data[], const int32_T x_size[2], real_T t)
{
  int32_T i;
  real_T arg;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &v_emlrtBCI, sp);
  }

  i = x_size[1];
  if (2 > i) {
    emlrtDynamicBoundsCheckR2012b(2, 1, i, &w_emlrtBCI, sp);
  }

  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &x_emlrtBCI, sp);
  }

  st.site = &k_emlrtRSI;
  arg = ((((x_data[0] - par_K * x_data[1]) + x_data[2]) + par_H) + getParValAt
         (&st, par_I, t)) / par_T;
  i = x_size[1];
  if (2 > i) {
    emlrtDynamicBoundsCheckR2012b(2, 1, i, &ab_emlrtBCI, sp);
  }

  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &y_emlrtBCI, sp);
  }

  x_data[1] = x_data[0];
  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &db_emlrtBCI, sp);
  }

  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &bb_emlrtBCI, sp);
  }

  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &cb_emlrtBCI, sp);
  }

  x_data[2] = (1.0 - par_d) * x_data[2] - par_l * (x_data[0] - par_xR);
  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &eb_emlrtBCI, sp);
  }

  x_data[0] = arg / (muDoubleScalarAbs(arg) + 1.0);
}

static void KTzTanhIterLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, real_T x_data[], const int32_T x_size[2], real_T t)
{
  int32_T i;
  real_T xAnt;
  real_T x;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &fb_emlrtBCI, sp);
  }

  xAnt = x_data[0];
  i = x_size[1];
  if (1 > i) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i, &ib_emlrtBCI, sp);
  }

  i = x_size[1];
  if (2 > i) {
    emlrtDynamicBoundsCheckR2012b(2, 1, i, &gb_emlrtBCI, sp);
  }

  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &hb_emlrtBCI, sp);
  }

  st.site = &m_emlrtRSI;
  x = ((((x_data[0] - par_K * x_data[1]) + x_data[2]) + par_H) + getParValAt(&st,
        par_I, t)) / par_T;
  x_data[0] = muDoubleScalarTanh(x);
  i = x_size[1];
  if (2 > i) {
    emlrtDynamicBoundsCheckR2012b(2, 1, i, &jb_emlrtBCI, sp);
  }

  x_data[1] = xAnt;
  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &lb_emlrtBCI, sp);
  }

  i = x_size[1];
  if (3 > i) {
    emlrtDynamicBoundsCheckR2012b(3, 1, i, &kb_emlrtBCI, sp);
  }

  x_data[2] = (1.0 - par_d) * x_data[2] - par_l * (xAnt - par_xR);
}

static void b_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, const real_T x0_data[], const int32_T x0_size[2], real_T nDim, real_T
  tTrans, real_T tTotal, emxArray_real_T *xData)
{
  int32_T loop_ub;
  int32_T x_size[2];
  real_T x_data[3];
  int32_T i;
  int32_T t;
  real_T d;
  real_T b_t;
  int32_T i1;
  int32_T iv[2];
  int32_T c_t;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  if (1.0 > nDim) {
    loop_ub = 0;
  } else {
    if (1 > x0_size[1]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, x0_size[1], &d_emlrtBCI, sp);
    }

    loop_ub = static_cast<int32_T>(nDim);
    if ((loop_ub < 1) || (loop_ub > x0_size[1])) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, x0_size[1], &e_emlrtBCI, sp);
    }
  }

  x_size[0] = 1;
  x_size[1] = loop_ub;
  if (0 <= loop_ub - 1) {
    memcpy(&x_data[0], &x0_data[0], loop_ub * sizeof(real_T));
  }

  i = static_cast<int32_T>(tTrans);
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, tTrans, mxDOUBLE_CLASS,
    static_cast<int32_T>(tTrans), &emlrtRTEI, sp);
  for (t = 0; t < i; t++) {
    st.site = &h_emlrtRSI;
    KTzLogIterLocal(&st, par_K, par_T, par_d, par_l, par_xR, par_H, par_I,
                    x_data, x_size, static_cast<real_T>(t) + 1.0);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  d = (tTotal - tTrans) + 1.0;
  if (!(d >= 0.0)) {
    emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
  }

  b_t = static_cast<int32_T>(muDoubleScalarFloor(d));
  if (d != b_t) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, sp);
  }

  i = xData->size[0] * xData->size[1];
  i1 = static_cast<int32_T>(d);
  xData->size[0] = i1;
  xData->size[1] = static_cast<int32_T>(nDim);
  emxEnsureCapacity_real_T(sp, xData, i, &l_emlrtRTEI);
  if (d != b_t) {
    emlrtIntegerCheckR2012b(d, &d_emlrtDCI, sp);
  }

  loop_ub = i1 * static_cast<int32_T>(nDim);
  for (i = 0; i < loop_ub; i++) {
    xData->data[i] = 0.0;
  }

  if (1 > i1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i1, &f_emlrtBCI, sp);
  }

  iv[0] = 1;
  iv[1] = static_cast<int32_T>(nDim);
  emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &x_size[0], 2, &emlrtECI, sp);
  loop_ub = x_size[1];
  for (i = 0; i < loop_ub; i++) {
    xData->data[xData->size[0] * i] = x_data[i];
  }

  i = static_cast<int32_T>((tTotal + (1.0 - (tTrans + 1.0))));
  emlrtForLoopVectorCheckR2012b(tTrans + 1.0, 1.0, tTotal, mxDOUBLE_CLASS, i,
    &b_emlrtRTEI, sp);
  if (0 <= i - 1) {
    iv[0] = 1;
  }

  for (t = 0; t < i; t++) {
    b_t = (tTrans + 1.0) + static_cast<real_T>(t);
    st.site = &i_emlrtRSI;
    KTzLogIterLocal(&st, par_K, par_T, par_d, par_l, par_xR, par_H, par_I,
                    x_data, x_size, b_t);
    d = (b_t - tTrans) + 1.0;
    if (d != static_cast<int32_T>(muDoubleScalarFloor(d))) {
      emlrtIntegerCheckR2012b(d, &emlrtDCI, sp);
    }

    i1 = static_cast<int32_T>(d);
    if ((i1 < 1) || (i1 > xData->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, xData->size[0], &g_emlrtBCI, sp);
    }

    iv[1] = xData->size[1];
    emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &x_size[0], 2, &b_emlrtECI, sp);
    c_t = static_cast<int32_T>(((b_t - tTrans) + 1.0));
    loop_ub = x_size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      xData->data[(c_t + xData->size[0] * i1) - 1] = x_data[i1];
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* xData = xData(tTrans:tTotal,:); */
}

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u)
{
  const mxArray *y;
  int32_T iv[1];
  const mxArray *m;
  real_T *pData;
  int32_T i;
  int32_T b_i;
  y = NULL;
  iv[0] = u->size[0];
  m = emlrtCreateNumericArray(1, &iv[0], mxDOUBLE_CLASS, mxREAL);
  pData = emlrtMxGetPr(m);
  i = 0;
  for (b_i = 0; b_i < u->size[0]; b_i++) {
    pData[i] = u->data[b_i];
    i++;
  }

  emlrtAssign(&y, m);
  return y;
}

static void c_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_H, const emxArray_real_T *par_I, const real_T x0_data[], const
  int32_T x0_size[2], real_T nDim, real_T tTrans, real_T tTotal, emxArray_real_T
  *xData)
{
  int32_T loop_ub;
  real_T x_data[3];
  int32_T i;
  int32_T t;
  real_T d;
  real_T xAnt;
  int32_T i1;
  int32_T iv[2];
  int32_T iv1[2];
  real_T b_t;
  int32_T c_t;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  if (1.0 > nDim) {
    loop_ub = 0;
  } else {
    if (1 > x0_size[1]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, x0_size[1], &d_emlrtBCI, sp);
    }

    loop_ub = static_cast<int32_T>(nDim);
    if ((loop_ub < 1) || (loop_ub > x0_size[1])) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, x0_size[1], &e_emlrtBCI, sp);
    }
  }

  if (0 <= loop_ub - 1) {
    memcpy(&x_data[0], &x0_data[0], loop_ub * sizeof(real_T));
  }

  i = static_cast<int32_T>(tTrans);
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, tTrans, mxDOUBLE_CLASS,
    static_cast<int32_T>(tTrans), &emlrtRTEI, sp);
  for (t = 0; t < i; t++) {
    st.site = &h_emlrtRSI;

    /* function x = KTzLogIterLocal_ignoreH(par, x, t) */
    /*     arg = (x(1) - par.K.*x(2) + x(3) + getParValAt(par.I,t)) ./ par.T; */
    /*     x(2) = x(1); */
    /*     x(3) = (1-par.d).*x(3) - par.l.*(x(1) - par.xR); */
    /*     x(1) = arg ./ (1.0 + abs(arg)); */
    /* end */
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &n_emlrtBCI, &st);
    }

    xAnt = x_data[1];
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &p_emlrtBCI, &st);
    }

    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &o_emlrtBCI, &st);
    }

    x_data[1] = x_data[0];
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &q_emlrtBCI, &st);
    }

    b_st.site = &l_emlrtRSI;
    xAnt = (((x_data[0] - par_K * xAnt) + par_H) + getParValAt(&b_st, par_I,
             static_cast<real_T>(t) + 1.0)) / par_T;
    x_data[0] = muDoubleScalarTanh(xAnt);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  d = (tTotal - tTrans) + 1.0;
  if (!(d >= 0.0)) {
    emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
  }

  xAnt = static_cast<int32_T>(muDoubleScalarFloor(d));
  if (d != xAnt) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, sp);
  }

  i = xData->size[0] * xData->size[1];
  i1 = static_cast<int32_T>(d);
  xData->size[0] = i1;
  xData->size[1] = static_cast<int32_T>(nDim);
  emxEnsureCapacity_real_T(sp, xData, i, &l_emlrtRTEI);
  if (d != xAnt) {
    emlrtIntegerCheckR2012b(d, &d_emlrtDCI, sp);
  }

  t = i1 * static_cast<int32_T>(nDim);
  for (i = 0; i < t; i++) {
    xData->data[i] = 0.0;
  }

  if (1 > i1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i1, &f_emlrtBCI, sp);
  }

  iv[0] = 1;
  iv[1] = static_cast<int32_T>(nDim);
  iv1[0] = 1;
  iv1[1] = loop_ub;
  emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &iv1[0], 2, &emlrtECI, sp);
  for (i = 0; i < loop_ub; i++) {
    xData->data[xData->size[0] * i] = x_data[i];
  }

  i = static_cast<int32_T>((tTotal + (1.0 - (tTrans + 1.0))));
  emlrtForLoopVectorCheckR2012b(tTrans + 1.0, 1.0, tTotal, mxDOUBLE_CLASS, i,
    &b_emlrtRTEI, sp);
  if (0 <= i - 1) {
    iv[0] = 1;
    iv1[0] = 1;
    iv1[1] = loop_ub;
  }

  for (t = 0; t < i; t++) {
    b_t = (tTrans + 1.0) + static_cast<real_T>(t);
    st.site = &i_emlrtRSI;

    /* function x = KTzLogIterLocal_ignoreH(par, x, t) */
    /*     arg = (x(1) - par.K.*x(2) + x(3) + getParValAt(par.I,t)) ./ par.T; */
    /*     x(2) = x(1); */
    /*     x(3) = (1-par.d).*x(3) - par.l.*(x(1) - par.xR); */
    /*     x(1) = arg ./ (1.0 + abs(arg)); */
    /* end */
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &n_emlrtBCI, &st);
    }

    xAnt = x_data[1];
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &p_emlrtBCI, &st);
    }

    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &o_emlrtBCI, &st);
    }

    x_data[1] = x_data[0];
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &q_emlrtBCI, &st);
    }

    b_st.site = &l_emlrtRSI;
    xAnt = (((x_data[0] - par_K * xAnt) + par_H) + getParValAt(&b_st, par_I, b_t))
      / par_T;
    x_data[0] = muDoubleScalarTanh(xAnt);
    d = (b_t - tTrans) + 1.0;
    if (d != static_cast<int32_T>(muDoubleScalarFloor(d))) {
      emlrtIntegerCheckR2012b(d, &emlrtDCI, sp);
    }

    i1 = static_cast<int32_T>(d);
    if ((i1 < 1) || (i1 > xData->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, xData->size[0], &g_emlrtBCI, sp);
    }

    iv[1] = xData->size[1];
    emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &iv1[0], 2, &b_emlrtECI, sp);
    c_t = static_cast<int32_T>(((b_t - tTrans) + 1.0));
    for (i1 = 0; i1 < loop_ub; i1++) {
      xData->data[(c_t + xData->size[0] * i1) - 1] = x_data[i1];
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* xData = xData(tTrans:tTotal,:); */
}

static void d_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, const emxArray_real_T
  *par_I, const real_T x0_data[], const int32_T x0_size[2], real_T nDim, real_T
  tTrans, real_T tTotal, emxArray_real_T *xData)
{
  int32_T loop_ub;
  int32_T x_size[2];
  real_T x_data[3];
  int32_T i;
  int32_T t;
  real_T d;
  real_T b_t;
  int32_T i1;
  int32_T iv[2];
  int32_T c_t;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  if (1.0 > nDim) {
    loop_ub = 0;
  } else {
    if (1 > x0_size[1]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, x0_size[1], &d_emlrtBCI, sp);
    }

    loop_ub = static_cast<int32_T>(nDim);
    if ((loop_ub < 1) || (loop_ub > x0_size[1])) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, x0_size[1], &e_emlrtBCI, sp);
    }
  }

  x_size[0] = 1;
  x_size[1] = loop_ub;
  if (0 <= loop_ub - 1) {
    memcpy(&x_data[0], &x0_data[0], loop_ub * sizeof(real_T));
  }

  i = static_cast<int32_T>(tTrans);
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, tTrans, mxDOUBLE_CLASS,
    static_cast<int32_T>(tTrans), &emlrtRTEI, sp);
  for (t = 0; t < i; t++) {
    st.site = &h_emlrtRSI;
    KTzTanhIterLocal(&st, par_K, par_T, par_d, par_l, par_xR, par_H, par_I,
                     x_data, x_size, static_cast<real_T>(t) + 1.0);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  d = (tTotal - tTrans) + 1.0;
  if (!(d >= 0.0)) {
    emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
  }

  b_t = static_cast<int32_T>(muDoubleScalarFloor(d));
  if (d != b_t) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, sp);
  }

  i = xData->size[0] * xData->size[1];
  i1 = static_cast<int32_T>(d);
  xData->size[0] = i1;
  xData->size[1] = static_cast<int32_T>(nDim);
  emxEnsureCapacity_real_T(sp, xData, i, &l_emlrtRTEI);
  if (d != b_t) {
    emlrtIntegerCheckR2012b(d, &d_emlrtDCI, sp);
  }

  loop_ub = i1 * static_cast<int32_T>(nDim);
  for (i = 0; i < loop_ub; i++) {
    xData->data[i] = 0.0;
  }

  if (1 > i1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i1, &f_emlrtBCI, sp);
  }

  iv[0] = 1;
  iv[1] = static_cast<int32_T>(nDim);
  emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &x_size[0], 2, &emlrtECI, sp);
  loop_ub = x_size[1];
  for (i = 0; i < loop_ub; i++) {
    xData->data[xData->size[0] * i] = x_data[i];
  }

  i = static_cast<int32_T>((tTotal + (1.0 - (tTrans + 1.0))));
  emlrtForLoopVectorCheckR2012b(tTrans + 1.0, 1.0, tTotal, mxDOUBLE_CLASS, i,
    &b_emlrtRTEI, sp);
  if (0 <= i - 1) {
    iv[0] = 1;
  }

  for (t = 0; t < i; t++) {
    b_t = (tTrans + 1.0) + static_cast<real_T>(t);
    st.site = &i_emlrtRSI;
    KTzTanhIterLocal(&st, par_K, par_T, par_d, par_l, par_xR, par_H, par_I,
                     x_data, x_size, b_t);
    d = (b_t - tTrans) + 1.0;
    if (d != static_cast<int32_T>(muDoubleScalarFloor(d))) {
      emlrtIntegerCheckR2012b(d, &emlrtDCI, sp);
    }

    i1 = static_cast<int32_T>(d);
    if ((i1 < 1) || (i1 > xData->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, xData->size[0], &g_emlrtBCI, sp);
    }

    iv[1] = xData->size[1];
    emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &x_size[0], 2, &b_emlrtECI, sp);
    c_t = static_cast<int32_T>(((b_t - tTrans) + 1.0));
    loop_ub = x_size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      xData->data[(c_t + xData->size[0] * i1) - 1] = x_data[i1];
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* xData = xData(tTrans:tTotal,:); */
}

static void e_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_H, real_T par_Q, const emxArray_real_T *par_I, const real_T
  x0_data[], const int32_T x0_size[2], real_T nDim, real_T tTrans, real_T tTotal,
  emxArray_real_T *xData)
{
  int32_T loop_ub;
  real_T x_data[3];
  int32_T i;
  int32_T t;
  real_T d;
  real_T x;
  int32_T i1;
  int32_T iv[2];
  int32_T iv1[2];
  real_T b_t;
  int32_T c_t;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  if (1.0 > nDim) {
    loop_ub = 0;
  } else {
    if (1 > x0_size[1]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, x0_size[1], &d_emlrtBCI, sp);
    }

    loop_ub = static_cast<int32_T>(nDim);
    if ((loop_ub < 1) || (loop_ub > x0_size[1])) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, x0_size[1], &e_emlrtBCI, sp);
    }
  }

  if (0 <= loop_ub - 1) {
    memcpy(&x_data[0], &x0_data[0], loop_ub * sizeof(real_T));
  }

  i = static_cast<int32_T>(tTrans);
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, tTrans, mxDOUBLE_CLASS,
    static_cast<int32_T>(tTrans), &emlrtRTEI, sp);
  for (t = 0; t < i; t++) {
    st.site = &h_emlrtRSI;

    /* function x = KTzTanhIterLocal_ignoreH(par, x, t) */
    /*     xAnt = x(1); */
    /*     x(1) = tanh((xAnt - par.K.*x(2) + x(3) + getParValAt(par.I,t)) ./ par.T); */
    /*     x(2) = xAnt; */
    /*     x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR); */
    /* end */
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &r_emlrtBCI, &st);
    }

    d = x_data[0];
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &t_emlrtBCI, &st);
    }

    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &s_emlrtBCI, &st);
    }

    b_st.site = &n_emlrtRSI;
    x = (((x_data[0] - par_K * x_data[1]) + par_Q) + getParValAt(&b_st, par_I,
          static_cast<real_T>(t) + 1.0)) / par_T;
    x_data[0] = muDoubleScalarTanh(x);
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &u_emlrtBCI, &st);
    }

    x_data[1] = muDoubleScalarTanh((d + par_H) / par_T);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  d = (tTotal - tTrans) + 1.0;
  if (!(d >= 0.0)) {
    emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
  }

  x = static_cast<int32_T>(muDoubleScalarFloor(d));
  if (d != x) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, sp);
  }

  i = xData->size[0] * xData->size[1];
  i1 = static_cast<int32_T>(d);
  xData->size[0] = i1;
  xData->size[1] = static_cast<int32_T>(nDim);
  emxEnsureCapacity_real_T(sp, xData, i, &l_emlrtRTEI);
  if (d != x) {
    emlrtIntegerCheckR2012b(d, &d_emlrtDCI, sp);
  }

  t = i1 * static_cast<int32_T>(nDim);
  for (i = 0; i < t; i++) {
    xData->data[i] = 0.0;
  }

  if (1 > i1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i1, &f_emlrtBCI, sp);
  }

  iv[0] = 1;
  iv[1] = static_cast<int32_T>(nDim);
  iv1[0] = 1;
  iv1[1] = loop_ub;
  emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &iv1[0], 2, &emlrtECI, sp);
  for (i = 0; i < loop_ub; i++) {
    xData->data[xData->size[0] * i] = x_data[i];
  }

  i = static_cast<int32_T>((tTotal + (1.0 - (tTrans + 1.0))));
  emlrtForLoopVectorCheckR2012b(tTrans + 1.0, 1.0, tTotal, mxDOUBLE_CLASS, i,
    &b_emlrtRTEI, sp);
  if (0 <= i - 1) {
    iv[0] = 1;
    iv1[0] = 1;
    iv1[1] = loop_ub;
  }

  for (t = 0; t < i; t++) {
    b_t = (tTrans + 1.0) + static_cast<real_T>(t);
    st.site = &i_emlrtRSI;

    /* function x = KTzTanhIterLocal_ignoreH(par, x, t) */
    /*     xAnt = x(1); */
    /*     x(1) = tanh((xAnt - par.K.*x(2) + x(3) + getParValAt(par.I,t)) ./ par.T); */
    /*     x(2) = xAnt; */
    /*     x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR); */
    /* end */
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &r_emlrtBCI, &st);
    }

    d = x_data[0];
    if (1 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &t_emlrtBCI, &st);
    }

    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &s_emlrtBCI, &st);
    }

    b_st.site = &n_emlrtRSI;
    x = (((x_data[0] - par_K * x_data[1]) + par_Q) + getParValAt(&b_st, par_I,
          b_t)) / par_T;
    x_data[0] = muDoubleScalarTanh(x);
    if (2 > static_cast<int8_T>(loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, static_cast<int32_T>
        (static_cast<int8_T>(loop_ub)), &u_emlrtBCI, &st);
    }

    x_data[1] = muDoubleScalarTanh((d + par_H) / par_T);
    d = (b_t - tTrans) + 1.0;
    if (d != static_cast<int32_T>(muDoubleScalarFloor(d))) {
      emlrtIntegerCheckR2012b(d, &emlrtDCI, sp);
    }

    i1 = static_cast<int32_T>(d);
    if ((i1 < 1) || (i1 > xData->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, xData->size[0], &g_emlrtBCI, sp);
    }

    iv[1] = xData->size[1];
    emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &iv1[0], 2, &b_emlrtECI, sp);
    c_t = static_cast<int32_T>(((b_t - tTrans) + 1.0));
    for (i1 = 0; i1 < loop_ub; i1++) {
      xData->data[(c_t + xData->size[0] * i1) - 1] = x_data[i1];
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* xData = xData(tTrans:tTotal,:); */
}

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  const mxArray *y;
  int32_T iv[2];
  const mxArray *m;
  real_T *pData;
  int32_T i;
  int32_T b_i;
  y = NULL;
  iv[0] = u->size[0];
  iv[1] = u->size[1];
  m = emlrtCreateNumericArray(2, &iv[0], mxDOUBLE_CLASS, mxREAL);
  pData = emlrtMxGetPr(m);
  i = 0;
  for (b_i = 0; b_i < u->size[1]; b_i++) {
    pData[i] = u->data[b_i];
    i++;
  }

  emlrtAssign(&y, m);
  return y;
}

static void error(const emlrtStack *sp, const mxArray *b, const mxArray *c,
                  emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  pArrays[0] = b;
  pArrays[1] = c;
  emlrtCallMATLABR2012b(sp, 0, NULL, 2, pArrays, "error", true, location);
}

static void f_KTAtratorLocal(const emlrtStack *sp, real_T par_K, real_T par_T,
  real_T par_d, real_T par_l, real_T par_xR, real_T par_H, real_T par_Q, const
  emxArray_real_T *par_I, const real_T x0_data[], const int32_T x0_size[2],
  real_T nDim, real_T tTrans, real_T tTotal, emxArray_real_T *xData)
{
  int32_T loop_ub;
  int32_T x_size[2];
  real_T x_data[3];
  int32_T i;
  int32_T t;
  real_T d;
  real_T b_t;
  int32_T i1;
  int32_T iv[2];
  int32_T c_t;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  if (1.0 > nDim) {
    loop_ub = 0;
  } else {
    if (1 > x0_size[1]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, x0_size[1], &d_emlrtBCI, sp);
    }

    loop_ub = static_cast<int32_T>(nDim);
    if ((loop_ub < 1) || (loop_ub > x0_size[1])) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, x0_size[1], &e_emlrtBCI, sp);
    }
  }

  x_size[0] = 1;
  x_size[1] = loop_ub;
  if (0 <= loop_ub - 1) {
    memcpy(&x_data[0], &x0_data[0], loop_ub * sizeof(real_T));
  }

  i = static_cast<int32_T>(tTrans);
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, tTrans, mxDOUBLE_CLASS,
    static_cast<int32_T>(tTrans), &emlrtRTEI, sp);
  for (t = 0; t < i; t++) {
    st.site = &h_emlrtRSI;
    KTz2TanhIterLocal(&st, par_K, par_T, par_d, par_l, par_xR, par_H, par_Q,
                      par_I, x_data, x_size, static_cast<real_T>(t) + 1.0);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  d = (tTotal - tTrans) + 1.0;
  if (!(d >= 0.0)) {
    emlrtNonNegativeCheckR2012b(d, &c_emlrtDCI, sp);
  }

  b_t = static_cast<int32_T>(muDoubleScalarFloor(d));
  if (d != b_t) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, sp);
  }

  i = xData->size[0] * xData->size[1];
  i1 = static_cast<int32_T>(d);
  xData->size[0] = i1;
  xData->size[1] = static_cast<int32_T>(nDim);
  emxEnsureCapacity_real_T(sp, xData, i, &l_emlrtRTEI);
  if (d != b_t) {
    emlrtIntegerCheckR2012b(d, &d_emlrtDCI, sp);
  }

  loop_ub = i1 * static_cast<int32_T>(nDim);
  for (i = 0; i < loop_ub; i++) {
    xData->data[i] = 0.0;
  }

  if (1 > i1) {
    emlrtDynamicBoundsCheckR2012b(1, 1, i1, &f_emlrtBCI, sp);
  }

  iv[0] = 1;
  iv[1] = static_cast<int32_T>(nDim);
  emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &x_size[0], 2, &emlrtECI, sp);
  loop_ub = x_size[1];
  for (i = 0; i < loop_ub; i++) {
    xData->data[xData->size[0] * i] = x_data[i];
  }

  i = static_cast<int32_T>((tTotal + (1.0 - (tTrans + 1.0))));
  emlrtForLoopVectorCheckR2012b(tTrans + 1.0, 1.0, tTotal, mxDOUBLE_CLASS, i,
    &b_emlrtRTEI, sp);
  if (0 <= i - 1) {
    iv[0] = 1;
  }

  for (t = 0; t < i; t++) {
    b_t = (tTrans + 1.0) + static_cast<real_T>(t);
    st.site = &i_emlrtRSI;
    KTz2TanhIterLocal(&st, par_K, par_T, par_d, par_l, par_xR, par_H, par_Q,
                      par_I, x_data, x_size, b_t);
    d = (b_t - tTrans) + 1.0;
    if (d != static_cast<int32_T>(muDoubleScalarFloor(d))) {
      emlrtIntegerCheckR2012b(d, &emlrtDCI, sp);
    }

    i1 = static_cast<int32_T>(d);
    if ((i1 < 1) || (i1 > xData->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, xData->size[0], &g_emlrtBCI, sp);
    }

    iv[1] = xData->size[1];
    emlrtSubAssignSizeCheckR2012b(&iv[0], 2, &x_size[0], 2, &b_emlrtECI, sp);
    c_t = static_cast<int32_T>(((b_t - tTrans) + 1.0));
    loop_ub = x_size[1];
    for (i1 = 0; i1 < loop_ub; i1++) {
      xData->data[(c_t + xData->size[0] * i1) - 1] = x_data[i1];
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  /* xData = xData(tTrans:tTotal,:); */
}

static void figure(const emlrtStack *sp, emlrtMCInfo *location)
{
  emlrtCallMATLABR2012b(sp, 0, NULL, 0, NULL, "figure", true, location);
}

static real_T getParValAt(const emlrtStack *sp, const emxArray_real_T *p, real_T
  t)
{
  real_T r;
  int32_T i;
  r = t - 1.0;
  if (p->size[1] == 0) {
    if (t - 1.0 == 0.0) {
      r = 0.0;
    }
  } else if (muDoubleScalarIsNaN(t - 1.0) || muDoubleScalarIsInf(t - 1.0)) {
    r = rtNaN;
  } else if (t - 1.0 == 0.0) {
    r = 0.0;
  } else {
    r = muDoubleScalarRem(t - 1.0, static_cast<real_T>(p->size[1]));
    if (r == 0.0) {
      r = 0.0;
    } else {
      if (t - 1.0 < 0.0) {
        r += static_cast<real_T>(p->size[1]);
      }
    }
  }

  if (r + 1.0 != static_cast<int32_T>(muDoubleScalarFloor(r + 1.0))) {
    emlrtIntegerCheckR2012b(r + 1.0, &e_emlrtDCI, sp);
  }

  i = static_cast<int32_T>((r + 1.0));
  if ((i < 1) || (i > p->size[1])) {
    emlrtDynamicBoundsCheckR2012b(i, 1, p->size[1], &m_emlrtBCI, sp);
  }

  return p->data[i - 1];
}

static void plot(const emlrtStack *sp, const mxArray *b, const mxArray *c, const
                 mxArray *d, const mxArray *e, const mxArray *f, emlrtMCInfo
                 *location)
{
  const mxArray *pArrays[5];
  pArrays[0] = b;
  pArrays[1] = c;
  pArrays[2] = d;
  pArrays[3] = e;
  pArrays[4] = f;
  emlrtCallMATLABR2012b(sp, 0, NULL, 5, pArrays, "plot", true, location);
}

void KTAtrator(const emlrtStack *sp, struct0_T *par, const real_T x0_data[],
               const int32_T x0_size[2], real_T tTrans, real_T tTotal, const
               emxArray_char_T *ktIterN, const emxArray_char_T *plotStyle,
               boolean_T plotTimeEvol, boolean_T ignore_H_KTz, emxArray_real_T
               *xData)
{
  emxArray_int32_T *match_out;
  emxArray_int32_T *matches;
  int32_T i;
  int32_T size_tmp[2];
  int32_T match_idx;
  int32_T b_i;
  int32_T j;
  emxArray_real_T *b_xData;
  static const char_T cv[5] = { 'K', 'T', 'L', 'o', 'g' };

  emxArray_real_T *y;
  static const char_T cv1[6] = { 'K', 'T', 'z', 'L', 'o', 'g' };

  const mxArray *b_y;
  static const char_T cv2[6] = { 'K', 'T', 'T', 'a', 'n', 'h' };

  const mxArray *m;
  emxArray_real_T *b_tTrans;
  const mxArray *c_y;
  static const char_T cv3[7] = { 'K', 'T', 'z', 'T', 'a', 'n', 'h' };

  const mxArray *m1;
  static const int32_T iv[2] = { 1, 10 };

  const mxArray *m2;
  static const char_T u[10] = { 'M', 'a', 'r', 'k', 'e', 'r', 'S', 'i', 'z', 'e'
  };

  const mxArray *d_y;
  static const char_T cv4[7] = { 'K', 'T', '2', 'T', 'a', 'n', 'h' };

  const mxArray *m3;
  static const int32_T iv1[2] = { 1, 17 };

  const mxArray *m4;
  const mxArray *m5;
  static const int32_T iv2[2] = { 1, 10 };

  static const char_T varargin_1[17] = { 'K', 'T', 'A', 't', 'r', 'a', 't', 'o',
    'r', ':', 'k', 't', 'I', 't', 'e', 'r', 'N' };

  static const char_T cv5[8] = { 'K', 'T', 'z', '2', 'T', 'a', 'n', 'h' };

  const mxArray *m6;
  static const int32_T iv3[2] = { 1, 22 };

  const mxArray *m7;
  static const char_T varargin_2[22] = { 'k', 't', 'I', 't', 'e', 'r', 'N', ' ',
    'n', 'o', 't', ' ', 'r', 'e', 'c', 'o', 'g', 'n', 'i', 'z', 'e', 'd' };

  emxArray_real_T *c_xData;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);
  if (ignore_H_KTz) {
    par->H = 0.0;
  }

  /* if ~isempty(strfind(ktIterN, 'KTz')) */
  /*     nDim = 3; */
  /* else */
  /*     nDim = 2; */
  /* end */
  emxInit_int32_T(sp, &match_out, 2, &c_emlrtRTEI, true);
  emxInit_int32_T(sp, &matches, 2, &k_emlrtRTEI, true);
  if (ktIterN->size[1] == 0) {
    size_tmp[1] = 0;
  } else {
    i = matches->size[0] * matches->size[1];
    matches->size[0] = 1;
    matches->size[1] = ktIterN->size[1];
    emxEnsureCapacity_int32_T(sp, matches, i, &c_emlrtRTEI);
    match_idx = 0;
    i = ktIterN->size[1];
    for (b_i = 0; b_i <= i - 5; b_i++) {
      j = 1;
      while ((j <= 5) && (ktIterN->data[(b_i + j) - 1] == cv[j - 1])) {
        j++;
      }

      if (j > 5) {
        matches->data[match_idx] = b_i + 1;
        match_idx++;
      }
    }

    i = match_out->size[0] * match_out->size[1];
    match_out->size[0] = 1;
    match_out->size[1] = match_idx;
    emxEnsureCapacity_int32_T(sp, match_out, i, &d_emlrtRTEI);
    for (b_i = 0; b_i < match_idx; b_i++) {
      match_out->data[b_i] = matches->data[b_i];
    }

    size_tmp[1] = match_out->size[1];
  }

  if (size_tmp[1] != 0) {
    st.site = &emlrtRSI;
    KTAtratorLocal(&st, par->K, par->T, par->H, par->b_I, x0_data, x0_size,
                   static_cast<real_T>(x0_size[1]), tTrans, tTotal, xData);
  } else {
    if (ktIterN->size[1] == 0) {
      size_tmp[1] = 0;
    } else {
      i = matches->size[0] * matches->size[1];
      matches->size[0] = 1;
      matches->size[1] = ktIterN->size[1];
      emxEnsureCapacity_int32_T(sp, matches, i, &c_emlrtRTEI);
      match_idx = 0;
      i = ktIterN->size[1];
      for (b_i = 0; b_i <= i - 6; b_i++) {
        j = 1;
        while ((j <= 6) && (ktIterN->data[(b_i + j) - 1] == cv1[j - 1])) {
          j++;
        }

        if (j > 6) {
          matches->data[match_idx] = b_i + 1;
          match_idx++;
        }
      }

      i = match_out->size[0] * match_out->size[1];
      match_out->size[0] = 1;
      match_out->size[1] = match_idx;
      emxEnsureCapacity_int32_T(sp, match_out, i, &d_emlrtRTEI);
      for (b_i = 0; b_i < match_idx; b_i++) {
        match_out->data[b_i] = matches->data[b_i];
      }

      size_tmp[1] = match_out->size[1];
    }

    if (size_tmp[1] != 0) {
      st.site = &b_emlrtRSI;
      b_KTAtratorLocal(&st, par->K, par->T, par->d, par->l, par->xR, par->H,
                       par->b_I, x0_data, x0_size, static_cast<real_T>(x0_size[1]),
                       tTrans, tTotal, xData);
    } else {
      if (ktIterN->size[1] == 0) {
        size_tmp[1] = 0;
      } else {
        i = matches->size[0] * matches->size[1];
        matches->size[0] = 1;
        matches->size[1] = ktIterN->size[1];
        emxEnsureCapacity_int32_T(sp, matches, i, &c_emlrtRTEI);
        match_idx = 0;
        i = ktIterN->size[1];
        for (b_i = 0; b_i <= i - 6; b_i++) {
          j = 1;
          while ((j <= 6) && (ktIterN->data[(b_i + j) - 1] == cv2[j - 1])) {
            j++;
          }

          if (j > 6) {
            matches->data[match_idx] = b_i + 1;
            match_idx++;
          }
        }

        i = match_out->size[0] * match_out->size[1];
        match_out->size[0] = 1;
        match_out->size[1] = match_idx;
        emxEnsureCapacity_int32_T(sp, match_out, i, &d_emlrtRTEI);
        for (b_i = 0; b_i < match_idx; b_i++) {
          match_out->data[b_i] = matches->data[b_i];
        }

        size_tmp[1] = match_out->size[1];
      }

      if (size_tmp[1] != 0) {
        st.site = &c_emlrtRSI;
        c_KTAtratorLocal(&st, par->K, par->T, par->H, par->b_I, x0_data, x0_size,
                         static_cast<real_T>(x0_size[1]), tTrans, tTotal, xData);
      } else {
        if (ktIterN->size[1] == 0) {
          size_tmp[1] = 0;
        } else {
          i = matches->size[0] * matches->size[1];
          matches->size[0] = 1;
          matches->size[1] = ktIterN->size[1];
          emxEnsureCapacity_int32_T(sp, matches, i, &c_emlrtRTEI);
          match_idx = 0;
          i = ktIterN->size[1];
          for (b_i = 0; b_i <= i - 7; b_i++) {
            j = 1;
            while ((j <= 7) && (ktIterN->data[(b_i + j) - 1] == cv3[j - 1])) {
              j++;
            }

            if (j > 7) {
              matches->data[match_idx] = b_i + 1;
              match_idx++;
            }
          }

          i = match_out->size[0] * match_out->size[1];
          match_out->size[0] = 1;
          match_out->size[1] = match_idx;
          emxEnsureCapacity_int32_T(sp, match_out, i, &d_emlrtRTEI);
          for (b_i = 0; b_i < match_idx; b_i++) {
            match_out->data[b_i] = matches->data[b_i];
          }

          size_tmp[1] = match_out->size[1];
        }

        if (size_tmp[1] != 0) {
          st.site = &d_emlrtRSI;
          d_KTAtratorLocal(&st, par->K, par->T, par->d, par->l, par->xR, par->H,
                           par->b_I, x0_data, x0_size, static_cast<real_T>
                           (x0_size[1]), tTrans, tTotal, xData);
        } else {
          if (ktIterN->size[1] == 0) {
            size_tmp[1] = 0;
          } else {
            i = matches->size[0] * matches->size[1];
            matches->size[0] = 1;
            matches->size[1] = ktIterN->size[1];
            emxEnsureCapacity_int32_T(sp, matches, i, &c_emlrtRTEI);
            match_idx = 0;
            i = ktIterN->size[1];
            for (b_i = 0; b_i <= i - 7; b_i++) {
              j = 1;
              while ((j <= 7) && (ktIterN->data[(b_i + j) - 1] == cv4[j - 1])) {
                j++;
              }

              if (j > 7) {
                matches->data[match_idx] = b_i + 1;
                match_idx++;
              }
            }

            i = match_out->size[0] * match_out->size[1];
            match_out->size[0] = 1;
            match_out->size[1] = match_idx;
            emxEnsureCapacity_int32_T(sp, match_out, i, &d_emlrtRTEI);
            for (b_i = 0; b_i < match_idx; b_i++) {
              match_out->data[b_i] = matches->data[b_i];
            }

            size_tmp[1] = match_out->size[1];
          }

          if (size_tmp[1] != 0) {
            st.site = &e_emlrtRSI;
            e_KTAtratorLocal(&st, par->K, par->T, par->H, par->Q, par->b_I,
                             x0_data, x0_size, static_cast<real_T>(x0_size[1]),
                             tTrans, tTotal, xData);
          } else {
            if (ktIterN->size[1] == 0) {
              size_tmp[1] = 0;
            } else {
              i = matches->size[0] * matches->size[1];
              matches->size[0] = 1;
              matches->size[1] = ktIterN->size[1];
              emxEnsureCapacity_int32_T(sp, matches, i, &c_emlrtRTEI);
              match_idx = 0;
              i = ktIterN->size[1];
              for (b_i = 0; b_i <= i - 8; b_i++) {
                j = 1;
                while ((j <= 8) && (ktIterN->data[(b_i + j) - 1] == cv5[j - 1]))
                {
                  j++;
                }

                if (j > 8) {
                  matches->data[match_idx] = b_i + 1;
                  match_idx++;
                }
              }

              i = match_out->size[0] * match_out->size[1];
              match_out->size[0] = 1;
              match_out->size[1] = match_idx;
              emxEnsureCapacity_int32_T(sp, match_out, i, &d_emlrtRTEI);
              for (b_i = 0; b_i < match_idx; b_i++) {
                match_out->data[b_i] = matches->data[b_i];
              }

              size_tmp[1] = match_out->size[1];
            }

            if (size_tmp[1] != 0) {
              st.site = &f_emlrtRSI;
              f_KTAtratorLocal(&st, par->K, par->T, par->d, par->l, par->xR,
                               par->H, par->Q, par->b_I, x0_data, x0_size,
                               static_cast<real_T>(x0_size[1]), tTrans, tTotal,
                               xData);
            } else {
              st.site = &g_emlrtRSI;
              b_y = NULL;
              m3 = emlrtCreateCharArray(2, iv1);
              emlrtInitCharArrayR2013a(&st, 17, m3, &varargin_1[0]);
              emlrtAssign(&b_y, m3);
              c_y = NULL;
              m6 = emlrtCreateCharArray(2, iv3);
              emlrtInitCharArrayR2013a(&st, 22, m6, &varargin_2[0]);
              emlrtAssign(&c_y, m6);
              b_st.site = &s_emlrtRSI;
              error(&b_st, b_y, c_y, &d_emlrtMCI);
            }
          }
        }
      }
    }
  }

  emxFree_int32_T(&matches);
  emxFree_int32_T(&match_out);
  if (plotStyle->size[1] != 0) {
    st.site = &p_emlrtRSI;
    figure(&st, &emlrtMCI);
    emxInit_real_T(sp, &b_xData, 1, &f_emlrtRTEI, true);
    if (plotTimeEvol) {
      if (1 > xData->size[1]) {
        emlrtDynamicBoundsCheckR2012b(1, 1, xData->size[1], &emlrtBCI, sp);
      }

      emxInit_real_T(sp, &y, 2, &j_emlrtRTEI, true);
      if (xData->size[0] < 1) {
        y->size[0] = 1;
        y->size[1] = 0;
      } else {
        i = y->size[0] * y->size[1];
        y->size[0] = 1;
        y->size[1] = static_cast<int32_T>((static_cast<real_T>(xData->size[0]) -
          1.0)) + 1;
        emxEnsureCapacity_real_T(sp, y, i, &e_emlrtRTEI);
        match_idx = static_cast<int32_T>((static_cast<real_T>(xData->size[0]) -
          1.0));
        for (i = 0; i <= match_idx; i++) {
          y->data[i] = static_cast<real_T>(i) + 1.0;
        }
      }

      emxInit_real_T(sp, &b_tTrans, 2, &g_emlrtRTEI, true);
      b_y = NULL;
      size_tmp[0] = plotStyle->size[0];
      size_tmp[1] = plotStyle->size[1];
      m2 = emlrtCreateCharArray(2, &size_tmp[0]);
      emlrtInitCharArrayR2013a(sp, plotStyle->size[1], m2, &plotStyle->data[0]);
      emlrtAssign(&b_y, m2);
      c_y = NULL;
      m5 = emlrtCreateCharArray(2, iv2);
      emlrtInitCharArrayR2013a(sp, 10, m5, &u[0]);
      emlrtAssign(&c_y, m5);
      d_y = NULL;
      m7 = emlrtCreateDoubleScalar(2.5);
      emlrtAssign(&d_y, m7);
      i = b_tTrans->size[0] * b_tTrans->size[1];
      b_tTrans->size[0] = 1;
      b_tTrans->size[1] = y->size[1];
      emxEnsureCapacity_real_T(sp, b_tTrans, i, &g_emlrtRTEI);
      match_idx = y->size[0] * y->size[1];
      for (i = 0; i < match_idx; i++) {
        b_tTrans->data[i] = (tTrans + -1.0) + y->data[i];
      }

      emxFree_real_T(&y);
      match_idx = xData->size[0];
      i = b_xData->size[0];
      b_xData->size[0] = xData->size[0];
      emxEnsureCapacity_real_T(sp, b_xData, i, &i_emlrtRTEI);
      for (i = 0; i < match_idx; i++) {
        b_xData->data[i] = xData->data[i];
      }

      st.site = &q_emlrtRSI;
      plot(&st, emlrt_marshallOut(b_tTrans), b_emlrt_marshallOut(b_xData), b_y,
           c_y, d_y, &b_emlrtMCI);
      emxFree_real_T(&b_tTrans);
    } else {
      if (1 > xData->size[1]) {
        emlrtDynamicBoundsCheckR2012b(1, 1, xData->size[1], &b_emlrtBCI, sp);
      }

      if (2 > xData->size[1]) {
        emlrtDynamicBoundsCheckR2012b(2, 1, xData->size[1], &c_emlrtBCI, sp);
      }

      b_y = NULL;
      size_tmp[0] = plotStyle->size[0];
      size_tmp[1] = plotStyle->size[1];
      m = emlrtCreateCharArray(2, &size_tmp[0]);
      emlrtInitCharArrayR2013a(sp, plotStyle->size[1], m, &plotStyle->data[0]);
      emlrtAssign(&b_y, m);
      c_y = NULL;
      m1 = emlrtCreateCharArray(2, iv);
      emlrtInitCharArrayR2013a(sp, 10, m1, &u[0]);
      emlrtAssign(&c_y, m1);
      d_y = NULL;
      m4 = emlrtCreateDoubleScalar(2.5);
      emlrtAssign(&d_y, m4);
      match_idx = xData->size[0];
      i = b_xData->size[0];
      b_xData->size[0] = xData->size[0];
      emxEnsureCapacity_real_T(sp, b_xData, i, &f_emlrtRTEI);
      for (i = 0; i < match_idx; i++) {
        b_xData->data[i] = xData->data[i];
      }

      emxInit_real_T(sp, &c_xData, 1, &h_emlrtRTEI, true);
      match_idx = xData->size[0];
      i = c_xData->size[0];
      c_xData->size[0] = xData->size[0];
      emxEnsureCapacity_real_T(sp, c_xData, i, &h_emlrtRTEI);
      for (i = 0; i < match_idx; i++) {
        c_xData->data[i] = xData->data[i + xData->size[0]];
      }

      st.site = &r_emlrtRSI;
      plot(&st, b_emlrt_marshallOut(b_xData), b_emlrt_marshallOut(c_xData), b_y,
           c_y, d_y, &c_emlrtMCI);
      emxFree_real_T(&c_xData);
    }

    emxFree_real_T(&b_xData);
  }

  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (KTAtrator.cpp) */
