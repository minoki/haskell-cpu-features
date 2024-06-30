{-# LANGUAGE CPP #-}
module System.CPUFeatures.X86.Cpuid (CpuidResult(..), X86Cpuid(..), queryCpuid, Dict(..)) where
import Data.Word
import System.CPUFeatures.Util
#if defined(x86_64_HOST_ARCH)
import System.IO.Unsafe
import Foreign.Marshal.Alloc
import Foreign.Storable
import Foreign.Ptr
#endif

data CpuidResult = CpuidResult { eax :: !Word32, ebx :: !Word32, ecx :: !Word32, edx :: !Word32 } deriving Show

class X86Cpuid where
  cpuid :: Word32 -- ^ Initial eax value (leaf / function)
        -> Word32 -- ^ Initial ecx value (subleaf / subfunction)
        -> CpuidResult
  xgetbv :: Word32 -> Word64

queryCpuid :: Maybe (Dict X86Cpuid)

#if defined(x86_64_HOST_ARCH)

foreign import ccall unsafe hs_cpu_features_cpuid :: Word32 -> Word32 -> Ptr Word32 -> IO ()

foreign import ccall unsafe hs_cpu_features_xgetbv :: Word32 -> Word64

instance X86Cpuid where
  cpuid !initialEax !initialEcx = unsafePerformIO $ allocaBytes (4 * 4) $ \ptr -> do
    hs_cpu_features_cpuid initialEax initialEcx ptr
    a <- peek ptr
    b <- peekElemOff ptr 1
    c <- peekElemOff ptr 2
    d <- peekElemOff ptr 3
    pure $ CpuidResult a b c d
  xgetbv = hs_cpu_features_xgetbv

queryCpuid = Just Dict

#else

queryCpuid = Nothing

#endif
