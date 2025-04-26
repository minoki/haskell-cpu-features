{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
module System.CPUFeatures.Arm.Constraint.Unsafe
  ( module System.CPUFeatures.Arm.Constraint.Unsafe
  , Dict (Dict)
  ) where
import Data.Type.Equality ((:~:)(Refl))
import System.CPUFeatures.Util
import System.CPUFeatures.Arm.TypeBool
import Unsafe.Coerce (unsafeCoerce)

class FEAT_AES ~ True => HasFEAT_AES
instance FEAT_AES ~ True => HasFEAT_AES

class FEAT_AFP ~ True => HasFEAT_AFP
instance FEAT_AFP ~ True => HasFEAT_AFP

class FEAT_BF16 ~ True => HasFEAT_BF16
instance FEAT_BF16 ~ True => HasFEAT_BF16

class FEAT_BTI ~ True => HasFEAT_BTI
instance FEAT_BTI ~ True => HasFEAT_BTI

class FEAT_CSV2 ~ True => HasFEAT_CSV2
instance FEAT_CSV2 ~ True => HasFEAT_CSV2

class FEAT_CSV3 ~ True => HasFEAT_CSV3
instance FEAT_CSV3 ~ True => HasFEAT_CSV3

class FEAT_DIT ~ True => HasFEAT_DIT
instance FEAT_DIT ~ True => HasFEAT_DIT

class FEAT_DotProd ~ True => HasFEAT_DotProd
instance FEAT_DotProd ~ True => HasFEAT_DotProd

class FEAT_DPB ~ True => HasFEAT_DPB
instance FEAT_DPB ~ True => HasFEAT_DPB

class FEAT_DPB2 ~ True => HasFEAT_DPB2
instance FEAT_DPB2 ~ True => HasFEAT_DPB2

class FEAT_ECV ~ True => HasFEAT_ECV
instance FEAT_ECV ~ True => HasFEAT_ECV

class FEAT_FCMA ~ True => HasFEAT_FCMA
instance FEAT_FCMA ~ True => HasFEAT_FCMA

class FEAT_FHM ~ True => HasFEAT_FHM
instance FEAT_FHM ~ True => HasFEAT_FHM

class FEAT_FlagM ~ True => HasFEAT_FlagM
instance FEAT_FlagM ~ True => HasFEAT_FlagM

class FEAT_FlagM2 ~ True => HasFEAT_FlagM2
instance FEAT_FlagM2 ~ True => HasFEAT_FlagM2

class FEAT_FP16 ~ True => HasFEAT_FP16
instance FEAT_FP16 ~ True => HasFEAT_FP16

class FEAT_FPAC ~ True => HasFEAT_FPAC
instance FEAT_FPAC ~ True => HasFEAT_FPAC

class FEAT_FRINTTS ~ True => HasFEAT_FRINTTS
instance FEAT_FRINTTS ~ True => HasFEAT_FRINTTS

class FEAT_I8MM ~ True => HasFEAT_I8MM
instance FEAT_I8MM ~ True => HasFEAT_I8MM

class FEAT_JSCVT ~ True => HasFEAT_JSCVT
instance FEAT_JSCVT ~ True => HasFEAT_JSCVT

class FEAT_LRCPC ~ True => HasFEAT_LRCPC
instance FEAT_LRCPC ~ True => HasFEAT_LRCPC

class FEAT_LRCPC2 ~ True => HasFEAT_LRCPC2
instance FEAT_LRCPC2 ~ True => HasFEAT_LRCPC2

class FEAT_LSE ~ True => HasFEAT_LSE
instance FEAT_LSE ~ True => HasFEAT_LSE

class FEAT_LSE2 ~ True => HasFEAT_LSE2
instance FEAT_LSE2 ~ True => HasFEAT_LSE2

class FEAT_PAuth ~ True => HasFEAT_PAuth
instance FEAT_PAuth ~ True => HasFEAT_PAuth

class FEAT_PAuth2 ~ True => HasFEAT_PAuth2
instance FEAT_PAuth2 ~ True => HasFEAT_PAuth2

class FEAT_PMULL ~ True => HasFEAT_PMULL
instance FEAT_PMULL ~ True => HasFEAT_PMULL

class FEAT_RDM ~ True => HasFEAT_RDM
instance FEAT_RDM ~ True => HasFEAT_RDM

class FEAT_RPRES ~ True => HasFEAT_RPRES
instance FEAT_RPRES ~ True => HasFEAT_RPRES

class FEAT_SB ~ True => HasFEAT_SB
instance FEAT_SB ~ True => HasFEAT_SB

class FEAT_SHA1 ~ True => HasFEAT_SHA1
instance FEAT_SHA1 ~ True => HasFEAT_SHA1

class FEAT_SHA256 ~ True => HasFEAT_SHA256
instance FEAT_SHA256 ~ True => HasFEAT_SHA256

class FEAT_SHA3 ~ True => HasFEAT_SHA3
instance FEAT_SHA3 ~ True => HasFEAT_SHA3

class FEAT_SHA512 ~ True => HasFEAT_SHA512
instance FEAT_SHA512 ~ True => HasFEAT_SHA512

class FEAT_SME ~ True => HasFEAT_SME
instance FEAT_SME ~ True => HasFEAT_SME

class FEAT_SME_F64F64 ~ True => HasFEAT_SME_F64F64
instance FEAT_SME_F64F64 ~ True => HasFEAT_SME_F64F64

class FEAT_SME_I16I64 ~ True => HasFEAT_SME_I16I64
instance FEAT_SME_I16I64 ~ True => HasFEAT_SME_I16I64

class FEAT_SME2 ~ True => HasFEAT_SME2
instance FEAT_SME2 ~ True => HasFEAT_SME2

class FEAT_SPECRES ~ True => HasFEAT_SPECRES
instance FEAT_SPECRES ~ True => HasFEAT_SPECRES

class FEAT_SSBS ~ True => HasFEAT_SSBS
instance FEAT_SSBS ~ True => HasFEAT_SSBS

class FEAT_SVE ~ True => HasFEAT_SVE
instance FEAT_SVE ~ True => HasFEAT_SVE

class FEAT_SVE2 ~ True => HasFEAT_SVE2
instance FEAT_SVE2 ~ True => HasFEAT_SVE2

class FEAT_WFxT ~ True => HasFEAT_WFxT
instance FEAT_WFxT ~ True => HasFEAT_WFxT

unsafeAssumeFEAT_AES :: (HasFEAT_AES => a) -> a
unsafeAssumeFEAT_AES k = case unsafeCoerce Refl :: FEAT_AES :~: True of Refl -> k

queryFEAT_AES :: Maybe (Dict HasFEAT_AES)
queryFEAT_AES = case sFEAT_AES of STrue -> unsafeAssumeFEAT_AES (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_AES #-}

unsafeAssumeFEAT_AFP :: (HasFEAT_AFP => a) -> a
unsafeAssumeFEAT_AFP k = case unsafeCoerce Refl :: FEAT_AFP :~: True of Refl -> k

queryFEAT_AFP :: Maybe (Dict HasFEAT_AFP)
queryFEAT_AFP = case sFEAT_AFP of STrue -> unsafeAssumeFEAT_AFP (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_AFP #-}

unsafeAssumeFEAT_BF16 :: (HasFEAT_BF16 => a) -> a
unsafeAssumeFEAT_BF16 k = case unsafeCoerce Refl :: FEAT_BF16 :~: True of Refl -> k

queryFEAT_BF16 :: Maybe (Dict HasFEAT_BF16)
queryFEAT_BF16 = case sFEAT_BF16 of STrue -> unsafeAssumeFEAT_BF16 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_BF16 #-}

unsafeAssumeFEAT_BTI :: (HasFEAT_BTI => a) -> a
unsafeAssumeFEAT_BTI k = case unsafeCoerce Refl :: FEAT_BTI :~: True of Refl -> k

queryFEAT_BTI :: Maybe (Dict HasFEAT_BTI)
queryFEAT_BTI = case sFEAT_BTI of STrue -> unsafeAssumeFEAT_BTI (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_BTI #-}

unsafeAssumeFEAT_CSV2 :: (HasFEAT_CSV2 => a) -> a
unsafeAssumeFEAT_CSV2 k = case unsafeCoerce Refl :: FEAT_CSV2 :~: True of Refl -> k

queryFEAT_CSV2 :: Maybe (Dict HasFEAT_CSV2)
queryFEAT_CSV2 = case sFEAT_CSV2 of STrue -> unsafeAssumeFEAT_CSV2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_CSV2 #-}

unsafeAssumeFEAT_CSV3 :: (HasFEAT_CSV3 => a) -> a
unsafeAssumeFEAT_CSV3 k = case unsafeCoerce Refl :: FEAT_CSV3 :~: True of Refl -> k

queryFEAT_CSV3 :: Maybe (Dict HasFEAT_CSV3)
queryFEAT_CSV3 = case sFEAT_CSV3 of STrue -> unsafeAssumeFEAT_CSV3 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_CSV3 #-}

unsafeAssumeFEAT_DIT :: (HasFEAT_DIT => a) -> a
unsafeAssumeFEAT_DIT k = case unsafeCoerce Refl :: FEAT_DIT :~: True of Refl -> k

queryFEAT_DIT :: Maybe (Dict HasFEAT_DIT)
queryFEAT_DIT = case sFEAT_DIT of STrue -> unsafeAssumeFEAT_DIT (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_DIT #-}

unsafeAssumeFEAT_DotProd :: (HasFEAT_DotProd => a) -> a
unsafeAssumeFEAT_DotProd k = case unsafeCoerce Refl :: FEAT_DotProd :~: True of Refl -> k

queryFEAT_DotProd :: Maybe (Dict HasFEAT_DotProd)
queryFEAT_DotProd = case sFEAT_DotProd of STrue -> unsafeAssumeFEAT_DotProd (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_DotProd #-}

unsafeAssumeFEAT_DPB :: (HasFEAT_DPB => a) -> a
unsafeAssumeFEAT_DPB k = case unsafeCoerce Refl :: FEAT_DPB :~: True of Refl -> k

queryFEAT_DPB :: Maybe (Dict HasFEAT_DPB)
queryFEAT_DPB = case sFEAT_DPB of STrue -> unsafeAssumeFEAT_DPB (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_DPB #-}

unsafeAssumeFEAT_DPB2 :: (HasFEAT_DPB2 => a) -> a
unsafeAssumeFEAT_DPB2 k = case unsafeCoerce Refl :: FEAT_DPB2 :~: True of Refl -> k

queryFEAT_DPB2 :: Maybe (Dict HasFEAT_DPB2)
queryFEAT_DPB2 = case sFEAT_DPB2 of STrue -> unsafeAssumeFEAT_DPB2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_DPB2 #-}

unsafeAssumeFEAT_ECV :: (HasFEAT_ECV => a) -> a
unsafeAssumeFEAT_ECV k = case unsafeCoerce Refl :: FEAT_ECV :~: True of Refl -> k

queryFEAT_ECV :: Maybe (Dict HasFEAT_ECV)
queryFEAT_ECV = case sFEAT_ECV of STrue -> unsafeAssumeFEAT_ECV (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_ECV #-}

unsafeAssumeFEAT_FCMA :: (HasFEAT_FCMA => a) -> a
unsafeAssumeFEAT_FCMA k = case unsafeCoerce Refl :: FEAT_FCMA :~: True of Refl -> k

queryFEAT_FCMA :: Maybe (Dict HasFEAT_FCMA)
queryFEAT_FCMA = case sFEAT_FCMA of STrue -> unsafeAssumeFEAT_FCMA (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FCMA #-}

unsafeAssumeFEAT_FHM :: (HasFEAT_FHM => a) -> a
unsafeAssumeFEAT_FHM k = case unsafeCoerce Refl :: FEAT_FHM :~: True of Refl -> k

queryFEAT_FHM :: Maybe (Dict HasFEAT_FHM)
queryFEAT_FHM = case sFEAT_FHM of STrue -> unsafeAssumeFEAT_FHM (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FHM #-}

unsafeAssumeFEAT_FlagM :: (HasFEAT_FlagM => a) -> a
unsafeAssumeFEAT_FlagM k = case unsafeCoerce Refl :: FEAT_FlagM :~: True of Refl -> k

queryFEAT_FlagM :: Maybe (Dict HasFEAT_FlagM)
queryFEAT_FlagM = case sFEAT_FlagM of STrue -> unsafeAssumeFEAT_FlagM (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FlagM #-}

unsafeAssumeFEAT_FlagM2 :: (HasFEAT_FlagM2 => a) -> a
unsafeAssumeFEAT_FlagM2 k = case unsafeCoerce Refl :: FEAT_FlagM2 :~: True of Refl -> k

queryFEAT_FlagM2 :: Maybe (Dict HasFEAT_FlagM2)
queryFEAT_FlagM2 = case sFEAT_FlagM2 of STrue -> unsafeAssumeFEAT_FlagM2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FlagM2 #-}

unsafeAssumeFEAT_FP16 :: (HasFEAT_FP16 => a) -> a
unsafeAssumeFEAT_FP16 k = case unsafeCoerce Refl :: FEAT_FP16 :~: True of Refl -> k

queryFEAT_FP16 :: Maybe (Dict HasFEAT_FP16)
queryFEAT_FP16 = case sFEAT_FP16 of STrue -> unsafeAssumeFEAT_FP16 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FP16 #-}

unsafeAssumeFEAT_FPAC :: (HasFEAT_FPAC => a) -> a
unsafeAssumeFEAT_FPAC k = case unsafeCoerce Refl :: FEAT_FPAC :~: True of Refl -> k

queryFEAT_FPAC :: Maybe (Dict HasFEAT_FPAC)
queryFEAT_FPAC = case sFEAT_FPAC of STrue -> unsafeAssumeFEAT_FPAC (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FPAC #-}

unsafeAssumeFEAT_FRINTTS :: (HasFEAT_FRINTTS => a) -> a
unsafeAssumeFEAT_FRINTTS k = case unsafeCoerce Refl :: FEAT_FRINTTS :~: True of Refl -> k

queryFEAT_FRINTTS :: Maybe (Dict HasFEAT_FRINTTS)
queryFEAT_FRINTTS = case sFEAT_FRINTTS of STrue -> unsafeAssumeFEAT_FRINTTS (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_FRINTTS #-}

unsafeAssumeFEAT_I8MM :: (HasFEAT_I8MM => a) -> a
unsafeAssumeFEAT_I8MM k = case unsafeCoerce Refl :: FEAT_I8MM :~: True of Refl -> k

queryFEAT_I8MM :: Maybe (Dict HasFEAT_I8MM)
queryFEAT_I8MM = case sFEAT_I8MM of STrue -> unsafeAssumeFEAT_I8MM (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_I8MM #-}

unsafeAssumeFEAT_JSCVT :: (HasFEAT_JSCVT => a) -> a
unsafeAssumeFEAT_JSCVT k = case unsafeCoerce Refl :: FEAT_JSCVT :~: True of Refl -> k

queryFEAT_JSCVT :: Maybe (Dict HasFEAT_JSCVT)
queryFEAT_JSCVT = case sFEAT_JSCVT of STrue -> unsafeAssumeFEAT_JSCVT (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_JSCVT #-}

unsafeAssumeFEAT_LRCPC :: (HasFEAT_LRCPC => a) -> a
unsafeAssumeFEAT_LRCPC k = case unsafeCoerce Refl :: FEAT_LRCPC :~: True of Refl -> k

queryFEAT_LRCPC :: Maybe (Dict HasFEAT_LRCPC)
queryFEAT_LRCPC = case sFEAT_LRCPC of STrue -> unsafeAssumeFEAT_LRCPC (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_LRCPC #-}

unsafeAssumeFEAT_LRCPC2 :: (HasFEAT_LRCPC2 => a) -> a
unsafeAssumeFEAT_LRCPC2 k = case unsafeCoerce Refl :: FEAT_LRCPC2 :~: True of Refl -> k

queryFEAT_LRCPC2 :: Maybe (Dict HasFEAT_LRCPC2)
queryFEAT_LRCPC2 = case sFEAT_LRCPC2 of STrue -> unsafeAssumeFEAT_LRCPC2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_LRCPC2 #-}

unsafeAssumeFEAT_LSE :: (HasFEAT_LSE => a) -> a
unsafeAssumeFEAT_LSE k = case unsafeCoerce Refl :: FEAT_LSE :~: True of Refl -> k

queryFEAT_LSE :: Maybe (Dict HasFEAT_LSE)
queryFEAT_LSE = case sFEAT_LSE of STrue -> unsafeAssumeFEAT_LSE (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_LSE #-}

unsafeAssumeFEAT_LSE2 :: (HasFEAT_LSE2 => a) -> a
unsafeAssumeFEAT_LSE2 k = case unsafeCoerce Refl :: FEAT_LSE2 :~: True of Refl -> k

queryFEAT_LSE2 :: Maybe (Dict HasFEAT_LSE2)
queryFEAT_LSE2 = case sFEAT_LSE2 of STrue -> unsafeAssumeFEAT_LSE2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_LSE2 #-}

unsafeAssumeFEAT_PAuth :: (HasFEAT_PAuth => a) -> a
unsafeAssumeFEAT_PAuth k = case unsafeCoerce Refl :: FEAT_PAuth :~: True of Refl -> k

queryFEAT_PAuth :: Maybe (Dict HasFEAT_PAuth)
queryFEAT_PAuth = case sFEAT_PAuth of STrue -> unsafeAssumeFEAT_PAuth (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_PAuth #-}

unsafeAssumeFEAT_PAuth2 :: (HasFEAT_PAuth2 => a) -> a
unsafeAssumeFEAT_PAuth2 k = case unsafeCoerce Refl :: FEAT_PAuth2 :~: True of Refl -> k

queryFEAT_PAuth2 :: Maybe (Dict HasFEAT_PAuth2)
queryFEAT_PAuth2 = case sFEAT_PAuth2 of STrue -> unsafeAssumeFEAT_PAuth2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_PAuth2 #-}

unsafeAssumeFEAT_PMULL :: (HasFEAT_PMULL => a) -> a
unsafeAssumeFEAT_PMULL k = case unsafeCoerce Refl :: FEAT_PMULL :~: True of Refl -> k

queryFEAT_PMULL :: Maybe (Dict HasFEAT_PMULL)
queryFEAT_PMULL = case sFEAT_PMULL of STrue -> unsafeAssumeFEAT_PMULL (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_PMULL #-}

unsafeAssumeFEAT_RDM :: (HasFEAT_RDM => a) -> a
unsafeAssumeFEAT_RDM k = case unsafeCoerce Refl :: FEAT_RDM :~: True of Refl -> k

queryFEAT_RDM :: Maybe (Dict HasFEAT_RDM)
queryFEAT_RDM = case sFEAT_RDM of STrue -> unsafeAssumeFEAT_RDM (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_RDM #-}

unsafeAssumeFEAT_RPRES :: (HasFEAT_RPRES => a) -> a
unsafeAssumeFEAT_RPRES k = case unsafeCoerce Refl :: FEAT_RPRES :~: True of Refl -> k

queryFEAT_RPRES :: Maybe (Dict HasFEAT_RPRES)
queryFEAT_RPRES = case sFEAT_RPRES of STrue -> unsafeAssumeFEAT_RPRES (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_RPRES #-}

unsafeAssumeFEAT_SB :: (HasFEAT_SB => a) -> a
unsafeAssumeFEAT_SB k = case unsafeCoerce Refl :: FEAT_SB :~: True of Refl -> k

queryFEAT_SB :: Maybe (Dict HasFEAT_SB)
queryFEAT_SB = case sFEAT_SB of STrue -> unsafeAssumeFEAT_SB (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SB #-}

unsafeAssumeFEAT_SHA1 :: (HasFEAT_SHA1 => a) -> a
unsafeAssumeFEAT_SHA1 k = case unsafeCoerce Refl :: FEAT_SHA1 :~: True of Refl -> k

queryFEAT_SHA1 :: Maybe (Dict HasFEAT_SHA1)
queryFEAT_SHA1 = case sFEAT_SHA1 of STrue -> unsafeAssumeFEAT_SHA1 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SHA1 #-}

unsafeAssumeFEAT_SHA256 :: (HasFEAT_SHA256 => a) -> a
unsafeAssumeFEAT_SHA256 k = case unsafeCoerce Refl :: FEAT_SHA256 :~: True of Refl -> k

queryFEAT_SHA256 :: Maybe (Dict HasFEAT_SHA256)
queryFEAT_SHA256 = case sFEAT_SHA256 of STrue -> unsafeAssumeFEAT_SHA256 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SHA256 #-}

unsafeAssumeFEAT_SHA3 :: (HasFEAT_SHA3 => a) -> a
unsafeAssumeFEAT_SHA3 k = case unsafeCoerce Refl :: FEAT_SHA3 :~: True of Refl -> k

queryFEAT_SHA3 :: Maybe (Dict HasFEAT_SHA3)
queryFEAT_SHA3 = case sFEAT_SHA3 of STrue -> unsafeAssumeFEAT_SHA3 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SHA3 #-}

unsafeAssumeFEAT_SHA512 :: (HasFEAT_SHA512 => a) -> a
unsafeAssumeFEAT_SHA512 k = case unsafeCoerce Refl :: FEAT_SHA512 :~: True of Refl -> k

queryFEAT_SHA512 :: Maybe (Dict HasFEAT_SHA512)
queryFEAT_SHA512 = case sFEAT_SHA512 of STrue -> unsafeAssumeFEAT_SHA512 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SHA512 #-}

unsafeAssumeFEAT_SME :: (HasFEAT_SME => a) -> a
unsafeAssumeFEAT_SME k = case unsafeCoerce Refl :: FEAT_SME :~: True of Refl -> k

queryFEAT_SME :: Maybe (Dict HasFEAT_SME)
queryFEAT_SME = case sFEAT_SME of STrue -> unsafeAssumeFEAT_SME (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SME #-}

unsafeAssumeFEAT_SME_F64F64 :: (HasFEAT_SME_F64F64 => a) -> a
unsafeAssumeFEAT_SME_F64F64 k = case unsafeCoerce Refl :: FEAT_SME_F64F64 :~: True of Refl -> k

queryFEAT_SME_F64F64 :: Maybe (Dict HasFEAT_SME_F64F64)
queryFEAT_SME_F64F64 = case sFEAT_SME_F64F64 of STrue -> unsafeAssumeFEAT_SME_F64F64 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SME_F64F64 #-}

unsafeAssumeFEAT_SME_I16I64 :: (HasFEAT_SME_I16I64 => a) -> a
unsafeAssumeFEAT_SME_I16I64 k = case unsafeCoerce Refl :: FEAT_SME_I16I64 :~: True of Refl -> k

queryFEAT_SME_I16I64 :: Maybe (Dict HasFEAT_SME_I16I64)
queryFEAT_SME_I16I64 = case sFEAT_SME_I16I64 of STrue -> unsafeAssumeFEAT_SME_I16I64 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SME_I16I64 #-}

unsafeAssumeFEAT_SME2 :: (HasFEAT_SME2 => a) -> a
unsafeAssumeFEAT_SME2 k = case unsafeCoerce Refl :: FEAT_SME2 :~: True of Refl -> k

queryFEAT_SME2 :: Maybe (Dict HasFEAT_SME2)
queryFEAT_SME2 = case sFEAT_SME2 of STrue -> unsafeAssumeFEAT_SME2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SME2 #-}

unsafeAssumeFEAT_SPECRES :: (HasFEAT_SPECRES => a) -> a
unsafeAssumeFEAT_SPECRES k = case unsafeCoerce Refl :: FEAT_SPECRES :~: True of Refl -> k

queryFEAT_SPECRES :: Maybe (Dict HasFEAT_SPECRES)
queryFEAT_SPECRES = case sFEAT_SPECRES of STrue -> unsafeAssumeFEAT_SPECRES (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SPECRES #-}

unsafeAssumeFEAT_SSBS :: (HasFEAT_SSBS => a) -> a
unsafeAssumeFEAT_SSBS k = case unsafeCoerce Refl :: FEAT_SSBS :~: True of Refl -> k

queryFEAT_SSBS :: Maybe (Dict HasFEAT_SSBS)
queryFEAT_SSBS = case sFEAT_SSBS of STrue -> unsafeAssumeFEAT_SSBS (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SSBS #-}

unsafeAssumeFEAT_SVE :: (HasFEAT_SVE => a) -> a
unsafeAssumeFEAT_SVE k = case unsafeCoerce Refl :: FEAT_SVE :~: True of Refl -> k

queryFEAT_SVE :: Maybe (Dict HasFEAT_SVE)
queryFEAT_SVE = case sFEAT_SVE of STrue -> unsafeAssumeFEAT_SVE (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SVE #-}

unsafeAssumeFEAT_SVE2 :: (HasFEAT_SVE2 => a) -> a
unsafeAssumeFEAT_SVE2 k = case unsafeCoerce Refl :: FEAT_SVE2 :~: True of Refl -> k

queryFEAT_SVE2 :: Maybe (Dict HasFEAT_SVE2)
queryFEAT_SVE2 = case sFEAT_SVE2 of STrue -> unsafeAssumeFEAT_SVE2 (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_SVE2 #-}

unsafeAssumeFEAT_WFxT :: (HasFEAT_WFxT => a) -> a
unsafeAssumeFEAT_WFxT k = case unsafeCoerce Refl :: FEAT_WFxT :~: True of Refl -> k

queryFEAT_WFxT :: Maybe (Dict HasFEAT_WFxT)
queryFEAT_WFxT = case sFEAT_WFxT of STrue -> unsafeAssumeFEAT_WFxT (Just Dict); SFalse -> Nothing
{-# NOINLINE queryFEAT_WFxT #-}
