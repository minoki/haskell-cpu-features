{-# LANGUAGE CApiFFI #-}
module Hwprobe where
import Data.Bits (bit)
import Data.Word (Word64)
import Foreign.C.Types
import System.IO.Unsafe (unsafePerformIO)

#include <asm/hwprobe.h>

foreign import ccall unsafe hs_cpu_features_hwprobe_ima_ext_0 :: IO Word64

hwprobe_ima_ext_0 :: Word64
hwprobe_ima_ext_0 = unsafePerformIO hs_cpu_features_hwprobe_ima_ext_0
{-# NOINLINE hwprobe_ima_ext_0 #-}

hwprobe_IMA_FD :: Word64
hwprobe_IMA_FD = #{const RISCV_HWPROBE_IMA_FD}

hwprobe_IMA_C :: Word64
hwprobe_IMA_C = #{const RISCV_HWPROBE_IMA_C}

hwprobe_IMA_V :: Word64
hwprobe_IMA_V = #{const RISCV_HWPROBE_IMA_V}

hwprobe_EXT_ZBA :: Word64
hwprobe_EXT_ZBA = #{const RISCV_HWPROBE_EXT_ZBA}

hwprobe_EXT_ZBB :: Word64
hwprobe_EXT_ZBB = #{const RISCV_HWPROBE_EXT_ZBB}

hwprobe_EXT_ZBS :: Word64
hwprobe_EXT_ZBS = #{const RISCV_HWPROBE_EXT_ZBS}

hwprobe_EXT_ZICBOZ :: Word64
hwprobe_EXT_ZICBOZ = #{const RISCV_HWPROBE_EXT_ZICBOZ}

hwprobe_EXT_ZBC :: Word64
hwprobe_EXT_ZBC = #{const RISCV_HWPROBE_EXT_ZBC}

hwprobe_EXT_ZBKB :: Word64
hwprobe_EXT_ZBKB = #{const RISCV_HWPROBE_EXT_ZBKB}

hwprobe_EXT_ZBKC :: Word64
hwprobe_EXT_ZBKC = #{const RISCV_HWPROBE_EXT_ZBKC}

hwprobe_EXT_ZBKX :: Word64
hwprobe_EXT_ZBKX = #{const RISCV_HWPROBE_EXT_ZBKX}

hwprobe_EXT_ZKND :: Word64
hwprobe_EXT_ZKND = #{const RISCV_HWPROBE_EXT_ZKND}

hwprobe_EXT_ZKNE :: Word64
hwprobe_EXT_ZKNE = #{const RISCV_HWPROBE_EXT_ZKNE}

hwprobe_EXT_ZKNH :: Word64
hwprobe_EXT_ZKNH = #{const RISCV_HWPROBE_EXT_ZKNH}

hwprobe_EXT_ZKSED :: Word64
hwprobe_EXT_ZKSED = #{const RISCV_HWPROBE_EXT_ZKSED}

hwprobe_EXT_ZKSH :: Word64
hwprobe_EXT_ZKSH = #{const RISCV_HWPROBE_EXT_ZKSH}

hwprobe_EXT_ZKT :: Word64
hwprobe_EXT_ZKT = #{const RISCV_HWPROBE_EXT_ZKT}

hwprobe_EXT_ZVBB :: Word64
hwprobe_EXT_ZVBB = #{const RISCV_HWPROBE_EXT_ZVBB}

hwprobe_EXT_ZVBC :: Word64
hwprobe_EXT_ZVBC = #{const RISCV_HWPROBE_EXT_ZVBC}

hwprobe_EXT_ZVKB :: Word64
hwprobe_EXT_ZVKB = #{const RISCV_HWPROBE_EXT_ZVKB}

hwprobe_EXT_ZVKG :: Word64
hwprobe_EXT_ZVKG = #{const RISCV_HWPROBE_EXT_ZVKG}

hwprobe_EXT_ZVKNED :: Word64
hwprobe_EXT_ZVKNED = #{const RISCV_HWPROBE_EXT_ZVKNED}

hwprobe_EXT_ZVKNHA :: Word64
hwprobe_EXT_ZVKNHA = #{const RISCV_HWPROBE_EXT_ZVKNHA}

hwprobe_EXT_ZVKNHB :: Word64
hwprobe_EXT_ZVKNHB = #{const RISCV_HWPROBE_EXT_ZVKNHB}

hwprobe_EXT_ZVKSED :: Word64
hwprobe_EXT_ZVKSED = #{const RISCV_HWPROBE_EXT_ZVKSED}

hwprobe_EXT_ZVKSH :: Word64
hwprobe_EXT_ZVKSH = #{const RISCV_HWPROBE_EXT_ZVKSH}

hwprobe_EXT_ZVKT :: Word64
hwprobe_EXT_ZVKT = #{const RISCV_HWPROBE_EXT_ZVKT}

hwprobe_EXT_ZFH :: Word64
hwprobe_EXT_ZFH = #{const RISCV_HWPROBE_EXT_ZFH}

hwprobe_EXT_ZFHMIN :: Word64
hwprobe_EXT_ZFHMIN = #{const RISCV_HWPROBE_EXT_ZFHMIN}

hwprobe_EXT_ZIHINTNTL :: Word64
hwprobe_EXT_ZIHINTNTL = #{const RISCV_HWPROBE_EXT_ZIHINTNTL}

hwprobe_EXT_ZVFH :: Word64
hwprobe_EXT_ZVFH = #{const RISCV_HWPROBE_EXT_ZVFH}

hwprobe_EXT_ZVFHMIN :: Word64
-- An older header defines RISCV_HWPROBE_EXT_ZVFHMIN as "(1 << 31)", not "(1ULL << 31)"
#if RISCV_HWPROBE_EXT_ZVFHMIN == (1ULL << 31)
hwprobe_EXT_ZVFHMIN = bit 31
#else
hwprobe_EXT_ZVFHMIN = #{const RISCV_HWPROBE_EXT_ZVFHMIN}
#endif

hwprobe_EXT_ZFA :: Word64
hwprobe_EXT_ZFA = #{const RISCV_HWPROBE_EXT_ZFA}

hwprobe_EXT_ZTSO :: Word64
hwprobe_EXT_ZTSO = #{const RISCV_HWPROBE_EXT_ZTSO}

hwprobe_EXT_ZACAS :: Word64
hwprobe_EXT_ZACAS = #{const RISCV_HWPROBE_EXT_ZACAS}

hwprobe_EXT_ZICNTR :: Word64
#ifdef RISCV_HWPROBE_EXT_ZICNTR
hwprobe_EXT_ZICNTR = #{const RISCV_HWPROBE_EXT_ZICNTR}
#else
hwprobe_EXT_ZICNTR = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZICOND :: Word64
hwprobe_EXT_ZICOND = #{const RISCV_HWPROBE_EXT_ZICOND}

hwprobe_EXT_ZIHINTPAUSE :: Word64
#ifdef RISCV_HWPROBE_EXT_ZHINTPAUSE
hwprobe_EXT_ZIHINTPAUSE = #{const RISCV_HWPROBE_EXT_ZIHINTPAUSE}
#else
hwprobe_EXT_ZIHINTPAUSE = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZIHPM :: Word64
#ifdef RISCV_HWPROBE_EXT_ZIHPM
hwprobe_EXT_ZIHPM = #{const RISCV_HWPROBE_EXT_ZIHPM}
#else
hwprobe_EXT_ZIHPM = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVE32X :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVE32X
hwprobe_EXT_ZVE32X = #{const RISCV_HWPROBE_EXT_ZVE32X}
#else
hwprobe_EXT_ZVE32X = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVE32F :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVE32F
hwprobe_EXT_ZVE32F = #{const RISCV_HWPROBE_EXT_ZVE32F}
#else
hwprobe_EXT_ZVE32F = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVE64X :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVE64X
hwprobe_EXT_ZVE64X = #{const RISCV_HWPROBE_EXT_ZVE64X}
#else
hwprobe_EXT_ZVE64X = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVE64F :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVE64F
hwprobe_EXT_ZVE64F = #{const RISCV_HWPROBE_EXT_ZVE64F}
#else
hwprobe_EXT_ZVE64F = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVE64D :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVE64D
hwprobe_EXT_ZVE64D = #{const RISCV_HWPROBE_EXT_ZVE64D}
#else
hwprobe_EXT_ZVE64D = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZIMOP :: Word64
#ifdef RISCV_HWPROBE_EXT_ZIMOP
hwprobe_EXT_ZIMOP = #{const RISCV_HWPROBE_EXT_ZIMOP}
#else
hwprobe_EXT_ZIMOP = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZCA :: Word64
#ifdef RISCV_HWPROBE_EXT_ZCA
hwprobe_EXT_ZCA = #{const RISCV_HWPROBE_EXT_ZCA}
#else
hwprobe_EXT_ZCA = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZCB :: Word64
#ifdef RISCV_HWPROBE_EXT_ZCB
hwprobe_EXT_ZCB = #{const RISCV_HWPROBE_EXT_ZCB}
#else
hwprobe_EXT_ZCB = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZCD :: Word64
#ifdef RISCV_HWPROBE_EXT_ZCD
hwprobe_EXT_ZCD = #{const RISCV_HWPROBE_EXT_ZCD}
#else
hwprobe_EXT_ZCD = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZCF :: Word64
#ifdef RISCV_HWPROBE_EXT_ZCF
hwprobe_EXT_ZCF = #{const RISCV_HWPROBE_EXT_ZCF}
#else
hwprobe_EXT_ZCF = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZCMOP :: Word64
#ifdef RISCV_HWPROBE_EXT_ZCMOP
hwprobe_EXT_ZCMOP = #{const RISCV_HWPROBE_EXT_ZCMOP}
#else
hwprobe_EXT_ZCMOP = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZAWRS :: Word64
#ifdef RISCV_HWPROBE_EXT_ZAWRS
hwprobe_EXT_ZAWRS = #{const RISCV_HWPROBE_EXT_ZAWRS}
#else
hwprobe_EXT_ZAWRS = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZAAMO :: Word64
#ifdef RISCV_HWPROBE_EXT_ZAAMO
hwprobe_EXT_ZAAMO = #{const RISCV_HWPROBE_EXT_ZAAMO}
#else
hwprobe_EXT_ZAAMO = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZALRSC :: Word64
#ifdef RISCV_HWPROBE_EXT_ZALRSC
hwprobe_EXT_ZALRSC = #{const RISCV_HWPROBE_EXT_ZALRSC}
#else
hwprobe_EXT_ZALRSC = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_SUPM :: Word64
#ifdef RISCV_HWPROBE_EXT_SUPM
hwprobe_EXT_SUPM = #{const RISCV_HWPROBE_EXT_SUPM}
#else
hwprobe_EXT_SUPM = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZFBFMIN :: Word64
#ifdef RISCV_HWPROBE_EXT_ZFBFMIN
hwprobe_EXT_ZFBFMIN = #{const RISCV_HWPROBE_EXT_ZFBFMIN}
#else
hwprobe_EXT_ZFBFMIN = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVFBFMIN :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVFBFMIN
hwprobe_EXT_ZVFBFMIN = #{const RISCV_HWPROBE_EXT_ZVFBFMIN}
#else
hwprobe_EXT_ZVFBFMIN = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZVFBFWMA :: Word64
#ifdef RISCV_HWPROBE_EXT_ZVFBFWMA
hwprobe_EXT_ZVFBFWMA = #{const RISCV_HWPROBE_EXT_ZVFBFWMA}
#else
hwprobe_EXT_ZVFBFWMA = 0 -- TODO: Should we embed the value?
#endif

hwprobe_EXT_ZICBOM :: Word64
#ifdef RISCV_HWPROBE_EXT_ZICBOM
hwprobe_EXT_ZICBOM = #{const RISCV_HWPROBE_EXT_ZICBOM}
#else
hwprobe_EXT_ZICBOM = 0 -- TODO: Should we embed the value?
#endif
