module Main where

import System.CPUFeatures.X86 as X86
import System.CPUFeatures.Arm as Arm
import System.CPUFeatures.Arm.Intrinsics as ArmI

main :: IO ()
main = do
  putStrLn $ "X86.AESNI = " ++ show X86.bAESNI
  putStrLn $ "X86.AMX_BF16 = " ++ show X86.bAMX_BF16
  putStrLn $ "X86.AMX_INT8 = " ++ show X86.bAMX_INT8
  putStrLn $ "X86.AMX_TILE = " ++ show X86.bAMX_TILE
  putStrLn $ "X86.AVX = " ++ show X86.bAVX
  putStrLn $ "X86.AVX_VNNI = " ++ show X86.bAVX_VNNI
  putStrLn $ "X86.AVX2 = " ++ show X86.bAVX2
  putStrLn $ "X86.AVX512_BF16 = " ++ show X86.bAVX512_BF16
  putStrLn $ "X86.AVX512_BITALG = " ++ show X86.bAVX512_BITALG
  putStrLn $ "X86.AVX512_FP16 = " ++ show X86.bAVX512_FP16
  putStrLn $ "X86.AVX512_IFMA = " ++ show X86.bAVX512_IFMA
  putStrLn $ "X86.AVX512_VBMI = " ++ show X86.bAVX512_VBMI
  putStrLn $ "X86.AVX512_VBMI2 = " ++ show X86.bAVX512_VBMI2
  putStrLn $ "X86.AVX512_VNNI = " ++ show X86.bAVX512_VNNI
  putStrLn $ "X86.AVX512_VP2INTERSECT = " ++ show X86.bAVX512_VP2INTERSECT
  putStrLn $ "X86.AVX512_VPOPCNTDQ = " ++ show X86.bAVX512_VPOPCNTDQ
  putStrLn $ "X86.AVX512BW = " ++ show X86.bAVX512BW
  putStrLn $ "X86.AVX512CD = " ++ show X86.bAVX512CD
  putStrLn $ "X86.AVX512DQ = " ++ show X86.bAVX512DQ
  putStrLn $ "X86.AVX512F = " ++ show X86.bAVX512F
  putStrLn $ "X86.AVX512VL = " ++ show X86.bAVX512VL
  putStrLn $ "X86.BMI1 = " ++ show X86.bBMI1
  putStrLn $ "X86.BMI2 = " ++ show X86.bBMI2
  putStrLn $ "X86.F16C = " ++ show X86.bF16C
  putStrLn $ "X86.FMA = " ++ show X86.bFMA
  putStrLn $ "X86.GFNI = " ++ show X86.bGFNI
  putStrLn $ "X86.PCLMULQDQ = " ++ show X86.bPCLMULQDQ
  putStrLn $ "X86.POPCNT = " ++ show X86.bPOPCNT
  putStrLn $ "X86.RDRAND = " ++ show X86.bRDRAND
  putStrLn $ "X86.SHA = " ++ show X86.bSHA
  putStrLn $ "X86.SSE3 = " ++ show X86.bSSE3
  putStrLn $ "X86.SSE4_1 = " ++ show X86.bSSE4_1
  putStrLn $ "X86.SSE4_2 = " ++ show X86.bSSE4_2
  putStrLn $ "X86.SSSE3 = " ++ show X86.bSSSE3
  putStrLn $ "X86.VAES = " ++ show X86.bVAES
  putStrLn $ "X86.VPCLMULQDQ = " ++ show X86.bVPCLMULQDQ
  putStrLn $ "Arm.FEAT_AES = " ++ show Arm.bFEAT_AES
  putStrLn $ "Arm.FEAT_BF16 = " ++ show Arm.bFEAT_BF16
  putStrLn $ "Arm.FEAT_BTI = " ++ show Arm.bFEAT_BTI
  putStrLn $ "Arm.FEAT_CSV2 = " ++ show Arm.bFEAT_CSV2
  putStrLn $ "Arm.FEAT_CSV3 = " ++ show Arm.bFEAT_CSV3
  putStrLn $ "Arm.FEAT_DIT = " ++ show Arm.bFEAT_DIT
  putStrLn $ "Arm.FEAT_DotProd = " ++ show Arm.bFEAT_DotProd
  putStrLn $ "Arm.FEAT_DPB = " ++ show Arm.bFEAT_DPB
  putStrLn $ "Arm.FEAT_DPB2 = " ++ show Arm.bFEAT_DPB2
  putStrLn $ "Arm.FEAT_ECV = " ++ show Arm.bFEAT_ECV
  putStrLn $ "Arm.FEAT_FCMA = " ++ show Arm.bFEAT_FCMA
  putStrLn $ "Arm.FEAT_FHM = " ++ show Arm.bFEAT_FHM
  putStrLn $ "Arm.FEAT_FlagM = " ++ show Arm.bFEAT_FlagM
  putStrLn $ "Arm.FEAT_FlagM2 = " ++ show Arm.bFEAT_FlagM2
  putStrLn $ "Arm.FEAT_FP16 = " ++ show Arm.bFEAT_FP16
  putStrLn $ "Arm.FEAT_FPAC = " ++ show Arm.bFEAT_FPAC
  putStrLn $ "Arm.FEAT_FRINTTS = " ++ show Arm.bFEAT_FRINTTS
  putStrLn $ "Arm.FEAT_I8MM = " ++ show Arm.bFEAT_I8MM
  putStrLn $ "Arm.FEAT_JSCVT = " ++ show Arm.bFEAT_JSCVT
  putStrLn $ "Arm.FEAT_LRCPC = " ++ show Arm.bFEAT_LRCPC
  putStrLn $ "Arm.FEAT_LRCPC2 = " ++ show Arm.bFEAT_LRCPC2
  putStrLn $ "Arm.FEAT_LSE = " ++ show Arm.bFEAT_LSE
  putStrLn $ "Arm.FEAT_LSE2 = " ++ show Arm.bFEAT_LSE2
  putStrLn $ "Arm.FEAT_PAuth = " ++ show Arm.bFEAT_PAuth
  putStrLn $ "Arm.FEAT_PAuth2 = " ++ show Arm.bFEAT_PAuth2
  putStrLn $ "Arm.FEAT_PMULL = " ++ show Arm.bFEAT_PMULL
  putStrLn $ "Arm.FEAT_RDM = " ++ show Arm.bFEAT_RDM
  putStrLn $ "Arm.FEAT_SB = " ++ show Arm.bFEAT_SB
  putStrLn $ "Arm.FEAT_SHA1 = " ++ show Arm.bFEAT_SHA1
  putStrLn $ "Arm.FEAT_SHA256 = " ++ show Arm.bFEAT_SHA256
  putStrLn $ "Arm.FEAT_SHA3 = " ++ show Arm.bFEAT_SHA3
  putStrLn $ "Arm.FEAT_SHA512 = " ++ show Arm.bFEAT_SHA512
  putStrLn $ "Arm.FEAT_SPECRES = " ++ show Arm.bFEAT_SPECRES
  putStrLn $ "Arm.FEAT_SSBS = " ++ show Arm.bFEAT_SSBS
  putStrLn $ "Arm.FEAT_SVE = " ++ show Arm.bFEAT_SVE
  putStrLn $ "Arm.FEAT_SVE2 = " ++ show Arm.bFEAT_SVE2
  -- putStrLn $ "polynomial multiplication: " ++ show (ArmI.polymul 0xdeadbeef 0xcafecafe) -- compile error
  case Arm.sFEAT_PMULL of
    STrue -> putStrLn $ "polynomial multiplication: " ++ show (ArmI.polymul 0xdeadbeefdeadbeef 0xcafecafec0ffee12)
    SFalse -> putStrLn "polynomial multiplication not available"
