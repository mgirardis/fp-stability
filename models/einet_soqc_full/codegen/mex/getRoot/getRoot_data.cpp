/*
 * getRoot_data.cpp
 *
 * Code generation for function 'getRoot_data'
 *
 */

/* Include files */
#include "getRoot_data.h"
#include "getRoot.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;
const volatile char_T *emlrtBreakCheckR2012bFlagVar = NULL;
emlrtContext emlrtContextGlobal = { true,/* bFirstTime */
  false,                               /* bInitialized */
  131483U,                             /* fVersionInfo */
  NULL,                                /* fErrorFunction */
  "getRoot",                           /* fFunctionName */
  NULL,                                /* fRTCallStack */
  false,                               /* bDebugMode */
  { 2045744189U, 2170104910U, 2743257031U, 4284093946U },/* fSigWrd */
  NULL                                 /* fSigMem */
};

emlrtRSInfo n_emlrtRSI = { 21,         /* lineNo */
  "eml_int_forloop_overflow_check",    /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\lib\\matlab\\eml\\eml_int_forloop_overflow_check.m"/* pathName */
};

emlrtRSInfo hb_emlrtRSI = { 78,        /* lineNo */
  "ceval_xgehrd",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pathName */
};

emlrtRSInfo ib_emlrtRSI = { 65,        /* lineNo */
  "ceval_xgehrd",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pathName */
};

emlrtRSInfo jb_emlrtRSI = { 46,        /* lineNo */
  "ceval_xgehrd",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pathName */
};

emlrtRSInfo kb_emlrtRSI = { 45,        /* lineNo */
  "ceval_xgehrd",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgehrd.m"/* pathName */
};

emlrtRSInfo lb_emlrtRSI = { 9,         /* lineNo */
  "int",                               /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\int.m"/* pathName */
};

emlrtRSInfo mb_emlrtRSI = { 8,         /* lineNo */
  "majority",                          /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\majority.m"/* pathName */
};

emlrtRSInfo nb_emlrtRSI = { 31,        /* lineNo */
  "infocheck",                         /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\infocheck.m"/* pathName */
};

emlrtRSInfo qb_emlrtRSI = { 101,       /* lineNo */
  "ceval_xhseqr",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pathName */
};

emlrtRSInfo rb_emlrtRSI = { 90,        /* lineNo */
  "ceval_xhseqr",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pathName */
};

emlrtRSInfo sb_emlrtRSI = { 70,        /* lineNo */
  "ceval_xhseqr",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pathName */
};

emlrtRSInfo tb_emlrtRSI = { 69,        /* lineNo */
  "ceval_xhseqr",                      /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xhseqr.m"/* pathName */
};

emlrtRSInfo xb_emlrtRSI = { 91,        /* lineNo */
  "ceval_xgeev",                       /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pathName */
};

emlrtRSInfo yb_emlrtRSI = { 84,        /* lineNo */
  "ceval_xgeev",                       /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pathName */
};

emlrtRSInfo ac_emlrtRSI = { 50,        /* lineNo */
  "ceval_xgeev",                       /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pathName */
};

emlrtRSInfo bc_emlrtRSI = { 43,        /* lineNo */
  "ceval_xgeev",                       /* fcnName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\xgeev.m"/* pathName */
};

emlrtRTEInfo i_emlrtRTEI = { 45,       /* lineNo */
  13,                                  /* colNo */
  "infocheck",                         /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\infocheck.m"/* pName */
};

emlrtRTEInfo j_emlrtRTEI = { 48,       /* lineNo */
  13,                                  /* colNo */
  "infocheck",                         /* fName */
  "C:\\Program Files\\Polyspace\\R2019b\\toolbox\\eml\\eml\\+coder\\+internal\\+lapack\\infocheck.m"/* pName */
};

/* End of code generation (getRoot_data.cpp) */
