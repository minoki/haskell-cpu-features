{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
module System.CPUFeatures.X86.Intrinsics where
import Data.Word
import System.CPUFeatures.X86

clmul :: PCLMULQDQ ~ True => Word64 -> Word64 -> (Word64, Word64) -- lo, hi

#if defined(x86_64_HOST_ARCH)

foreign import ccall unsafe hs_cpu_features_clmul_lo :: Word64 -> Word64 -> Word64
foreign import ccall unsafe hs_cpu_features_clmul_hi :: Word64 -> Word64 -> Word64

clmul !a !b = let !lo = hs_cpu_features_clmul_lo a b
                  !hi = hs_cpu_features_clmul_hi a b
              in (lo, hi)

#else

clmul = undefined

#endif
