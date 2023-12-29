/*
 * KTAtrator_types.h
 *
 * Code generation for function 'KTAtrator_types'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"

/* Type Definitions */
struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_char_T
{
  char_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct emxArray_int32_T
{
  int32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

struct struct0_T
{
  real_T K;
  real_T T;
  real_T d;
  real_T l;
  real_T xR;
  real_T H;
  real_T Q;
  emxArray_real_T *b_I;
};

/* End of code generation (KTAtrator_types.h) */
