{-# LANGUAGE CPP #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE UnliftedFFITypes #-}
module System.CPUFeatures.X86
  (AESNI, bAESNI, sAESNI
  ,AMX_BF16, bAMX_BF16, sAMX_BF16
  ,AMX_INT8, bAMX_INT8, sAMX_INT8
  ,AMX_TILE, bAMX_TILE, sAMX_TILE
  ,AVX, bAVX, sAVX
  ,AVX_VNNI, bAVX_VNNI, sAVX_VNNI
  ,AVX2, bAVX2, sAVX2
  ,AVX512_BF16, bAVX512_BF16, sAVX512_BF16
  ,AVX512_BITALG, bAVX512_BITALG, sAVX512_BITALG
  ,AVX512_FP16, bAVX512_FP16, sAVX512_FP16
  ,AVX512_IFMA, bAVX512_IFMA, sAVX512_IFMA
  ,AVX512_VBMI, bAVX512_VBMI, sAVX512_VBMI
  ,AVX512_VBMI2, bAVX512_VBMI2, sAVX512_VBMI2
  ,AVX512_VNNI, bAVX512_VNNI, sAVX512_VNNI
  ,AVX512_VP2INTERSECT, bAVX512_VP2INTERSECT, sAVX512_VP2INTERSECT
  ,AVX512_VPOPCNTDQ, bAVX512_VPOPCNTDQ, sAVX512_VPOPCNTDQ
  ,AVX512BW, bAVX512BW, sAVX512BW
  ,AVX512CD, bAVX512CD, sAVX512CD
  ,AVX512DQ, bAVX512DQ, sAVX512DQ
  ,AVX512F, bAVX512F, sAVX512F
  ,AVX512VL, bAVX512VL, sAVX512VL
  ,BMI1, bBMI1, sBMI1
  ,BMI2, bBMI2, sBMI2
  ,F16C, bF16C, sF16C
  ,FMA, bFMA, sFMA
  ,GFNI, bGFNI, sGFNI
  ,PCLMULQDQ, bPCLMULQDQ, sPCLMULQDQ
  ,POPCNT, bPOPCNT, sPOPCNT
  ,RDRAND, bRDRAND, sRDRAND
  ,SHA, bSHA, sSHA
  ,SSE3, bSSE3, sSSE3
  ,SSE4_1, bSSE4_1, sSSE4_1
  ,SSE4_2, bSSE4_2, sSSE4_2
  ,SSSE3, bSSSE3, sSSSE3
  ,VAES, bVAES, sVAES
  ,VPCLMULQDQ, bVPCLMULQDQ, sVPCLMULQDQ
  ,SBool(..)
  ) where
import System.CPUFeatures.Util
#if defined(x86_64_HOST_ARCH)
import System.CPUFeatures.X86.Cpuid
import Data.Bits
#endif

type family AESNI :: Bool
type family AMX_BF16 :: Bool
type family AMX_INT8 :: Bool
type family AMX_TILE :: Bool
type family AVX :: Bool
type family AVX_VNNI :: Bool
type family AVX2 :: Bool
type family AVX512_BF16 :: Bool
type family AVX512_BITALG :: Bool
type family AVX512_FP16 :: Bool
type family AVX512_IFMA :: Bool
type family AVX512_VBMI :: Bool
type family AVX512_VBMI2 :: Bool
type family AVX512_VNNI :: Bool
type family AVX512_VP2INTERSECT :: Bool
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

bAESNI :: Bool
bAMX_BF16 :: Bool
bAMX_INT8 :: Bool
bAMX_TILE :: Bool
bAVX :: Bool
bAVX_VNNI :: Bool
bAVX2 :: Bool
bAVX512_BF16 :: Bool
bAVX512_BITALG :: Bool
bAVX512_FP16 :: Bool
bAVX512_IFMA :: Bool
bAVX512_VBMI :: Bool
bAVX512_VBMI2 :: Bool
bAVX512_VNNI :: Bool
bAVX512_VP2INTERSECT :: Bool
bAVX512_VPOPCNTDQ :: Bool
bAVX512BW :: Bool
bAVX512CD :: Bool
bAVX512DQ :: Bool
bAVX512F :: Bool
bAVX512VL :: Bool
bBMI1 :: Bool
bBMI2 :: Bool
bF16C :: Bool
bFMA :: Bool
bGFNI :: Bool
bPCLMULQDQ :: Bool
bPOPCNT :: Bool
bRDRAND :: Bool
bSHA :: Bool
bSSE3 :: Bool
bSSE4_1 :: Bool
bSSE4_2 :: Bool
bSSSE3 :: Bool
bVAES :: Bool
bVPCLMULQDQ :: Bool

sAESNI :: SBool AESNI
sAMX_BF16 :: SBool AMX_BF16
sAMX_INT8 :: SBool AMX_INT8
sAMX_TILE :: SBool AMX_TILE
sAVX :: SBool AVX
sAVX_VNNI :: SBool AVX_VNNI
sAVX2 :: SBool AVX2
sAVX512_BF16 :: SBool AVX512_BF16
sAVX512_BITALG :: SBool AVX512_BITALG
sAVX512_FP16 :: SBool AVX512_FP16
sAVX512_IFMA :: SBool AVX512_IFMA
sAVX512_VBMI :: SBool AVX512_VBMI
sAVX512_VBMI2 :: SBool AVX512_VBMI2
sAVX512_VNNI :: SBool AVX512_VNNI
sAVX512_VP2INTERSECT :: SBool AVX512_VP2INTERSECT
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

#if defined(x86_64_HOST_ARCH)

{-# NOINLINE cpuid_01 #-}
cpuid_01 :: CpuidResult
cpuid_01 = cpuid 0x1 0

{-# NOINLINE cpuid_07_0 #-}
cpuid_07_0 :: CpuidResult
cpuid_07_0 = cpuid 0x7 0

{-# NOINLINE cpuid_07_1 #-}
cpuid_07_1 :: CpuidResult
cpuid_07_1 = cpuid 0x7 1

bSSE3 = testBit (ecx cpuid_01) 0
bPCLMULQDQ = testBit (ecx cpuid_01) 1
bSSSE3 = testBit (ecx cpuid_01) 9
bFMA = testBit (ecx cpuid_01) 12
bSSE4_1 = testBit (ecx cpuid_01) 19
bSSE4_2 = testBit (ecx cpuid_01) 20
bPOPCNT = testBit (ecx cpuid_01) 23
bAESNI = testBit (ecx cpuid_01) 25
bAVX = testBit (ecx cpuid_01) 28
bF16C = testBit (ecx cpuid_01) 29
bRDRAND = testBit (ecx cpuid_01) 30
bBMI1 = testBit (ebx cpuid_07_0) 3
bAVX2 = testBit (ebx cpuid_07_0) 5
bBMI2 = testBit (ebx cpuid_07_0) 8
bAVX512F = testBit (ebx cpuid_07_0) 16
bAVX512DQ = testBit (ebx cpuid_07_0) 17
bAVX512_IFMA = testBit (ebx cpuid_07_0) 21
bAVX512CD = testBit (ebx cpuid_07_0) 28
bSHA = testBit (ebx cpuid_07_0) 29
bAVX512BW = testBit (ebx cpuid_07_0) 30
bAVX512VL = testBit (ebx cpuid_07_0) 31
bAVX512_VBMI = testBit (ecx cpuid_07_0) 1
bAVX512_VBMI2 = testBit (ecx cpuid_07_0) 6
bGFNI = testBit (ecx cpuid_07_0) 8
bVAES = testBit (ecx cpuid_07_0) 9
bVPCLMULQDQ = testBit (ecx cpuid_07_0) 10
bAVX512_VNNI = testBit (ecx cpuid_07_0) 11
bAVX512_BITALG = testBit (ecx cpuid_07_0) 12
bAVX512_VPOPCNTDQ = testBit (ecx cpuid_07_0) 14
bAVX512_VP2INTERSECT = testBit (edx cpuid_07_0) 8
bAMX_BF16 = testBit (edx cpuid_07_0) 22
bAVX512_FP16 = testBit (edx cpuid_07_0) 23
bAMX_TILE = testBit (edx cpuid_07_0) 24
bAMX_INT8 = testBit (edx cpuid_07_0) 25
bAVX_VNNI = testBit (eax cpuid_07_1) 4
bAVX512_BF16 = testBit (eax cpuid_07_1) 5

sAESNI = unsafeBoolToSBool bAESNI
sAMX_BF16 = unsafeBoolToSBool bAMX_BF16
sAMX_INT8 = unsafeBoolToSBool bAMX_INT8
sAMX_TILE = unsafeBoolToSBool bAMX_TILE
sAVX = unsafeBoolToSBool bAVX
sAVX_VNNI = unsafeBoolToSBool bAVX_VNNI
sAVX2 = unsafeBoolToSBool bAVX2
sAVX512_BF16 = unsafeBoolToSBool bAVX512_BF16
sAVX512_BITALG = unsafeBoolToSBool bAVX512_BITALG
sAVX512_FP16 = unsafeBoolToSBool bAVX512_FP16
sAVX512_IFMA = unsafeBoolToSBool bAVX512_IFMA
sAVX512_VBMI = unsafeBoolToSBool bAVX512_VBMI
sAVX512_VBMI2 = unsafeBoolToSBool bAVX512_VBMI2
sAVX512_VNNI = unsafeBoolToSBool bAVX512_VNNI
sAVX512_VP2INTERSECT = unsafeBoolToSBool bAVX512_VP2INTERSECT
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

#else

type instance AESNI = False
type instance AMX_BF16 = False
type instance AMX_INT8 = False
type instance AMX_TILE = False
type instance AVX = False
type instance AVX_VNNI = False
type instance AVX2 = False
type instance AVX512_BF16 = False
type instance AVX512_BITALG = False
type instance AVX512_FP16 = False
type instance AVX512_IFMA = False
type instance AVX512_VBMI = False
type instance AVX512_VBMI2 = False
type instance AVX512_VNNI = False
type instance AVX512_VP2INTERSECT = False
type instance AVX512_VPOPCNTDQ = False
type instance AVX512BW = False
type instance AVX512CD = False
type instance AVX512DQ = False
type instance AVX512F = False
type instance AVX512VL = False
type instance BMI1 = False
type instance BMI2 = False
type instance F16C = False
type instance FMA = False
type instance GFNI = False
type instance PCLMULQDQ = False
type instance POPCNT = False
type instance RDRAND = False
type instance SHA = False
type instance SSE3 = False
type instance SSE4_1 = False
type instance SSE4_2 = False
type instance SSSE3 = False
type instance VAES = False
type instance VPCLMULQDQ = False

{-# INLINE bAESNI #-}
bAESNI = False

{-# INLINE sAESNI #-}
sAESNI = SFalse

{-# INLINE bAMX_BF16 #-}
bAMX_BF16 = False

{-# INLINE sAMX_BF16 #-}
sAMX_BF16 = SFalse

{-# INLINE bAMX_INT8 #-}
bAMX_INT8 = False

{-# INLINE sAMX_INT8 #-}
sAMX_INT8 = SFalse

{-# INLINE bAMX_TILE #-}
bAMX_TILE = False

{-# INLINE sAMX_TILE #-}
sAMX_TILE = SFalse

{-# INLINE bAVX #-}
bAVX = False

{-# INLINE sAVX #-}
sAVX = SFalse

{-# INLINE bAVX_VNNI #-}
bAVX_VNNI = False

{-# INLINE sAVX_VNNI #-}
sAVX_VNNI = SFalse

{-# INLINE bAVX2 #-}
bAVX2 = False

{-# INLINE sAVX2 #-}
sAVX2 = SFalse

{-# INLINE bAVX512_BF16 #-}
bAVX512_BF16 = False

{-# INLINE sAVX512_BF16 #-}
sAVX512_BF16 = SFalse

{-# INLINE bAVX512_BITALG #-}
bAVX512_BITALG = False

{-# INLINE sAVX512_BITALG #-}
sAVX512_BITALG = SFalse

{-# INLINE bAVX512_FP16 #-}
bAVX512_FP16 = False

{-# INLINE sAVX512_FP16 #-}
sAVX512_FP16 = SFalse

{-# INLINE bAVX512_IFMA #-}
bAVX512_IFMA = False

{-# INLINE sAVX512_IFMA #-}
sAVX512_IFMA = SFalse

{-# INLINE bAVX512_VBMI #-}
bAVX512_VBMI = False

{-# INLINE sAVX512_VBMI #-}
sAVX512_VBMI = SFalse

{-# INLINE bAVX512_VBMI2 #-}
bAVX512_VBMI2 = False

{-# INLINE sAVX512_VBMI2 #-}
sAVX512_VBMI2 = SFalse

{-# INLINE bAVX512_VNNI #-}
bAVX512_VNNI = False

{-# INLINE sAVX512_VNNI #-}
sAVX512_VNNI = SFalse

{-# INLINE bAVX512_VP2INTERSECT #-}
bAVX512_VP2INTERSECT = False

{-# INLINE sAVX512_VP2INTERSECT #-}
sAVX512_VP2INTERSECT = SFalse

{-# INLINE bAVX512_VPOPCNTDQ #-}
bAVX512_VPOPCNTDQ = False

{-# INLINE sAVX512_VPOPCNTDQ #-}
sAVX512_VPOPCNTDQ = SFalse

{-# INLINE bAVX512BW #-}
bAVX512BW = False

{-# INLINE sAVX512BW #-}
sAVX512BW = SFalse

{-# INLINE bAVX512CD #-}
bAVX512CD = False

{-# INLINE sAVX512CD #-}
sAVX512CD = SFalse

{-# INLINE bAVX512DQ #-}
bAVX512DQ = False

{-# INLINE sAVX512DQ #-}
sAVX512DQ = SFalse

{-# INLINE bAVX512F #-}
bAVX512F = False

{-# INLINE sAVX512F #-}
sAVX512F = SFalse

{-# INLINE bAVX512VL #-}
bAVX512VL = False

{-# INLINE sAVX512VL #-}
sAVX512VL = SFalse

{-# INLINE bBMI1 #-}
bBMI1 = False

{-# INLINE sBMI1 #-}
sBMI1 = SFalse

{-# INLINE bBMI2 #-}
bBMI2 = False

{-# INLINE sBMI2 #-}
sBMI2 = SFalse

{-# INLINE bF16C #-}
bF16C = False

{-# INLINE sF16C #-}
sF16C = SFalse

{-# INLINE bFMA #-}
bFMA = False

{-# INLINE sFMA #-}
sFMA = SFalse

{-# INLINE bGFNI #-}
bGFNI = False

{-# INLINE sGFNI #-}
sGFNI = SFalse

{-# INLINE bPCLMULQDQ #-}
bPCLMULQDQ = False

{-# INLINE sPCLMULQDQ #-}
sPCLMULQDQ = SFalse

{-# INLINE bPOPCNT #-}
bPOPCNT = False

{-# INLINE sPOPCNT #-}
sPOPCNT = SFalse

{-# INLINE bRDRAND #-}
bRDRAND = False

{-# INLINE sRDRAND #-}
sRDRAND = SFalse

{-# INLINE bSHA #-}
bSHA = False

{-# INLINE sSHA #-}
sSHA = SFalse

{-# INLINE bSSE3 #-}
bSSE3 = False

{-# INLINE sSSE3 #-}
sSSE3 = SFalse

{-# INLINE bSSE4_1 #-}
bSSE4_1 = False

{-# INLINE sSSE4_1 #-}
sSSE4_1 = SFalse

{-# INLINE bSSE4_2 #-}
bSSE4_2 = False

{-# INLINE sSSE4_2 #-}
sSSE4_2 = SFalse

{-# INLINE bSSSE3 #-}
bSSSE3 = False

{-# INLINE sSSSE3 #-}
sSSSE3 = SFalse

{-# INLINE bVAES #-}
bVAES = False

{-# INLINE sVAES #-}
sVAES = SFalse

{-# INLINE bVPCLMULQDQ #-}
bVPCLMULQDQ = False

{-# INLINE sVPCLMULQDQ #-}
sVPCLMULQDQ = SFalse

#endif
