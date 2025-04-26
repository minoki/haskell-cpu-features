{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{- |
Description: Arm features as type-level booleans

This module provides the type-level interface to detect CPU features.
You can mark your function with @\<FEATURE NAME\> ~ True =>@ to indicate that
it requires a specific CPU feature.
You can detect the availability and get the constraint @\<FEATURE NAME\> ~ True@
by pattern-matching on the variable @s\<FEATURE NAME\>@.

Example:

> -- This function requires FEAT_PMULL
> someFunction :: FEAT_PMULL ~ True => ...
>
> case sFEAT_PMULL of
>   STrue -> {- In this branch, FEAT_PMULL is True -} someFunction
>   SFalse -> {- In this branch, FEAT_PMULL is False -} error "FEAT_PMULL not available"
-}
module System.CPUFeatures.Arm.TypeBool
  (FEAT_AES, sFEAT_AES
  ,FEAT_AFP, sFEAT_AFP
  ,FEAT_BF16, sFEAT_BF16
  ,FEAT_BTI, sFEAT_BTI
  ,FEAT_CSV2, sFEAT_CSV2
  ,FEAT_CSV3, sFEAT_CSV3
  ,FEAT_DIT, sFEAT_DIT
  ,FEAT_DotProd, sFEAT_DotProd
  ,FEAT_DPB, sFEAT_DPB
  ,FEAT_DPB2, sFEAT_DPB2
  ,FEAT_ECV, sFEAT_ECV
  ,FEAT_FCMA, sFEAT_FCMA
  ,FEAT_FHM, sFEAT_FHM
  ,FEAT_FlagM, sFEAT_FlagM
  ,FEAT_FlagM2, sFEAT_FlagM2
  ,FEAT_FP16, sFEAT_FP16
  ,FEAT_FPAC, sFEAT_FPAC
  ,FEAT_FRINTTS, sFEAT_FRINTTS
  ,FEAT_I8MM, sFEAT_I8MM
  ,FEAT_JSCVT, sFEAT_JSCVT
  ,FEAT_LRCPC, sFEAT_LRCPC
  ,FEAT_LRCPC2, sFEAT_LRCPC2
  ,FEAT_LSE, sFEAT_LSE
  ,FEAT_LSE2, sFEAT_LSE2
  ,FEAT_PAuth, sFEAT_PAuth
  ,FEAT_PAuth2, sFEAT_PAuth2
  ,FEAT_PMULL, sFEAT_PMULL
  ,FEAT_RDM, sFEAT_RDM
  ,FEAT_RPRES, sFEAT_RPRES
  ,FEAT_SB, sFEAT_SB
  ,FEAT_SHA1, sFEAT_SHA1
  ,FEAT_SHA256, sFEAT_SHA256
  ,FEAT_SHA3, sFEAT_SHA3
  ,FEAT_SHA512, sFEAT_SHA512
  ,FEAT_SME, sFEAT_SME
  ,FEAT_SME_F64F64, sFEAT_SME_F64F64
  ,FEAT_SME_I16I64, sFEAT_SME_I16I64
  ,FEAT_SME2, sFEAT_SME2
  ,FEAT_SPECRES, sFEAT_SPECRES
  ,FEAT_SSBS, sFEAT_SSBS
  ,FEAT_SVE, sFEAT_SVE
  ,FEAT_SVE2, sFEAT_SVE2
  ,FEAT_WFxT, sFEAT_WFxT
  ,SBool(..)
  ) where
import System.CPUFeatures.Arm.Bool
import System.CPUFeatures.Util

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
