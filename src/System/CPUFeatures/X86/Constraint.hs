{- |
Description: x86 features as nullary constraints

This module provides the constraint interface to detect CPU features.
You can mark your function with @Has\<FEATURE NAME\> =>@ to indicate that
it requires a specific CPU feature.
You can detect the availability and get the constraint @Has\<FEATURE NAME\>@
by pattern-matching on the variable @query\<FEATURE NAME\>@.

Example:

> -- This function requires AVX2
> someFunction :: HasAVX2 => ...
>
> case queryAVX2 of
>   Just Dict -> {- In this branch, HasAVX2 is available -} someFunction
>   Nothing -> {- In this branch, HasAVX2 is not available -} error "AVX2 not available"
-}
module System.CPUFeatures.X86.Constraint
  (HasAESNI, queryAESNI
  ,HasAMX_BF16, queryAMX_BF16
  ,HasAMX_FP16, queryAMX_FP16
  ,HasAMX_INT8, queryAMX_INT8
  ,HasAMX_TILE, queryAMX_TILE
  ,HasAVX, queryAVX
  ,HasAVX_VNNI, queryAVX_VNNI
  ,HasAVX10_1, queryAVX10_1
  ,HasAVX10_2, queryAVX10_2
  ,HasAVX2, queryAVX2
  ,HasAVX512_BF16, queryAVX512_BF16
  ,HasAVX512_BITALG, queryAVX512_BITALG
  ,HasAVX512_FP16, queryAVX512_FP16
  ,HasAVX512_IFMA, queryAVX512_IFMA
  ,HasAVX512_VBMI, queryAVX512_VBMI
  ,HasAVX512_VBMI2, queryAVX512_VBMI2
  ,HasAVX512_VNNI, queryAVX512_VNNI
  ,HasAVX512_VPOPCNTDQ, queryAVX512_VPOPCNTDQ
  ,HasAVX512BW, queryAVX512BW
  ,HasAVX512CD, queryAVX512CD
  ,HasAVX512DQ, queryAVX512DQ
  ,HasAVX512F, queryAVX512F
  ,HasAVX512VL, queryAVX512VL
  ,HasBMI1, queryBMI1
  ,HasBMI2, queryBMI2
  ,HasF16C, queryF16C
  ,HasFMA, queryFMA
  ,HasGFNI, queryGFNI
  ,HasPCLMULQDQ, queryPCLMULQDQ
  ,HasPOPCNT, queryPOPCNT
  ,HasRDRAND, queryRDRAND
  ,HasSHA, querySHA
  ,HasSSE3, querySSE3
  ,HasSSE4_1, querySSE4_1
  ,HasSSE4_2, querySSE4_2
  ,HasSSSE3, querySSSE3
  ,HasVAES, queryVAES
  ,HasVPCLMULQDQ, queryVPCLMULQDQ
  ,Dict(Dict)
  ) where
import System.CPUFeatures.X86.Constraint.Unsafe
