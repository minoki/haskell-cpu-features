{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
module System.CPUFeatures.X86.TypeBool
  (AESNI, sAESNI
  ,AMX_BF16, sAMX_BF16
  ,AMX_FP16, sAMX_FP16
  ,AMX_INT8, sAMX_INT8
  ,AMX_TILE, sAMX_TILE
  ,AVX, sAVX
  ,AVX_VNNI, sAVX_VNNI
  ,AVX10_1, sAVX10_1
  ,AVX10_2, sAVX10_2
  ,AVX2, sAVX2
  ,AVX512_BF16, sAVX512_BF16
  ,AVX512_BITALG, sAVX512_BITALG
  ,AVX512_FP16, sAVX512_FP16
  ,AVX512_IFMA, sAVX512_IFMA
  ,AVX512_VBMI, sAVX512_VBMI
  ,AVX512_VBMI2, sAVX512_VBMI2
  ,AVX512_VNNI, sAVX512_VNNI
  ,AVX512_VPOPCNTDQ, sAVX512_VPOPCNTDQ
  ,AVX512BW, sAVX512BW
  ,AVX512CD, sAVX512CD
  ,AVX512DQ, sAVX512DQ
  ,AVX512F, sAVX512F
  ,AVX512VL, sAVX512VL
  ,BMI1, sBMI1
  ,BMI2, sBMI2
  ,F16C, sF16C
  ,FMA, sFMA
  ,GFNI, sGFNI
  ,PCLMULQDQ, sPCLMULQDQ
  ,POPCNT, sPOPCNT
  ,RDRAND, sRDRAND
  ,SHA, sSHA
  ,SSE3, sSSE3
  ,SSE4_1, sSSE4_1
  ,SSE4_2, sSSE4_2
  ,SSSE3, sSSSE3
  ,VAES, sVAES
  ,VPCLMULQDQ, sVPCLMULQDQ
  ,SBool(..)
  ) where
import System.CPUFeatures.X86.Bool
import System.CPUFeatures.Util

type family AESNI :: Bool
type family AMX_BF16 :: Bool
type family AMX_FP16 :: Bool
type family AMX_INT8 :: Bool
type family AMX_TILE :: Bool
type family AVX :: Bool
type family AVX_VNNI :: Bool
type family AVX10_1 :: Bool
type family AVX10_2 :: Bool
type family AVX2 :: Bool
type family AVX512_BF16 :: Bool
type family AVX512_BITALG :: Bool
type family AVX512_FP16 :: Bool
type family AVX512_IFMA :: Bool
type family AVX512_VBMI :: Bool
type family AVX512_VBMI2 :: Bool
type family AVX512_VNNI :: Bool
type family AVX512_VPOPCNTDQ :: Bool
type family AVX512BW :: Bool
type family AVX512CD :: Bool
type family AVX512DQ :: Bool
type family AVX512F :: Bool
type family AVX512VL :: Bool
type family BMI1 :: Bool
type family BMI2 :: Bool
type family F16C :: Bool
type family FMA :: Bool
type family GFNI :: Bool
type family PCLMULQDQ :: Bool
type family POPCNT :: Bool
type family RDRAND :: Bool
type family SHA :: Bool
type family SSE3 :: Bool
type family SSE4_1 :: Bool
type family SSE4_2 :: Bool
type family SSSE3 :: Bool
type family VAES :: Bool
type family VPCLMULQDQ :: Bool

sAESNI :: SBool AESNI
sAMX_BF16 :: SBool AMX_BF16
sAMX_FP16 :: SBool AMX_FP16
sAMX_INT8 :: SBool AMX_INT8
sAMX_TILE :: SBool AMX_TILE
sAVX :: SBool AVX
sAVX_VNNI :: SBool AVX_VNNI
sAVX10_1 :: SBool AVX10_1
sAVX10_2 :: SBool AVX10_2
sAVX2 :: SBool AVX2
sAVX512_BF16 :: SBool AVX512_BF16
sAVX512_BITALG :: SBool AVX512_BITALG
sAVX512_FP16 :: SBool AVX512_FP16
sAVX512_IFMA :: SBool AVX512_IFMA
sAVX512_VBMI :: SBool AVX512_VBMI
sAVX512_VBMI2 :: SBool AVX512_VBMI2
sAVX512_VNNI :: SBool AVX512_VNNI
sAVX512_VPOPCNTDQ :: SBool AVX512_VPOPCNTDQ
sAVX512BW :: SBool AVX512BW
sAVX512CD :: SBool AVX512CD
sAVX512DQ :: SBool AVX512DQ
sAVX512F :: SBool AVX512F
sAVX512VL :: SBool AVX512VL
sBMI1 :: SBool BMI1
sBMI2 :: SBool BMI2
sF16C :: SBool F16C
sFMA :: SBool FMA
sGFNI :: SBool GFNI
sPCLMULQDQ :: SBool PCLMULQDQ
sPOPCNT :: SBool POPCNT
sRDRAND :: SBool RDRAND
sSHA :: SBool SHA
sSSE3 :: SBool SSE3
sSSE4_1 :: SBool SSE4_1
sSSE4_2 :: SBool SSE4_2
sSSSE3 :: SBool SSSE3
sVAES :: SBool VAES
sVPCLMULQDQ :: SBool VPCLMULQDQ

sAESNI = unsafeBoolToSBool bAESNI
sAMX_BF16 = unsafeBoolToSBool bAMX_BF16
sAMX_FP16 = unsafeBoolToSBool bAMX_FP16
sAMX_INT8 = unsafeBoolToSBool bAMX_INT8
sAMX_TILE = unsafeBoolToSBool bAMX_TILE
sAVX = unsafeBoolToSBool bAVX
sAVX_VNNI = unsafeBoolToSBool bAVX_VNNI
sAVX10_1 = unsafeBoolToSBool bAVX10_1
sAVX10_2 = unsafeBoolToSBool bAVX10_2
sAVX2 = unsafeBoolToSBool bAVX2
sAVX512_BF16 = unsafeBoolToSBool bAVX512_BF16
sAVX512_BITALG = unsafeBoolToSBool bAVX512_BITALG
sAVX512_FP16 = unsafeBoolToSBool bAVX512_FP16
sAVX512_IFMA = unsafeBoolToSBool bAVX512_IFMA
sAVX512_VBMI = unsafeBoolToSBool bAVX512_VBMI
sAVX512_VBMI2 = unsafeBoolToSBool bAVX512_VBMI2
sAVX512_VNNI = unsafeBoolToSBool bAVX512_VNNI
sAVX512_VPOPCNTDQ = unsafeBoolToSBool bAVX512_VPOPCNTDQ
sAVX512BW = unsafeBoolToSBool bAVX512BW
sAVX512CD = unsafeBoolToSBool bAVX512CD
sAVX512DQ = unsafeBoolToSBool bAVX512DQ
sAVX512F = unsafeBoolToSBool bAVX512F
sAVX512VL = unsafeBoolToSBool bAVX512VL
sBMI1 = unsafeBoolToSBool bBMI1
sBMI2 = unsafeBoolToSBool bBMI2
sF16C = unsafeBoolToSBool bF16C
sFMA = unsafeBoolToSBool bFMA
sGFNI = unsafeBoolToSBool bGFNI
sPCLMULQDQ = unsafeBoolToSBool bPCLMULQDQ
sPOPCNT = unsafeBoolToSBool bPOPCNT
sRDRAND = unsafeBoolToSBool bRDRAND
sSHA = unsafeBoolToSBool bSHA
sSSE3 = unsafeBoolToSBool bSSE3
sSSE4_1 = unsafeBoolToSBool bSSE4_1
sSSE4_2 = unsafeBoolToSBool bSSE4_2
sSSSE3 = unsafeBoolToSBool bSSSE3
sVAES = unsafeBoolToSBool bVAES
sVPCLMULQDQ = unsafeBoolToSBool bVPCLMULQDQ
