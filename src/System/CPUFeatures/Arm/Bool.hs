{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module System.CPUFeatures.Arm.Bool
  (bFEAT_AES
  ,bFEAT_AFP
  ,bFEAT_BF16
  ,bFEAT_BTI
  ,bFEAT_CSV2
  ,bFEAT_CSV3
  ,bFEAT_DIT
  ,bFEAT_DotProd
  ,bFEAT_DPB
  ,bFEAT_DPB2
  ,bFEAT_ECV
  ,bFEAT_FCMA
  ,bFEAT_FHM
  ,bFEAT_FlagM
  ,bFEAT_FlagM2
  ,bFEAT_FP16
  ,bFEAT_FPAC
  ,bFEAT_FRINTTS
  ,bFEAT_I8MM
  ,bFEAT_JSCVT
  ,bFEAT_LRCPC
  ,bFEAT_LRCPC2
  ,bFEAT_LSE
  ,bFEAT_LSE2
  ,bFEAT_PAuth
  ,bFEAT_PAuth2
  ,bFEAT_PMULL
  ,bFEAT_RDM
  ,bFEAT_RPRES
  ,bFEAT_SB
  ,bFEAT_SHA1
  ,bFEAT_SHA256
  ,bFEAT_SHA3
  ,bFEAT_SHA512
  ,bFEAT_SME
  ,bFEAT_SME_F64F64
  ,bFEAT_SME_I16I64
  ,bFEAT_SME2
  ,bFEAT_SPECRES
  ,bFEAT_SSBS
  ,bFEAT_SVE
  ,bFEAT_SVE2
  ,bFEAT_WFxT
  ) where
#if defined(aarch64_HOST_ARCH) && defined(darwin_HOST_OS)
import GHC.Exts (Addr#)
#endif
#if defined(aarch64_HOST_ARCH) && defined(linux_HOST_OS)
import Hwcap
import Data.Bits
#endif

bFEAT_AES :: Bool
bFEAT_AFP :: Bool
bFEAT_BF16 :: Bool
bFEAT_BTI :: Bool
bFEAT_CSV2 :: Bool
bFEAT_CSV3 :: Bool
bFEAT_DIT :: Bool
bFEAT_DotProd :: Bool
bFEAT_DPB :: Bool
bFEAT_DPB2 :: Bool
bFEAT_ECV :: Bool
bFEAT_FCMA :: Bool
bFEAT_FHM :: Bool
bFEAT_FlagM :: Bool
bFEAT_FlagM2 :: Bool
bFEAT_FP16 :: Bool
bFEAT_FPAC :: Bool
bFEAT_FRINTTS :: Bool
bFEAT_I8MM :: Bool
bFEAT_JSCVT :: Bool
bFEAT_LRCPC :: Bool
bFEAT_LRCPC2 :: Bool
bFEAT_LSE :: Bool
bFEAT_LSE2 :: Bool
bFEAT_PAuth :: Bool
bFEAT_PAuth2 :: Bool
bFEAT_PMULL :: Bool
bFEAT_RDM :: Bool
bFEAT_RPRES :: Bool
bFEAT_SB :: Bool
bFEAT_SHA1 :: Bool
bFEAT_SHA256 :: Bool
bFEAT_SHA3 :: Bool
bFEAT_SHA512 :: Bool
bFEAT_SME :: Bool
bFEAT_SME_F64F64 :: Bool
bFEAT_SME_I16I64 :: Bool
bFEAT_SME2 :: Bool
bFEAT_SPECRES :: Bool
bFEAT_SSBS :: Bool
bFEAT_SVE :: Bool
bFEAT_SVE2 :: Bool
bFEAT_WFxT :: Bool

#if defined(aarch64_HOST_ARCH) && (defined(darwin_HOST_OS) || defined(linux_HOST_OS))

#if defined(darwin_HOST_OS)

foreign import ccall unsafe hs_cpu_features_sysctl :: Addr# -> Bool

{-# NOINLINE bFEAT_AES #-}
bFEAT_AES = hs_cpu_features_sysctl "hw.optional.arm.FEAT_AES"#

{-# NOINLINE bFEAT_AFP #-}
bFEAT_AFP = hs_cpu_features_sysctl "hw.optional.arm.FEAT_AFP"#

{-# NOINLINE bFEAT_BF16 #-}
bFEAT_BF16 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_BF16"#

{-# NOINLINE bFEAT_BTI #-}
bFEAT_BTI = hs_cpu_features_sysctl "hw.optional.arm.FEAT_BTI"#

{-# NOINLINE bFEAT_CSV2 #-}
bFEAT_CSV2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_CSV2"#

{-# NOINLINE bFEAT_CSV3 #-}
bFEAT_CSV3 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_CSV3"#

{-# NOINLINE bFEAT_DIT #-}
bFEAT_DIT = hs_cpu_features_sysctl "hw.optional.arm.FEAT_DIT"#

{-# NOINLINE bFEAT_DotProd #-}
bFEAT_DotProd = hs_cpu_features_sysctl "hw.optional.arm.FEAT_DotProd"#

{-# NOINLINE bFEAT_DPB #-}
bFEAT_DPB = hs_cpu_features_sysctl "hw.optional.arm.FEAT_DPB"#

{-# NOINLINE bFEAT_DPB2 #-}
bFEAT_DPB2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_DPB2"#

{-# NOINLINE bFEAT_ECV #-}
bFEAT_ECV = hs_cpu_features_sysctl "hw.optional.arm.FEAT_ECV"#

{-# NOINLINE bFEAT_FCMA #-}
bFEAT_FCMA = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FCMA"#

{-# NOINLINE bFEAT_FHM #-}
bFEAT_FHM = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FHM"#

{-# NOINLINE bFEAT_FlagM #-}
bFEAT_FlagM = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FlagM"#

{-# NOINLINE bFEAT_FlagM2 #-}
bFEAT_FlagM2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FlagM2"#

{-# NOINLINE bFEAT_FP16 #-}
bFEAT_FP16 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FP16"#

{-# NOINLINE bFEAT_FPAC #-}
bFEAT_FPAC = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FPAC"#

{-# NOINLINE bFEAT_FRINTTS #-}
bFEAT_FRINTTS = hs_cpu_features_sysctl "hw.optional.arm.FEAT_FRINTTS"#

{-# NOINLINE bFEAT_I8MM #-}
bFEAT_I8MM = hs_cpu_features_sysctl "hw.optional.arm.FEAT_I8MM"#

{-# NOINLINE bFEAT_JSCVT #-}
bFEAT_JSCVT = hs_cpu_features_sysctl "hw.optional.arm.FEAT_JSCVT"#

{-# NOINLINE bFEAT_LRCPC #-}
bFEAT_LRCPC = hs_cpu_features_sysctl "hw.optional.arm.FEAT_LRCPC"#

{-# NOINLINE bFEAT_LRCPC2 #-}
bFEAT_LRCPC2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_LRCPC2"#

{-# NOINLINE bFEAT_LSE #-}
bFEAT_LSE = hs_cpu_features_sysctl "hw.optional.arm.FEAT_LSE"#

{-# NOINLINE bFEAT_LSE2 #-}
bFEAT_LSE2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_LSE2"#

{-# NOINLINE bFEAT_PAuth #-}
bFEAT_PAuth = hs_cpu_features_sysctl "hw.optional.arm.FEAT_PAuth"#

{-# NOINLINE bFEAT_PAuth2 #-}
bFEAT_PAuth2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_PAuth2"#

{-# NOINLINE bFEAT_PMULL #-}
bFEAT_PMULL = hs_cpu_features_sysctl "hw.optional.arm.FEAT_PMULL"#

{-# NOINLINE bFEAT_RDM #-}
bFEAT_RDM = hs_cpu_features_sysctl "hw.optional.arm.FEAT_RDM"#

{-# NOINLINE bFEAT_RPRES #-}
bFEAT_RPRES = hs_cpu_features_sysctl "hw.optional.arm.FEAT_RPRES"#

{-# NOINLINE bFEAT_SB #-}
bFEAT_SB = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SB"#

{-# NOINLINE bFEAT_SHA1 #-}
bFEAT_SHA1 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SHA1"#

{-# NOINLINE bFEAT_SHA256 #-}
bFEAT_SHA256 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SHA256"#

{-# NOINLINE bFEAT_SHA3 #-}
bFEAT_SHA3 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SHA3"#

{-# NOINLINE bFEAT_SHA512 #-}
bFEAT_SHA512 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SHA512"#

{-# NOINLINE bFEAT_SME #-}
bFEAT_SME = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SME"#

{-# NOINLINE bFEAT_SME_F64F64 #-}
bFEAT_SME_F64F64 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SME_F64F64"#

{-# NOINLINE bFEAT_SME_I16I64 #-}
bFEAT_SME_I16I64 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SME_I16I64"#

{-# NOINLINE bFEAT_SME2 #-}
bFEAT_SME2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SME2"#

{-# NOINLINE bFEAT_SPECRES #-}
bFEAT_SPECRES = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SPECRES"#

{-# NOINLINE bFEAT_SSBS #-}
bFEAT_SSBS = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SSBS"#

{-# NOINLINE bFEAT_SVE #-}
bFEAT_SVE = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SVE"#

{-# NOINLINE bFEAT_SVE2 #-}
bFEAT_SVE2 = hs_cpu_features_sysctl "hw.optional.arm.FEAT_SVE2"#

{-# NOINLINE bFEAT_WFxT #-}
bFEAT_WFxT = hs_cpu_features_sysctl "hw.optional.arm.FEAT_WFxT"#

#elif defined(linux_HOST_OS)

bFEAT_AES = hwcap .&. hwcap_AES /= 0
bFEAT_AFP = hwcap2 .&. hwcap2_AFP /= 0
bFEAT_BF16 = hwcap2 .&. hwcap2_BF16 /= 0
bFEAT_BTI = hwcap2 .&. hwcap2_BTI /= 0
bFEAT_CSV2 = False
bFEAT_CSV3 = False
bFEAT_DIT = hwcap .&. hwcap_DIT /= 0
bFEAT_DotProd = hwcap .&. hwcap_ASIMDDP /= 0
bFEAT_DPB = hwcap .&. hwcap_DCPOP /= 0
bFEAT_DPB2 = hwcap2 .&. hwcap2_DCPODP /= 0
bFEAT_ECV = False
bFEAT_FCMA = hwcap .&. hwcap_FCMA /= 0
bFEAT_FHM = hwcap .&. hwcap_ASIMDFHM /= 0
bFEAT_FlagM = hwcap .&. hwcap_FLAGM /= 0
bFEAT_FlagM2 = hwcap2 .&. hwcap2_FLAGM2 /= 0
bFEAT_FP16 = hwcap .&. hwcap_FPHP /= 0 -- hwcap_ASIMDHP?
bFEAT_FPAC = False
bFEAT_FRINTTS = hwcap2 .&. hwcap2_FRINT /= 0
bFEAT_I8MM = hwcap2 .&. hwcap2_I8MM /= 0
bFEAT_JSCVT = hwcap .&. hwcap_JSCVT /= 0
bFEAT_LRCPC = hwcap .&. hwcap_LRCPC /= 0
bFEAT_LRCPC2 = hwcap .&. hwcap_ILRCPC /= 0
bFEAT_LSE = hwcap .&. hwcap_ATOMICS /= 0
bFEAT_LSE2 = hwcap .&. hwcap_USCAT /= 0
bFEAT_PAuth = hwcap .&. hwcap_PACA /= 0
bFEAT_PAuth2 = False
bFEAT_PMULL = hwcap .&. hwcap_PMULL /= 0
bFEAT_RDM = hwcap .&. hwcap_ASIMDRDM /= 0
bFEAT_RPRES = hwcap2 .&. hwcap2_RPRES /= 0
bFEAT_SB = hwcap .&. hwcap_SB /= 0
bFEAT_SHA1 = hwcap .&. hwcap_SHA1 /= 0
bFEAT_SHA256 = hwcap .&. hwcap_SHA2 /= 0
bFEAT_SHA3 = hwcap .&. hwcap_SHA3 /= 0
bFEAT_SHA512 = hwcap .&. hwcap_SHA512 /= 0
bFEAT_SME = hwcap2 .&. hwcap2_SME /= 0
bFEAT_SME_F64F64 = hwcap2 .&. hwcap2_SME_F64F64 /= 0
bFEAT_SME_I16I64 = hwcap2 .&. hwcap2_SME_I16I64 /= 0
bFEAT_SME2 = hwcap2 .&. hwcap2_SME2 /= 0
bFEAT_SPECRES = False
bFEAT_SSBS = hwcap .&. hwcap_SSBS /= 0 -- FEAT_SSB2?
bFEAT_SVE = hwcap .&. hwcap_SVE /= 0
bFEAT_SVE2 = hwcap2 .&. hwcap2_SVE2 /= 0
bFEAT_WFxT = hwcap2 .&. hwcap2_WFXT /= 0

#else
#error bug
#endif

#else

{-# INLINE bFEAT_AES #-}
bFEAT_AES = False

{-# INLINE bFEAT_AFP #-}
bFEAT_AFP = False

{-# INLINE bFEAT_BF16 #-}
bFEAT_BF16 = False

{-# INLINE bFEAT_BTI #-}
bFEAT_BTI = False

{-# INLINE bFEAT_CSV2 #-}
bFEAT_CSV2 = False

{-# INLINE bFEAT_CSV3 #-}
bFEAT_CSV3 = False

{-# INLINE bFEAT_DIT #-}
bFEAT_DIT = False

{-# INLINE bFEAT_DotProd #-}
bFEAT_DotProd = False

{-# INLINE bFEAT_DPB #-}
bFEAT_DPB = False

{-# INLINE bFEAT_DPB2 #-}
bFEAT_DPB2 = False

{-# INLINE bFEAT_ECV #-}
bFEAT_ECV = False

{-# INLINE bFEAT_FCMA #-}
bFEAT_FCMA = False

{-# INLINE bFEAT_FHM #-}
bFEAT_FHM = False

{-# INLINE bFEAT_FlagM #-}
bFEAT_FlagM = False

{-# INLINE bFEAT_FlagM2 #-}
bFEAT_FlagM2 = False

{-# INLINE bFEAT_FP16 #-}
bFEAT_FP16 = False

{-# INLINE bFEAT_FPAC #-}
bFEAT_FPAC = False

{-# INLINE bFEAT_FRINTTS #-}
bFEAT_FRINTTS = False

{-# INLINE bFEAT_I8MM #-}
bFEAT_I8MM = False

{-# INLINE bFEAT_JSCVT #-}
bFEAT_JSCVT = False

{-# INLINE bFEAT_LRCPC #-}
bFEAT_LRCPC = False

{-# INLINE bFEAT_LRCPC2 #-}
bFEAT_LRCPC2 = False

{-# INLINE bFEAT_LSE #-}
bFEAT_LSE = False

{-# INLINE bFEAT_LSE2 #-}
bFEAT_LSE2 = False

{-# INLINE bFEAT_PAuth #-}
bFEAT_PAuth = False

{-# INLINE bFEAT_PAuth2 #-}
bFEAT_PAuth2 = False

{-# INLINE bFEAT_PMULL #-}
bFEAT_PMULL = False

{-# INLINE bFEAT_RDM #-}
bFEAT_RDM = False

{-# INLINE bFEAT_RPRES #-}
bFEAT_RPRES = False

{-# INLINE bFEAT_SB #-}
bFEAT_SB = False

{-# INLINE bFEAT_SHA1 #-}
bFEAT_SHA1 = False

{-# INLINE bFEAT_SHA256 #-}
bFEAT_SHA256 = False

{-# INLINE bFEAT_SHA3 #-}
bFEAT_SHA3 = False

{-# INLINE bFEAT_SHA512 #-}
bFEAT_SHA512 = False

{-# INLINE bFEAT_SME #-}
bFEAT_SME = False

{-# INLINE bFEAT_SME_F64F64 #-}
bFEAT_SME_F64F64 = False

{-# INLINE bFEAT_SME_I16I64 #-}
bFEAT_SME_I16I64 = False

{-# INLINE bFEAT_SME2 #-}
bFEAT_SME2 = False

{-# INLINE bFEAT_SPECRES #-}
bFEAT_SPECRES = False

{-# INLINE bFEAT_SSBS #-}
bFEAT_SSBS = False

{-# INLINE bFEAT_SVE #-}
bFEAT_SVE = False

{-# INLINE bFEAT_SVE2 #-}
bFEAT_SVE2 = False

{-# INLINE bFEAT_WFxT #-}
bFEAT_WFxT = False

#endif
