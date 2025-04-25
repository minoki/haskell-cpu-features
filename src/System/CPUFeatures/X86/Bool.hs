{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module System.CPUFeatures.X86.Bool
  (bAESNI
  ,bAMX_BF16
  ,bAMX_FP16
  ,bAMX_INT8
  ,bAMX_TILE
  ,bAVX
  ,bAVX_VNNI
  ,bAVX10_1
  ,bAVX10_2
  ,bAVX2
  ,bAVX512_BF16
  ,bAVX512_BITALG
  ,bAVX512_FP16
  ,bAVX512_IFMA
  ,bAVX512_VBMI
  ,bAVX512_VBMI2
  ,bAVX512_VNNI
  ,bAVX512_VPOPCNTDQ
  ,bAVX512BW
  ,bAVX512CD
  ,bAVX512DQ
  ,bAVX512F
  ,bAVX512VL
  ,bBMI1
  ,bBMI2
  ,bF16C
  ,bFMA
  ,bGFNI
  ,bPCLMULQDQ
  ,bPOPCNT
  ,bRDRAND
  ,bSHA
  ,bSSE3
  ,bSSE4_1
  ,bSSE4_2
  ,bSSSE3
  ,bVAES
  ,bVPCLMULQDQ
  ,mAVX10
  ) where
#if defined(x86_64_HOST_ARCH)
import System.CPUFeatures.X86.Cpuid
import Data.Bits
-- import Data.Maybe (isJust)
#if defined(darwin_HOST_OS)
import GHC.Exts (Addr#)
#endif
#endif

bAESNI :: Bool
bAMX_BF16 :: Bool
bAMX_FP16 :: Bool
bAMX_INT8 :: Bool
bAMX_TILE :: Bool
bAVX :: Bool
bAVX_VNNI :: Bool
bAVX10_1 :: Bool
bAVX10_2 :: Bool
bAVX2 :: Bool
bAVX512_BF16 :: Bool
bAVX512_BITALG :: Bool
bAVX512_FP16 :: Bool
bAVX512_IFMA :: Bool
bAVX512_VBMI :: Bool
bAVX512_VBMI2 :: Bool
bAVX512_VNNI :: Bool
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

mAVX10 :: Maybe Int

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

{-# NOINLINE cpuid_24_0 #-}
cpuid_24_0 :: CpuidResult
cpuid_24_0 = cpuid 0x24 0

-- May be used by future AVX10
-- {-# NOINLINE cpuid_24_1 #-}
-- cpuid_24_1 :: CpuidResult
-- cpuid_24_1 = cpuid 0x24 1

#if defined(darwin_HOST_OS)
foreign import ccall unsafe hs_cpu_features_sysctl :: Addr# -> Bool
#endif

{-# NOINLINE mAVX10 #-}
mAVX10 | testBit (edx cpuid_07_1) 19
       , testBit (ecx cpuid_01) 27 -- OSXSAVE
       , (xgetbv 0 .&. 0xe6) == 0xe6 -- opmask, upper ZMM[0-15], ZMM[16-31], XMM, YMM
       , testBit (ebx cpuid_24_0) 17 -- AVX10/256
       = let !version = fromIntegral (ebx cpuid_24_0 .&. 0xff)
         in Just version
       | otherwise = Nothing

bAESNI = testBit (ecx cpuid_01) 25
bAMX_BF16 = testBit (edx cpuid_07_0) 22
bAMX_FP16 = testBit (eax cpuid_07_1) 21
bAMX_INT8 = testBit (edx cpuid_07_0) 25
bAMX_TILE = testBit (edx cpuid_07_0) 24
{-# NOINLINE bAVX #-}
bAVX = (ecx cpuid_01 .&. (bit 27 .|. bit 28)) == bit 27 .|. bit 28 && (xgetbv 0 .&. 6) == 6 -- bit 27: OSXSAVE, bit 28: AVX
bAVX_VNNI = testBit (eax cpuid_07_1) 4
bAVX10_1 = mAVX10 >= Just 1
bAVX10_2 = mAVX10 >= Just 2
-- bAVX10_VL256 = isJust mAVX10 -- mAVX10 checks for VL256
-- bAVX10_VL512 = isJust mAVX10 && testBit (ebx cpuid_24_0) 18
bAVX2 = bAVX && testBit (ebx cpuid_07_0) 5
bAVX512_BF16 = bAVX512F && testBit (eax cpuid_07_1) 5
bAVX512_BITALG = bAVX512F && testBit (ecx cpuid_07_0) 12
bAVX512_FP16 = bAVX512F && testBit (edx cpuid_07_0) 23
bAVX512_IFMA = bAVX512F && testBit (ebx cpuid_07_0) 21
bAVX512_VBMI = bAVX512F && testBit (ecx cpuid_07_0) 1
bAVX512_VBMI2 = bAVX512F && testBit (ecx cpuid_07_0) 6
bAVX512_VNNI = bAVX512F && testBit (ecx cpuid_07_0) 11
-- bAVX512_VP2INTERSECT = bAVX512F && testBit (edx cpuid_07_0) 8
bAVX512_VPOPCNTDQ = bAVX512F && testBit (ecx cpuid_07_0) 14
bAVX512BW = bAVX512F && testBit (ebx cpuid_07_0) 30
bAVX512CD = bAVX512F && testBit (ebx cpuid_07_0) 28
bAVX512DQ = bAVX512F && testBit (ebx cpuid_07_0) 17
{-# NOINLINE bAVX512F #-}
#if defined(darwin_HOST_OS)
bAVX512F = hs_cpu_features_sysctl "hw.optional.avx512f"# -- AVX-512 support on macOS is on-demand, that is, XCR0 is cleared by default.
#else
bAVX512F = testBit (ecx cpuid_01) 27 && (xgetbv 0 .&. 0xe6) == 0xe6 && testBit (ebx cpuid_07_0) 16 -- CPUID.1:ECX[bit 27]: OSXSAVE
#endif
bAVX512VL = testBit (ebx cpuid_07_0) 31
bBMI1 = testBit (ebx cpuid_07_0) 3
bBMI2 = testBit (ebx cpuid_07_0) 8
bF16C = bAVX && testBit (ecx cpuid_01) 29
bFMA = bAVX && testBit (ecx cpuid_01) 12
bGFNI = testBit (ecx cpuid_07_0) 8
bPCLMULQDQ = testBit (ecx cpuid_01) 1
bPOPCNT = testBit (ecx cpuid_01) 23
bRDRAND = testBit (ecx cpuid_01) 30
bSHA = testBit (ebx cpuid_07_0) 29
bSSE3 = testBit (ecx cpuid_01) 0
bSSE4_1 = testBit (ecx cpuid_01) 19
bSSE4_2 = testBit (ecx cpuid_01) 20
bSSSE3 = testBit (ecx cpuid_01) 9
bVAES = testBit (ecx cpuid_07_0) 9
bVPCLMULQDQ = testBit (ecx cpuid_07_0) 10

#else

{-# INLINE bAESNI #-}
bAESNI = False

{-# INLINE bAMX_BF16 #-}
bAMX_BF16 = False

{-# INLINE bAMX_FP16 #-}
bAMX_FP16 = False

{-# INLINE bAMX_INT8 #-}
bAMX_INT8 = False

{-# INLINE bAMX_TILE #-}
bAMX_TILE = False

{-# INLINE bAVX #-}
bAVX = False

{-# INLINE bAVX_VNNI #-}
bAVX_VNNI = False

{-# INLINE bAVX10_1 #-}
bAVX10_1 = False

{-# INLINE bAVX10_2 #-}
bAVX10_2 = False

{-# INLINE bAVX2 #-}
bAVX2 = False

{-# INLINE bAVX512_BF16 #-}
bAVX512_BF16 = False

{-# INLINE bAVX512_BITALG #-}
bAVX512_BITALG = False

{-# INLINE bAVX512_FP16 #-}
bAVX512_FP16 = False

{-# INLINE bAVX512_IFMA #-}
bAVX512_IFMA = False

{-# INLINE bAVX512_VBMI #-}
bAVX512_VBMI = False

{-# INLINE bAVX512_VBMI2 #-}
bAVX512_VBMI2 = False

{-# INLINE bAVX512_VNNI #-}
bAVX512_VNNI = False

{-# INLINE bAVX512_VPOPCNTDQ #-}
bAVX512_VPOPCNTDQ = False

{-# INLINE bAVX512BW #-}
bAVX512BW = False

{-# INLINE bAVX512CD #-}
bAVX512CD = False

{-# INLINE bAVX512DQ #-}
bAVX512DQ = False

{-# INLINE bAVX512F #-}
bAVX512F = False

{-# INLINE bAVX512VL #-}
bAVX512VL = False

{-# INLINE bBMI1 #-}
bBMI1 = False

{-# INLINE bBMI2 #-}
bBMI2 = False

{-# INLINE bF16C #-}
bF16C = False

{-# INLINE bFMA #-}
bFMA = False

{-# INLINE bGFNI #-}
bGFNI = False

{-# INLINE bPCLMULQDQ #-}
bPCLMULQDQ = False

{-# INLINE bPOPCNT #-}
bPOPCNT = False

{-# INLINE bRDRAND #-}
bRDRAND = False

{-# INLINE bSHA #-}
bSHA = False

{-# INLINE bSSE3 #-}
bSSE3 = False

{-# INLINE bSSE4_1 #-}
bSSE4_1 = False

{-# INLINE bSSE4_2 #-}
bSSE4_2 = False

{-# INLINE bSSSE3 #-}
bSSSE3 = False

{-# INLINE bVAES #-}
bVAES = False

{-# INLINE bVPCLMULQDQ #-}
bVPCLMULQDQ = False

{-# INLINE mAVX10 #-}
mAVX10 = Nothing

#endif
