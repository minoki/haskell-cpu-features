{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
module System.CPUFeatures.Arm.Intrinsics
  (polymul
  ) where
import System.CPUFeatures.Arm
import Data.Word
{-
#if defined(aarch64_HOST_ARCH)
import Foreign.Marshal
import Foreign.Ptr
import Foreign.Storable
import System.IO.Unsafe
#endif
-}

polymul :: FEAT_PMULL ~ True => Word64 -> Word64 -> (Word64, Word64) -- (lo, hi)
-- polymul2 :: FEAT_PMULL ~ True => Word64 -> Word64 -> (Word64, Word64) -- (lo, hi)

#if defined(aarch64_HOST_ARCH)

foreign import ccall unsafe hs_cpu_features_polymul_lo :: Word64 -> Word64 -> Word64
foreign import ccall unsafe hs_cpu_features_polymul_hi :: Word64 -> Word64 -> Word64
-- foreign import ccall unsafe hs_cpu_features_polymul :: Word64 -> Word64 -> Ptr Word64 -> IO Word64

polymul !a !b = let !lo = hs_cpu_features_polymul_lo a b
                    !hi = hs_cpu_features_polymul_hi a b
                in (lo, hi)

{- This variant is not so fast:
polymul2 !a !b = unsafeDupablePerformIO $ alloca $ \ptr -> do
  !lo <- hs_cpu_features_polymul a b ptr
  !hi <- peek ptr
  pure (lo, hi)
-}

#else

polymul = undefined
-- polymul2 = undefined

#endif
