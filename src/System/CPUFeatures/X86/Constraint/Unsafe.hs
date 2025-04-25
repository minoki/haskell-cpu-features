{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
module System.CPUFeatures.X86.Constraint.Unsafe
  ( module System.CPUFeatures.X86.Constraint.Unsafe
  , Dict (Dict)
  ) where
import Data.Type.Equality ((:~:)(Refl))
import System.CPUFeatures.Util
import System.CPUFeatures.X86.TypeBool
import Unsafe.Coerce (unsafeCoerce)

class AESNI ~ True => HasAESNI
instance AESNI ~ True => HasAESNI

class BMI1 ~ True => HasBMI1
instance BMI1 ~ True => HasBMI1

class BMI2 ~ True => HasBMI2
instance BMI2 ~ True => HasBMI2

class GFNI ~ True => HasGFNI
instance GFNI ~ True => HasGFNI

class PCLMULQDQ ~ True => HasPCLMULQDQ
instance PCLMULQDQ ~ True => HasPCLMULQDQ

class POPCNT ~ True => HasPOPCNT
instance POPCNT ~ True => HasPOPCNT

class RDRAND ~ True => HasRDRAND
instance RDRAND ~ True => HasRDRAND

class SHA ~ True => HasSHA
instance SHA ~ True => HasSHA

class SSE3 ~ True => HasSSE3
instance SSE3 ~ True => HasSSE3

class (SSSE3 ~ True, HasSSE3) => HasSSSE3
instance (SSSE3 ~ True, HasSSE3) => HasSSSE3

class (SSE4_1 ~ True, HasSSSE3) => HasSSE4_1
instance (SSE4_1 ~ True, HasSSSE3) => HasSSE4_1

class (SSE4_2 ~ True, HasSSE4_1) => HasSSE4_2
instance (SSE4_2 ~ True, HasSSE4_1) => HasSSE4_2

class (AVX ~ True, HasSSE4_2) => HasAVX
instance (AVX ~ True, HasSSE4_2) => HasAVX

class (AVX2 ~ True, HasAVX) => HasAVX2
instance (AVX2 ~ True, HasAVX) => HasAVX2

class (F16C ~ True, HasAVX) => HasF16C
instance (F16C ~ True, HasAVX) => HasF16C

class (FMA ~ True, HasAVX) => HasFMA
instance (FMA ~ True, HasAVX) => HasFMA

class (AVX_VNNI ~ True, HasAVX2) => HasAVX_VNNI
instance (AVX_VNNI ~ True, HasAVX2) => HasAVX_VNNI

class (AVX512F ~ True, HasAVX2, HasF16C, HasFMA) => HasAVX512F
instance (AVX512F ~ True, HasAVX2, HasF16C, HasFMA) => HasAVX512F

class (AVX512VL ~ True, HasAVX512F) => HasAVX512VL
instance (AVX512VL ~ True, HasAVX512F) => HasAVX512VL

class (AVX512BW ~ True, HasAVX512F) => HasAVX512BW
instance (AVX512BW ~ True, HasAVX512F) => HasAVX512BW

class (AVX512DQ ~ True, HasAVX512F) => HasAVX512DQ
instance (AVX512DQ ~ True, HasAVX512F) => HasAVX512DQ

class (AVX512CD ~ True, HasAVX512F) => HasAVX512CD
instance (AVX512CD ~ True, HasAVX512F) => HasAVX512CD

class (AVX512_BF16 ~ True, HasAVX512BW) => HasAVX512_BF16
instance (AVX512_BF16 ~ True, HasAVX512BW) => HasAVX512_BF16

class (AVX512_BITALG ~ True, HasAVX512BW) => HasAVX512_BITALG
instance (AVX512_BITALG ~ True, HasAVX512BW) => HasAVX512_BITALG

class (AVX512_FP16 ~ True, HasAVX512BW) => HasAVX512_FP16
instance (AVX512_FP16 ~ True, HasAVX512BW) => HasAVX512_FP16

class (AVX512_IFMA ~ True, HasAVX512F) => HasAVX512_IFMA
instance (AVX512_IFMA ~ True, HasAVX512F) => HasAVX512_IFMA

class (AVX512_VBMI ~ True, HasAVX512BW) => HasAVX512_VBMI
instance (AVX512_VBMI ~ True, HasAVX512BW) => HasAVX512_VBMI

class (AVX512_VBMI2 ~ True, HasAVX512BW) => HasAVX512_VBMI2
instance (AVX512_VBMI2 ~ True, HasAVX512BW) => HasAVX512_VBMI2

class (AVX512_VNNI ~ True, HasAVX512F) => HasAVX512_VNNI
instance (AVX512_VNNI ~ True, HasAVX512F) => HasAVX512_VNNI

class (AVX512_VPOPCNTDQ ~ True, HasAVX512F) => HasAVX512_VPOPCNTDQ
instance (AVX512_VPOPCNTDQ ~ True, HasAVX512F) => HasAVX512_VPOPCNTDQ

class (AVX10_1 ~ True, HasAVX2, HasF16C, HasFMA) => HasAVX10_1
instance (AVX10_1 ~ True, HasAVX2, HasF16C, HasFMA) => HasAVX10_1

class (AVX10_2 ~ True, HasAVX10_1) => HasAVX10_2
instance (AVX10_2 ~ True, HasAVX10_1) => HasAVX10_2

class (VAES ~ True, HasAVX2, HasAESNI) => HasVAES
instance (VAES ~ True, HasAVX2, HasAESNI) => HasVAES

class (VPCLMULQDQ ~ True, HasAVX, HasPCLMULQDQ) => HasVPCLMULQDQ
instance (VPCLMULQDQ ~ True, HasAVX, HasPCLMULQDQ) => HasVPCLMULQDQ

class AMX_TILE ~ True => HasAMX_TILE
instance AMX_TILE ~ True => HasAMX_TILE

class (AMX_BF16 ~ True, HasAMX_TILE) => HasAMX_BF16
instance (AMX_BF16 ~ True, HasAMX_TILE) => HasAMX_BF16

class (AMX_FP16 ~ True, HasAMX_TILE) => HasAMX_FP16
instance (AMX_FP16 ~ True, HasAMX_TILE) => HasAMX_FP16

class (AMX_INT8 ~ True, HasAMX_TILE) => HasAMX_INT8
instance (AMX_INT8 ~ True, HasAMX_TILE) => HasAMX_INT8

unsafeAssumeAESNI :: (HasAESNI => a) -> a
unsafeAssumeAESNI k = case unsafeCoerce Refl :: AESNI :~: True of Refl -> k

queryAESNI :: Maybe (Dict HasAESNI)
queryAESNI = case sAESNI of STrue -> unsafeAssumeAESNI (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAESNI #-}

unsafeAssumeBMI1 :: (HasBMI1 => a) -> a
unsafeAssumeBMI1 k = case unsafeCoerce Refl :: BMI1 :~: True of Refl -> k

queryBMI1 :: Maybe (Dict HasBMI1)
queryBMI1 = case sBMI1 of STrue -> unsafeAssumeBMI1 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryBMI1 #-}

unsafeAssumeBMI2 :: (HasBMI2 => a) -> a
unsafeAssumeBMI2 k = case unsafeCoerce Refl :: BMI2 :~: True of Refl -> k

queryBMI2 :: Maybe (Dict HasBMI2)
queryBMI2 = case sBMI2 of STrue -> unsafeAssumeBMI2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryBMI2 #-}

unsafeAssumeGFNI :: (HasGFNI => a) -> a
unsafeAssumeGFNI k = case unsafeCoerce Refl :: GFNI :~: True of Refl -> k

queryGFNI :: Maybe (Dict HasGFNI)
queryGFNI = case sGFNI of STrue -> unsafeAssumeGFNI (Just Dict); SFalse -> Nothing
{-# NOINLINE queryGFNI #-}

unsafeAssumePCLMULQDQ :: (HasPCLMULQDQ => a) -> a
unsafeAssumePCLMULQDQ k = case unsafeCoerce Refl :: PCLMULQDQ :~: True of Refl -> k

queryPCLMULQDQ :: Maybe (Dict HasPCLMULQDQ)
queryPCLMULQDQ = case sPCLMULQDQ of STrue -> unsafeAssumePCLMULQDQ (Just Dict); SFalse -> Nothing
{-# NOINLINE queryPCLMULQDQ #-}

unsafeAssumePOPCNT :: (HasPOPCNT => a) -> a
unsafeAssumePOPCNT k = case unsafeCoerce Refl :: POPCNT :~: True of Refl -> k

queryPOPCNT :: Maybe (Dict HasPOPCNT)
queryPOPCNT = case sPOPCNT of STrue -> unsafeAssumePOPCNT (Just Dict); SFalse -> Nothing
{-# NOINLINE queryPOPCNT #-}

unsafeAssumeRDRAND :: (HasRDRAND => a) -> a
unsafeAssumeRDRAND k = case unsafeCoerce Refl :: RDRAND :~: True of Refl -> k

queryRDRAND :: Maybe (Dict HasRDRAND)
queryRDRAND = case sRDRAND of STrue -> unsafeAssumeRDRAND (Just Dict); SFalse -> Nothing
{-# NOINLINE queryRDRAND #-}

unsafeAssumeSHA :: (HasSHA => a) -> a
unsafeAssumeSHA k = case unsafeCoerce Refl :: SHA :~: True of Refl -> k

querySHA :: Maybe (Dict HasSHA)
querySHA = case sSHA of STrue -> unsafeAssumeSHA (Just Dict); SFalse -> Nothing
{-# NOINLINE querySHA #-}

unsafeAssumeSSE3 :: (HasSSE3 => a) -> a
unsafeAssumeSSE3 k = case unsafeCoerce Refl :: SSE3 :~: True of Refl -> k

querySSE3 :: Maybe (Dict HasSSE3)
querySSE3 = case sSSE3 of STrue -> unsafeAssumeSSE3 (Just Dict); SFalse -> Nothing
{-# NOINLINE querySSE3 #-}

unsafeAssumeSSSE3 :: (HasSSSE3 => a) -> a
unsafeAssumeSSSE3 k = case unsafeCoerce Refl :: SSSE3 :~: True of Refl -> unsafeAssumeSSE3 k

querySSSE3 :: Maybe (Dict HasSSSE3)
querySSSE3 = case sSSSE3 of STrue -> unsafeAssumeSSSE3 (Just Dict); SFalse -> Nothing
{-# NOINLINE querySSSE3 #-}

unsafeAssumeSSE4_1 :: (HasSSE4_1 => a) -> a
unsafeAssumeSSE4_1 k = case unsafeCoerce Refl :: SSE4_1 :~: True of Refl -> unsafeAssumeSSSE3 k

querySSE4_1 :: Maybe (Dict HasSSE4_1)
querySSE4_1 = case sSSE4_1 of STrue -> unsafeAssumeSSE4_1 (Just Dict); SFalse -> Nothing
{-# NOINLINE querySSE4_1 #-}

unsafeAssumeSSE4_2 :: (HasSSE4_2 => a) -> a
unsafeAssumeSSE4_2 k = case unsafeCoerce Refl :: SSE4_2 :~: True of Refl -> unsafeAssumeSSE4_1 k

querySSE4_2 :: Maybe (Dict HasSSE4_2)
querySSE4_2 = case sSSE4_2 of STrue -> unsafeAssumeSSE4_2 (Just Dict); SFalse -> Nothing
{-# NOINLINE querySSE4_2 #-}

unsafeAssumeAVX :: (HasAVX => a) -> a
unsafeAssumeAVX k = case unsafeCoerce Refl :: AVX :~: True of Refl -> unsafeAssumeSSE4_2 k

queryAVX :: Maybe (Dict HasAVX)
queryAVX = case sAVX of STrue -> unsafeAssumeAVX (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX #-}

unsafeAssumeAVX2 :: (HasAVX2 => a) -> a
unsafeAssumeAVX2 k = case unsafeCoerce Refl :: AVX2 :~: True of Refl -> unsafeAssumeAVX k

queryAVX2 :: Maybe (Dict HasAVX2)
queryAVX2 = case sAVX2 of STrue -> unsafeAssumeAVX2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX2 #-}

unsafeAssumeF16C :: (HasF16C => a) -> a
unsafeAssumeF16C k = case unsafeCoerce Refl :: F16C :~: True of Refl -> unsafeAssumeAVX k

queryF16C :: Maybe (Dict HasF16C)
queryF16C = case sF16C of STrue -> unsafeAssumeF16C (Just Dict); SFalse -> Nothing
{-# NOINLINE queryF16C #-}

unsafeAssumeFMA :: (HasFMA => a) -> a
unsafeAssumeFMA k = case unsafeCoerce Refl :: FMA :~: True of Refl -> unsafeAssumeAVX k

queryFMA :: Maybe (Dict HasFMA)
queryFMA = case sFMA of STrue -> unsafeAssumeFMA (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFMA #-}

unsafeAssumeAVX_VNNI :: (HasAVX_VNNI => a) -> a
unsafeAssumeAVX_VNNI k = case unsafeCoerce Refl :: AVX_VNNI :~: True of Refl -> unsafeAssumeAVX2 k

queryAVX_VNNI :: Maybe (Dict HasAVX_VNNI)
queryAVX_VNNI = case sAVX_VNNI of STrue -> unsafeAssumeAVX_VNNI (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX_VNNI #-}

unsafeAssumeAVX512F :: (HasAVX512F => a) -> a
unsafeAssumeAVX512F k = case unsafeCoerce Refl :: AVX512F :~: True of Refl -> unsafeAssumeFMA (unsafeAssumeF16C (unsafeAssumeAVX2 k))

queryAVX512F :: Maybe (Dict HasAVX512F)
queryAVX512F = case sAVX512F of STrue -> unsafeAssumeAVX512F (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512F #-}

unsafeAssumeAVX512VL :: (HasAVX512VL => a) -> a
unsafeAssumeAVX512VL k = case unsafeCoerce Refl :: AVX512VL :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512VL :: Maybe (Dict HasAVX512VL)
queryAVX512VL = case sAVX512VL of STrue -> unsafeAssumeAVX512VL (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512VL #-}

unsafeAssumeAVX512BW :: (HasAVX512BW => a) -> a
unsafeAssumeAVX512BW k = case unsafeCoerce Refl :: AVX512BW :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512BW :: Maybe (Dict HasAVX512BW)
queryAVX512BW = case sAVX512BW of STrue -> unsafeAssumeAVX512BW (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512BW #-}

unsafeAssumeAVX512DQ :: (HasAVX512DQ => a) -> a
unsafeAssumeAVX512DQ k = case unsafeCoerce Refl :: AVX512DQ :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512DQ :: Maybe (Dict HasAVX512DQ)
queryAVX512DQ = case sAVX512DQ of STrue -> unsafeAssumeAVX512DQ (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512DQ #-}

unsafeAssumeAVX512CD :: (HasAVX512CD => a) -> a
unsafeAssumeAVX512CD k = case unsafeCoerce Refl :: AVX512CD :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512CD :: Maybe (Dict HasAVX512CD)
queryAVX512CD = case sAVX512CD of STrue -> unsafeAssumeAVX512CD (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512CD #-}

unsafeAssumeAVX512_BF16 :: (HasAVX512_BF16 => a) -> a
unsafeAssumeAVX512_BF16 k = case unsafeCoerce Refl :: AVX512_BF16 :~: True of Refl -> unsafeAssumeAVX512BW k

queryAVX512_BF16 :: Maybe (Dict HasAVX512_BF16)
queryAVX512_BF16 = case sAVX512_BF16 of STrue -> unsafeAssumeAVX512_BF16 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_BF16 #-}

unsafeAssumeAVX512_BITALG :: (HasAVX512_BITALG => a) -> a
unsafeAssumeAVX512_BITALG k = case unsafeCoerce Refl :: AVX512_BITALG :~: True of Refl -> unsafeAssumeAVX512BW k

queryAVX512_BITALG :: Maybe (Dict HasAVX512_BITALG)
queryAVX512_BITALG = case sAVX512_BITALG of STrue -> unsafeAssumeAVX512_BITALG (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_BITALG #-}

unsafeAssumeAVX512_FP16 :: (HasAVX512_FP16 => a) -> a
unsafeAssumeAVX512_FP16 k = case unsafeCoerce Refl :: AVX512_FP16 :~: True of Refl -> unsafeAssumeAVX512BW k

queryAVX512_FP16 :: Maybe (Dict HasAVX512_FP16)
queryAVX512_FP16 = case sAVX512_FP16 of STrue -> unsafeAssumeAVX512_FP16 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_FP16 #-}

unsafeAssumeAVX512_IFMA :: (HasAVX512_IFMA => a) -> a
unsafeAssumeAVX512_IFMA k = case unsafeCoerce Refl :: AVX512_IFMA :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512_IFMA :: Maybe (Dict HasAVX512_IFMA)
queryAVX512_IFMA = case sAVX512_IFMA of STrue -> unsafeAssumeAVX512_IFMA (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_IFMA #-}

unsafeAssumeAVX512_VBMI :: (HasAVX512_VBMI => a) -> a
unsafeAssumeAVX512_VBMI k = case unsafeCoerce Refl :: AVX512_VBMI :~: True of Refl -> unsafeAssumeAVX512BW k

queryAVX512_VBMI :: Maybe (Dict HasAVX512_VBMI)
queryAVX512_VBMI = case sAVX512_VBMI of STrue -> unsafeAssumeAVX512_VBMI (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_VBMI #-}

unsafeAssumeAVX512_VBMI2 :: (HasAVX512_VBMI2 => a) -> a
unsafeAssumeAVX512_VBMI2 k = case unsafeCoerce Refl :: AVX512_VBMI2 :~: True of Refl -> unsafeAssumeAVX512BW k

queryAVX512_VBMI2 :: Maybe (Dict HasAVX512_VBMI2)
queryAVX512_VBMI2 = case sAVX512_VBMI2 of STrue -> unsafeAssumeAVX512_VBMI2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_VBMI2 #-}

unsafeAssumeAVX512_VNNI :: (HasAVX512_VNNI => a) -> a
unsafeAssumeAVX512_VNNI k = case unsafeCoerce Refl :: AVX512_VNNI :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512_VNNI :: Maybe (Dict HasAVX512_VNNI)
queryAVX512_VNNI = case sAVX512_VNNI of STrue -> unsafeAssumeAVX512_VNNI (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_VNNI #-}

unsafeAssumeAVX512_VPOPCNTDQ :: (HasAVX512_VPOPCNTDQ => a) -> a
unsafeAssumeAVX512_VPOPCNTDQ k = case unsafeCoerce Refl :: AVX512_VPOPCNTDQ :~: True of Refl -> unsafeAssumeAVX512F k

queryAVX512_VPOPCNTDQ :: Maybe (Dict HasAVX512_VPOPCNTDQ)
queryAVX512_VPOPCNTDQ = case sAVX512_VPOPCNTDQ of STrue -> unsafeAssumeAVX512_VPOPCNTDQ (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX512_VPOPCNTDQ #-}

unsafeAssumeAVX10_1 :: (HasAVX10_1 => a) -> a
unsafeAssumeAVX10_1 k = case unsafeCoerce Refl :: AVX10_1 :~: True of Refl -> unsafeAssumeFMA (unsafeAssumeF16C (unsafeAssumeAVX2 k))

queryAVX10_1 :: Maybe (Dict HasAVX10_1)
queryAVX10_1 = case sAVX10_1 of STrue -> unsafeAssumeAVX10_1 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX10_1 #-}

unsafeAssumeAVX10_2 :: (HasAVX10_2 => a) -> a
unsafeAssumeAVX10_2 k = case unsafeCoerce Refl :: AVX10_2 :~: True of Refl -> unsafeAssumeAVX10_1 k

queryAVX10_2 :: Maybe (Dict HasAVX10_2)
queryAVX10_2 = case sAVX10_2 of STrue -> unsafeAssumeAVX10_2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAVX10_2 #-}

unsafeAssumeVAES :: (HasVAES => a) -> a
unsafeAssumeVAES k = case unsafeCoerce Refl :: VAES :~: True of Refl -> unsafeAssumeAESNI (unsafeAssumeAVX2 k)

queryVAES :: Maybe (Dict HasVAES)
queryVAES = case sVAES of STrue -> unsafeAssumeVAES (Just Dict); SFalse -> Nothing
{-# NOINLINE queryVAES #-}

unsafeAssumeVPCLMULQDQ :: (HasVPCLMULQDQ => a) -> a
unsafeAssumeVPCLMULQDQ k = case unsafeCoerce Refl :: VPCLMULQDQ :~: True of Refl -> unsafeAssumePCLMULQDQ (unsafeAssumeAVX k)

queryVPCLMULQDQ :: Maybe (Dict HasVPCLMULQDQ)
queryVPCLMULQDQ = case sVPCLMULQDQ of STrue -> unsafeAssumeVPCLMULQDQ (Just Dict); SFalse -> Nothing
{-# NOINLINE queryVPCLMULQDQ #-}

unsafeAssumeAMX_TILE :: (HasAMX_TILE => a) -> a
unsafeAssumeAMX_TILE k = case unsafeCoerce Refl :: AMX_TILE :~: True of Refl -> k

queryAMX_TILE :: Maybe (Dict HasAMX_TILE)
queryAMX_TILE = case sAMX_TILE of STrue -> unsafeAssumeAMX_TILE (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAMX_TILE #-}

unsafeAssumeAMX_BF16 :: (HasAMX_BF16 => a) -> a
unsafeAssumeAMX_BF16 k = case unsafeCoerce Refl :: AMX_BF16 :~: True of Refl -> unsafeAssumeAMX_TILE k

queryAMX_BF16 :: Maybe (Dict HasAMX_BF16)
queryAMX_BF16 = case sAMX_BF16 of STrue -> unsafeAssumeAMX_BF16 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAMX_BF16 #-}

unsafeAssumeAMX_FP16 :: (HasAMX_FP16 => a) -> a
unsafeAssumeAMX_FP16 k = case unsafeCoerce Refl :: AMX_FP16 :~: True of Refl -> unsafeAssumeAMX_TILE k

queryAMX_FP16 :: Maybe (Dict HasAMX_FP16)
queryAMX_FP16 = case sAMX_FP16 of STrue -> unsafeAssumeAMX_FP16 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAMX_FP16 #-}

unsafeAssumeAMX_INT8 :: (HasAMX_INT8 => a) -> a
unsafeAssumeAMX_INT8 k = case unsafeCoerce Refl :: AMX_INT8 :~: True of Refl -> unsafeAssumeAMX_TILE k

queryAMX_INT8 :: Maybe (Dict HasAMX_INT8)
queryAMX_INT8 = case sAMX_INT8 of STrue -> unsafeAssumeAMX_INT8 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryAMX_INT8 #-}
