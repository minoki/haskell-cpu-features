{-# LANGUAGE CPP #-}
{-# LANGUAGE MonoLocalBinds #-}
module System.CPUFeatures.X86.Cpuid
  ( CpuidResult(..)
  , X86Cpuid(..)
  , queryCpuid
  , getManufacturerString
  , Dict(Dict)
  ) where
import Data.Word
import System.CPUFeatures.Util
#if defined(x86_64_HOST_ARCH) || defined(i386_HOST_ARCH)
import Data.Bits
import Data.Char (chr)
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

getManufacturerString :: X86Cpuid => String

#if defined(x86_64_HOST_ARCH) || defined(i386_HOST_ARCH)

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

getManufacturerString = case cpuid 0 0 of
  CpuidResult _ b c d -> wordToChars b $ wordToChars d $ wordToChars c ""
  where
    bchr = chr . fromIntegral
    wordToChars x s = bchr (fromIntegral $ x .&. 0xFF) : bchr ((x `unsafeShiftR` 8) .&. 0xFF) : bchr ((x `unsafeShiftR` 16) .&. 0xFF) : bchr ((x `unsafeShiftR` 24) .&. 0xFF) : s

#else

queryCpuid = Nothing
getManufacturerString = undefined

#endif
