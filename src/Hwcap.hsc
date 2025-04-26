{-# LANGUAGE CApiFFI #-}
module Hwcap where
import Foreign.C.Types
#if defined(riscv64_HOST_ARCH)
import Data.Char (ord)
import Data.Bits (bit)
#endif

#include <sys/auxv.h>

foreign import capi unsafe "sys/auxv.h getauxval" getauxval :: CULong -> CULong

{-# NOINLINE hwcap #-}
hwcap :: CULong
hwcap = getauxval #{const AT_HWCAP}

hwcap2 :: CULong
#if defined(AT_HWCAP2)
hwcap2 = getauxval #{const AT_HWCAP2}
{-# NOINLINE hwcap2 #-}
#else
hwcap2 = 0
#endif

#if defined(aarch64_HOST_ARCH)

hwcap_FP :: CULong
hwcap_FP = #{const HWCAP_FP}

hwcap_ASIMD :: CULong
hwcap_ASIMD = #{const HWCAP_ASIMD}

hwcap_EVTSTRM :: CULong
hwcap_EVTSTRM = #{const HWCAP_EVTSTRM}

hwcap_AES :: CULong
hwcap_AES = #{const HWCAP_AES}

hwcap_PMULL :: CULong
hwcap_PMULL = #{const HWCAP_PMULL}

hwcap_SHA1 :: CULong
hwcap_SHA1 = #{const HWCAP_SHA1}

hwcap_SHA2 :: CULong
hwcap_SHA2 = #{const HWCAP_SHA2}

hwcap_CRC32 :: CULong
hwcap_CRC32 = #{const HWCAP_CRC32}

hwcap_ATOMICS :: CULong
hwcap_ATOMICS = #{const HWCAP_ATOMICS}

hwcap_FPHP :: CULong
hwcap_FPHP = #{const HWCAP_FPHP}

hwcap_ASIMDHP :: CULong
hwcap_ASIMDHP = #{const HWCAP_ASIMDHP}

hwcap_CPUID :: CULong
hwcap_CPUID = #{const HWCAP_CPUID}

hwcap_ASIMDRDM :: CULong
hwcap_ASIMDRDM = #{const HWCAP_ASIMDRDM}

hwcap_JSCVT :: CULong
hwcap_JSCVT = #{const HWCAP_JSCVT}

hwcap_FCMA :: CULong
hwcap_FCMA = #{const HWCAP_FCMA}

hwcap_LRCPC :: CULong
hwcap_LRCPC = #{const HWCAP_LRCPC}

hwcap_DCPOP :: CULong
hwcap_DCPOP = #{const HWCAP_DCPOP}

hwcap_SHA3 :: CULong
hwcap_SHA3 = #{const HWCAP_SHA3}

hwcap_SM3 :: CULong
hwcap_SM3 = #{const HWCAP_SM3}

hwcap_SM4 :: CULong
hwcap_SM4 = #{const HWCAP_SM4}

hwcap_ASIMDDP :: CULong
hwcap_ASIMDDP = #{const HWCAP_ASIMDDP}

hwcap_SHA512 :: CULong
hwcap_SHA512 = #{const HWCAP_SHA512}

hwcap_SVE :: CULong
hwcap_SVE = #{const HWCAP_SVE}

hwcap_ASIMDFHM :: CULong
hwcap_ASIMDFHM = #{const HWCAP_ASIMDFHM}

hwcap_DIT :: CULong
hwcap_DIT = #{const HWCAP_DIT}

hwcap_USCAT :: CULong
hwcap_USCAT = #{const HWCAP_USCAT}

hwcap_ILRCPC :: CULong
hwcap_ILRCPC = #{const HWCAP_ILRCPC}

hwcap_FLAGM :: CULong
hwcap_FLAGM = #{const HWCAP_FLAGM}

hwcap_SSBS :: CULong
hwcap_SSBS = #{const HWCAP_SSBS}

hwcap_SB :: CULong
hwcap_SB = #{const HWCAP_SB}

hwcap_PACA :: CULong
hwcap_PACA = #{const HWCAP_PACA}

hwcap_PACG :: CULong
hwcap_PACG = #{const HWCAP_PACG}

hwcap2_DCPODP :: CULong
hwcap2_DCPODP = #{const HWCAP2_DCPODP}

hwcap2_SVE2 :: CULong
hwcap2_SVE2 = #{const HWCAP2_SVE2}

hwcap2_SVEAES :: CULong
hwcap2_SVEAES = #{const HWCAP2_SVEAES}

hwcap2_SVEPMULL :: CULong
hwcap2_SVEPMULL = #{const HWCAP2_SVEPMULL}

hwcap2_SVEBITPERM :: CULong
hwcap2_SVEBITPERM = #{const HWCAP2_SVEBITPERM}

hwcap2_SVESHA3 :: CULong
hwcap2_SVESHA3 = #{const HWCAP2_SVESHA3}

hwcap2_SVESM4 :: CULong
hwcap2_SVESM4 = #{const HWCAP2_SVESM4}

hwcap2_FLAGM2 :: CULong
hwcap2_FLAGM2 = #{const HWCAP2_FLAGM2}

hwcap2_FRINT :: CULong
hwcap2_FRINT = #{const HWCAP2_FRINT}

hwcap2_SVEI8MM :: CULong
hwcap2_SVEI8MM = #{const HWCAP2_SVEI8MM}

hwcap2_SVEF32MM :: CULong
hwcap2_SVEF32MM = #{const HWCAP2_SVEF32MM}

hwcap2_SVEF64MM :: CULong
hwcap2_SVEF64MM = #{const HWCAP2_SVEF64MM}

hwcap2_SVEBF16 :: CULong
hwcap2_SVEBF16 = #{const HWCAP2_SVEBF16}

hwcap2_I8MM :: CULong
hwcap2_I8MM = #{const HWCAP2_I8MM}

hwcap2_BF16 :: CULong
hwcap2_BF16 = #{const HWCAP2_BF16}

hwcap2_DGH :: CULong
hwcap2_DGH = #{const HWCAP2_DGH}

hwcap2_RNG :: CULong
hwcap2_RNG = #{const HWCAP2_RNG}

hwcap2_BTI :: CULong
hwcap2_BTI = #{const HWCAP2_BTI}

hwcap2_MTE :: CULong
hwcap2_MTE = #{const HWCAP2_MTE}

hwcap2_AFP :: CULong
hwcap2_AFP = #{const HWCAP2_AFP}

hwcap2_RPRES :: CULong
hwcap2_RPRES = #{const HWCAP2_RPRES}

hwcap2_SME :: CULong
hwcap2_SME = #{const HWCAP2_SME}

hwcap2_SME_F64F64 :: CULong
hwcap2_SME_F64F64 = #{const HWCAP2_SME_F64F64}

hwcap2_SME_I16I64 :: CULong
hwcap2_SME_I16I64 = #{const HWCAP2_SME_I16I64}

hwcap2_SME2 :: CULong
hwcap2_SME2 = #{const HWCAP2_SME2}

hwcap2_WFXT :: CULong
hwcap2_WFXT = #{const HWCAP2_WFXT}

#elif defined(riscv64_HOST_ARCH)

hwcap_I :: CULong
hwcap_I = bit (ord 'I' - ord 'A')

hwcap_M :: CULong
hwcap_M = bit (ord 'M' - ord 'A')

hwcap_A :: CULong
hwcap_A = bit (ord 'A' - ord 'A')

hwcap_F :: CULong
hwcap_F = bit (ord 'F' - ord 'A')

hwcap_D :: CULong
hwcap_D = bit (ord 'D' - ord 'A')

hwcap_C :: CULong
hwcap_C = bit (ord 'C' - ord 'A')

hwcap_V :: CULong
hwcap_V = bit (ord 'V' - ord 'A')

#endif
