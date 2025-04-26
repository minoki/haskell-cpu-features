{- |
Description: Arm features as nullary constraints

This module provides the constraint interface to detect CPU features.
You can mark your function with @Has\<FEATURE NAME\> =>@ to indicate that
it requires a specific CPU feature.
You can detect the availability and get the constraint @Has\<FEATURE NAME\>@
by pattern-matching on the variable @query\<FEATURE NAME\>@.

Example:

> -- This function requires FEAT_PMULL
> someFunction :: HasFEAT_PMULL => ...
>
> case queryFEAT_PMULL of
>   Just Dict -> {- In this branch, HasFEAT_PMULL is available -} someFunction
>   Nothing -> {- In this branch, HasFEAT_PMULL is not available -} error "FEAT_PMULL not available"
-}
module System.CPUFeatures.Arm.Constraint
  (HasFEAT_AES, queryFEAT_AES
  ,HasFEAT_AFP, queryFEAT_AFP
  ,HasFEAT_BF16, queryFEAT_BF16
  ,HasFEAT_BTI, queryFEAT_BTI
  ,HasFEAT_CSV2, queryFEAT_CSV2
  ,HasFEAT_CSV3, queryFEAT_CSV3
  ,HasFEAT_DIT, queryFEAT_DIT
  ,HasFEAT_DotProd, queryFEAT_DotProd
  ,HasFEAT_DPB, queryFEAT_DPB
  ,HasFEAT_DPB2, queryFEAT_DPB2
  ,HasFEAT_ECV, queryFEAT_ECV
  ,HasFEAT_FCMA, queryFEAT_FCMA
  ,HasFEAT_FHM, queryFEAT_FHM
  ,HasFEAT_FlagM, queryFEAT_FlagM
  ,HasFEAT_FlagM2, queryFEAT_FlagM2
  ,HasFEAT_FP16, queryFEAT_FP16
  ,HasFEAT_FPAC, queryFEAT_FPAC
  ,HasFEAT_FRINTTS, queryFEAT_FRINTTS
  ,HasFEAT_I8MM, queryFEAT_I8MM
  ,HasFEAT_JSCVT, queryFEAT_JSCVT
  ,HasFEAT_LRCPC, queryFEAT_LRCPC
  ,HasFEAT_LRCPC2, queryFEAT_LRCPC2
  ,HasFEAT_LSE, queryFEAT_LSE
  ,HasFEAT_LSE2, queryFEAT_LSE2
  ,HasFEAT_PAuth, queryFEAT_PAuth
  ,HasFEAT_PAuth2, queryFEAT_PAuth2
  ,HasFEAT_PMULL, queryFEAT_PMULL
  ,HasFEAT_RDM, queryFEAT_RDM
  ,HasFEAT_RPRES, queryFEAT_RPRES
  ,HasFEAT_SB, queryFEAT_SB
  ,HasFEAT_SHA1, queryFEAT_SHA1
  ,HasFEAT_SHA256, queryFEAT_SHA256
  ,HasFEAT_SHA3, queryFEAT_SHA3
  ,HasFEAT_SHA512, queryFEAT_SHA512
  ,HasFEAT_SME, queryFEAT_SME
  ,HasFEAT_SME_F64F64, queryFEAT_SME_F64F64
  ,HasFEAT_SME_I16I64, queryFEAT_SME_I16I64
  ,HasFEAT_SME2, queryFEAT_SME2
  ,HasFEAT_SPECRES, queryFEAT_SPECRES
  ,HasFEAT_SSBS, queryFEAT_SSBS
  ,HasFEAT_SVE, queryFEAT_SVE
  ,HasFEAT_SVE2, queryFEAT_SVE2
  ,HasFEAT_WFxT, queryFEAT_WFxT
  ,Dict(Dict)
  ) where
import System.CPUFeatures.Arm.Constraint.Unsafe
