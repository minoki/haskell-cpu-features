{-# LANGUAGE CPP #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module System.CPUFeatures.Arm
  (FEAT_AES, bFEAT_AES, sFEAT_AES
  ,FEAT_AFP, bFEAT_AFP, sFEAT_AFP
  ,FEAT_BF16, bFEAT_BF16, sFEAT_BF16
  ,FEAT_BTI, bFEAT_BTI, sFEAT_BTI
  ,FEAT_CSV2, bFEAT_CSV2, sFEAT_CSV2
  ,FEAT_CSV3, bFEAT_CSV3, sFEAT_CSV3
  ,FEAT_DIT, bFEAT_DIT, sFEAT_DIT
  ,FEAT_DotProd, bFEAT_DotProd, sFEAT_DotProd
  ,FEAT_DPB, bFEAT_DPB, sFEAT_DPB
  ,FEAT_DPB2, bFEAT_DPB2, sFEAT_DPB2
  ,FEAT_ECV, bFEAT_ECV, sFEAT_ECV
  ,FEAT_FCMA, bFEAT_FCMA, sFEAT_FCMA
  ,FEAT_FHM, bFEAT_FHM, sFEAT_FHM
  ,FEAT_FlagM, bFEAT_FlagM, sFEAT_FlagM
  ,FEAT_FlagM2, bFEAT_FlagM2, sFEAT_FlagM2
  ,FEAT_FP16, bFEAT_FP16, sFEAT_FP16
  ,FEAT_FPAC, bFEAT_FPAC, sFEAT_FPAC
  ,FEAT_FRINTTS, bFEAT_FRINTTS, sFEAT_FRINTTS
  ,FEAT_I8MM, bFEAT_I8MM, sFEAT_I8MM
  ,FEAT_JSCVT, bFEAT_JSCVT, sFEAT_JSCVT
  ,FEAT_LRCPC, bFEAT_LRCPC, sFEAT_LRCPC
  ,FEAT_LRCPC2, bFEAT_LRCPC2, sFEAT_LRCPC2
  ,FEAT_LSE, bFEAT_LSE, sFEAT_LSE
  ,FEAT_LSE2, bFEAT_LSE2, sFEAT_LSE2
  ,FEAT_PAuth, bFEAT_PAuth, sFEAT_PAuth
  ,FEAT_PAuth2, bFEAT_PAuth2, sFEAT_PAuth2
  ,FEAT_PMULL, bFEAT_PMULL, sFEAT_PMULL
  ,FEAT_RDM, bFEAT_RDM, sFEAT_RDM
  ,FEAT_RPRES, bFEAT_RPRES, sFEAT_RPRES
  ,FEAT_SB, bFEAT_SB, sFEAT_SB
  ,FEAT_SHA1, bFEAT_SHA1, sFEAT_SHA1
  ,FEAT_SHA256, bFEAT_SHA256, sFEAT_SHA256
  ,FEAT_SHA3, bFEAT_SHA3, sFEAT_SHA3
  ,FEAT_SHA512, bFEAT_SHA512, sFEAT_SHA512
  ,FEAT_SME, bFEAT_SME, sFEAT_SME
  ,FEAT_SME_F64F64, bFEAT_SME_F64F64, sFEAT_SME_F64F64
  ,FEAT_SME_I16I64, bFEAT_SME_I16I64, sFEAT_SME_I16I64
  ,FEAT_SME2, bFEAT_SME2, sFEAT_SME2
  ,FEAT_SPECRES, bFEAT_SPECRES, sFEAT_SPECRES
  ,FEAT_SSBS, bFEAT_SSBS, sFEAT_SSBS
  ,FEAT_SVE, bFEAT_SVE, sFEAT_SVE
  ,FEAT_SVE2, bFEAT_SVE2, sFEAT_SVE2
  ,FEAT_WFxT, bFEAT_WFxT, sFEAT_WFxT
  ,SBool(..)
  ) where
import System.CPUFeatures.Util
#if defined(aarch64_HOST_ARCH) && defined(darwin_HOST_OS)
import GHC.Exts (Addr#)
#endif
#if defined(aarch64_HOST_ARCH) && defined(linux_HOST_OS)
import Hwcap
import Data.Bits
#endif

type family FEAT_AES :: Bool -- optional from Armv8.0
type family FEAT_AFP :: Bool
type family FEAT_BF16 :: Bool -- optional from Armv8.2, mandatory from Armv8.6
type family FEAT_BTI :: Bool -- optional from Armv8.4, mandatory from Armv8.5
type family FEAT_CSV2 :: Bool -- optional from Armv8.0, mandatory from Armv8.5
type family FEAT_CSV3 :: Bool -- optional from Armv8.0, mandatory from Armv8.5
type family FEAT_DIT :: Bool -- optional from Armv8.3, mandatory from Armv8.4
type family FEAT_DotProd :: Bool -- optional from Armv8.1
type family FEAT_DPB :: Bool -- optional from Armv8.1, mandatory from Armv8.2
type family FEAT_DPB2 :: Bool -- optional from Armv8.1, mandatory from Armv8.5
type family FEAT_ECV :: Bool -- optional from Armv8.5, mandatory from Armv8.6
type family FEAT_FCMA :: Bool -- optional from Armv8.2
type family FEAT_FHM :: Bool -- optional from Armv8.1
type family FEAT_FlagM :: Bool -- optional from Armv8.1, mandatory from Armv8.4
type family FEAT_FlagM2 :: Bool -- optional from Armv8.4
type family FEAT_FP16 :: Bool -- optional from Armv8.2
type family FEAT_FPAC :: Bool -- optional from Armv8.2
type family FEAT_FRINTTS :: Bool -- optional from Armv8.4
type family FEAT_I8MM :: Bool -- optional from Armv8.1, mandatory from Armv8.6
type family FEAT_JSCVT :: Bool -- optional from Armv8.2
type family FEAT_LRCPC :: Bool -- optional from Armv8.2, mandatory from Armv8.3
type family FEAT_LRCPC2 :: Bool -- optional from Armv8.2, mandatory from Armv8.4
type family FEAT_LSE :: Bool -- optional from Armv8.0, mandatory from Armv8.1
type family FEAT_LSE2 :: Bool -- optional from Armv8.2, mandatory from Armv8.4
type family FEAT_PAuth :: Bool -- optional from Armv8.2, mandatory from Armv8.3
type family FEAT_PAuth2 :: Bool -- optional from Armv8.2, mandatory from Armv8.6
type family FEAT_PMULL :: Bool -- optional from Armv8.0
type family FEAT_RDM :: Bool -- optional from Armv8.0
type family FEAT_RPRES :: Bool -- optional from Armv8.0
type family FEAT_SB :: Bool -- optional from Armv8.0, mandatory from Armv8.5
type family FEAT_SHA1 :: Bool -- optional from Armv8.0
type family FEAT_SHA256 :: Bool -- optional from Armv8.0
type family FEAT_SHA3 :: Bool -- optional from Armv8.1
type family FEAT_SHA512 :: Bool -- optional from Armv8.1
type family FEAT_SME :: Bool
type family FEAT_SME_F64F64 :: Bool
type family FEAT_SME_I16I64 :: Bool
type family FEAT_SME2 :: Bool
type family FEAT_SPECRES :: Bool -- optional from Armv8.0, mandatory from Armv8.5
type family FEAT_SSBS :: Bool -- optional from Armv8.0
type family FEAT_SVE :: Bool -- optional from Armv8.2
type family FEAT_SVE2 :: Bool -- optional from Armv9.0
type family FEAT_WFxT :: Bool

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

sFEAT_AES :: SBool FEAT_AES
sFEAT_AFP :: SBool FEAT_AFP
sFEAT_BF16 :: SBool FEAT_BF16
sFEAT_BTI :: SBool FEAT_BTI
sFEAT_CSV2 :: SBool FEAT_CSV2
sFEAT_CSV3 :: SBool FEAT_CSV3
sFEAT_DIT :: SBool FEAT_DIT
sFEAT_DotProd :: SBool FEAT_DotProd
sFEAT_DPB :: SBool FEAT_DPB
sFEAT_DPB2 :: SBool FEAT_DPB2
sFEAT_ECV :: SBool FEAT_ECV
sFEAT_FCMA :: SBool FEAT_FCMA
sFEAT_FHM :: SBool FEAT_FHM
sFEAT_FlagM :: SBool FEAT_FlagM
sFEAT_FlagM2 :: SBool FEAT_FlagM2
sFEAT_FP16 :: SBool FEAT_FP16
sFEAT_FPAC :: SBool FEAT_FPAC
sFEAT_FRINTTS :: SBool FEAT_FRINTTS
sFEAT_I8MM :: SBool FEAT_I8MM
sFEAT_JSCVT :: SBool FEAT_JSCVT
sFEAT_LRCPC :: SBool FEAT_LRCPC
sFEAT_LRCPC2 :: SBool FEAT_LRCPC2
sFEAT_LSE :: SBool FEAT_LSE
sFEAT_LSE2 :: SBool FEAT_LSE2
sFEAT_PAuth :: SBool FEAT_PAuth
sFEAT_PAuth2 :: SBool FEAT_PAuth2
sFEAT_PMULL :: SBool FEAT_PMULL
sFEAT_RDM :: SBool FEAT_RDM
sFEAT_RPRES :: SBool FEAT_RPRES
sFEAT_SB :: SBool FEAT_SB
sFEAT_SHA1 :: SBool FEAT_SHA1
sFEAT_SHA256 :: SBool FEAT_SHA256
sFEAT_SHA3 :: SBool FEAT_SHA3
sFEAT_SHA512 :: SBool FEAT_SHA512
sFEAT_SME :: SBool FEAT_SME
sFEAT_SME_F64F64 :: SBool FEAT_SME_F64F64
sFEAT_SME_I16I64 :: SBool FEAT_SME_I16I64
sFEAT_SME2 :: SBool FEAT_SME2
sFEAT_SPECRES :: SBool FEAT_SPECRES
sFEAT_SSBS :: SBool FEAT_SSBS
sFEAT_SVE :: SBool FEAT_SVE
sFEAT_SVE2 :: SBool FEAT_SVE2
sFEAT_WFxT :: SBool FEAT_WFxT

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

sFEAT_AES = unsafeBoolToSBool bFEAT_AES
sFEAT_AFP = unsafeBoolToSBool bFEAT_AFP
sFEAT_BF16 = unsafeBoolToSBool bFEAT_BF16
sFEAT_BTI = unsafeBoolToSBool bFEAT_BTI
sFEAT_CSV2 = unsafeBoolToSBool bFEAT_CSV2
sFEAT_CSV3 = unsafeBoolToSBool bFEAT_CSV3
sFEAT_DIT = unsafeBoolToSBool bFEAT_DIT
sFEAT_DotProd = unsafeBoolToSBool bFEAT_DotProd
sFEAT_DPB = unsafeBoolToSBool bFEAT_DPB
sFEAT_DPB2 = unsafeBoolToSBool bFEAT_DPB2
sFEAT_ECV = unsafeBoolToSBool bFEAT_ECV
sFEAT_FCMA = unsafeBoolToSBool bFEAT_FCMA
sFEAT_FHM = unsafeBoolToSBool bFEAT_FHM
sFEAT_FlagM = unsafeBoolToSBool bFEAT_FlagM
sFEAT_FlagM2 = unsafeBoolToSBool bFEAT_FlagM2
sFEAT_FP16 = unsafeBoolToSBool bFEAT_FP16
sFEAT_FPAC = unsafeBoolToSBool bFEAT_FPAC
sFEAT_FRINTTS = unsafeBoolToSBool bFEAT_FRINTTS
sFEAT_I8MM = unsafeBoolToSBool bFEAT_I8MM
sFEAT_JSCVT = unsafeBoolToSBool bFEAT_JSCVT
sFEAT_LRCPC = unsafeBoolToSBool bFEAT_LRCPC
sFEAT_LRCPC2 = unsafeBoolToSBool bFEAT_LRCPC2
sFEAT_LSE = unsafeBoolToSBool bFEAT_LSE
sFEAT_LSE2 = unsafeBoolToSBool bFEAT_LSE2
sFEAT_PAuth = unsafeBoolToSBool bFEAT_PAuth
sFEAT_PAuth2 = unsafeBoolToSBool bFEAT_PAuth2
sFEAT_PMULL = unsafeBoolToSBool bFEAT_PMULL
sFEAT_RDM = unsafeBoolToSBool bFEAT_RDM
sFEAT_RPRES = unsafeBoolToSBool bFEAT_RPRES
sFEAT_SB = unsafeBoolToSBool bFEAT_SB
sFEAT_SHA1 = unsafeBoolToSBool bFEAT_SHA1
sFEAT_SHA256 = unsafeBoolToSBool bFEAT_SHA256
sFEAT_SHA3 = unsafeBoolToSBool bFEAT_SHA3
sFEAT_SHA512 = unsafeBoolToSBool bFEAT_SHA512
sFEAT_SME = unsafeBoolToSBool bFEAT_SME
sFEAT_SME_F64F64 = unsafeBoolToSBool bFEAT_SME_F64F64
sFEAT_SME_I16I64 = unsafeBoolToSBool bFEAT_SME_I16I64
sFEAT_SME2 = unsafeBoolToSBool bFEAT_SME2
sFEAT_SPECRES = unsafeBoolToSBool bFEAT_SPECRES
sFEAT_SSBS = unsafeBoolToSBool bFEAT_SSBS
sFEAT_SVE = unsafeBoolToSBool bFEAT_SVE
sFEAT_SVE2 = unsafeBoolToSBool bFEAT_SVE2
sFEAT_WFxT = unsafeBoolToSBool bFEAT_WFxT
