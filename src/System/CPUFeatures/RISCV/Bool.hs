{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module System.CPUFeatures.RISCV.Bool
  (bC
  ,bV
  ,bZba
  ,bZbb
  ,bZbs
  ,bZicboz
  ,bZbc
  ,bZbkb
  ,bZbkc
  ,bZbkx
  ,bZknd
  ,bZkne
  ,bZknh
  ,bZksed
  ,bZksh
  ,bZkt
  ,bZvbb
  ,bZvbc
  ,bZvkb
  ,bZvkg
  ,bZvkned
  ,bZvknha
  ,bZvknhb
  ,bZvksed
  ,bZvksh
  ,bZvkt
  ,bZfh
  ,bZfhmin
  ,bZihintntl
  ,bZvfh
  ,bZvfhmin
  ,bZfa
  ,bZtso
  ,bZacas
  ,bZicntr
  ,bZicond
  ,bZihintpause
  ,bZihpm
  ,bZve32x
  ,bZve32f
  ,bZve64x
  ,bZve64f
  ,bZve64d
  ,bZimop
  ,bZca
  ,bZcb
  ,bZcd
  ,bZcf
  ,bZcmop
  ,bZawrs
  ,bZaamo
  ,bZalrsc
  ,bSupm
  ,bZfbfmin
  ,bZvfbfmin
  ,bZvfbfwma
  ,bZicbom
  ) where
#if defined(riscv64_HOST_ARCH) && defined(linux_HOST_OS)
import Data.Bits ((.&.))
import Hwcap
import Hwprobe
#endif

bC :: Bool
bV :: Bool
bZba :: Bool
bZbb :: Bool
bZbs :: Bool
bZicboz :: Bool
bZbc :: Bool
bZbkb :: Bool
bZbkc :: Bool
bZbkx :: Bool
bZknd :: Bool
bZkne :: Bool
bZknh :: Bool
bZksed :: Bool
bZksh :: Bool
bZkt :: Bool
bZvbb :: Bool
bZvbc :: Bool
bZvkb :: Bool
bZvkg :: Bool
bZvkned :: Bool
bZvknha :: Bool
bZvknhb :: Bool
bZvksed :: Bool
bZvksh :: Bool
bZvkt :: Bool
bZfh :: Bool
bZfhmin :: Bool
bZihintntl :: Bool
bZvfh :: Bool
bZvfhmin :: Bool
bZfa :: Bool
bZtso :: Bool
bZacas :: Bool
bZicntr :: Bool
bZicond :: Bool
bZihintpause :: Bool
bZihpm :: Bool
bZve32x :: Bool
bZve32f :: Bool
bZve64x :: Bool
bZve64f :: Bool
bZve64d :: Bool
bZimop :: Bool
bZca :: Bool
bZcb :: Bool
bZcd :: Bool
bZcf :: Bool
bZcmop :: Bool
bZawrs :: Bool
bZaamo :: Bool
bZalrsc :: Bool
bSupm :: Bool
bZfbfmin :: Bool
bZvfbfmin :: Bool
bZvfbfwma :: Bool
bZicbom :: Bool

#if defined(riscv64_HOST_ARCH) && defined(linux_HOST_OS)

bC = hwcap .&. hwcap_C /= 0
bV = hwcap .&. hwcap_V /= 0
-- bC = hwprobe_ima_ext_0 .&. hwprobe_IMA_C /= 0
-- bV = hwprobe_ima_ext_0 .&. hwprobe_IMA_V /= 0
bZba = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBA /= 0
bZbb = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBB /= 0
bZbs = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBS /= 0
bZicboz = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZICBOZ /= 0
bZbc = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBC /= 0
bZbkb = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBKB /= 0
bZbkc = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBKC /= 0
bZbkx = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZBKX /= 0
bZknd = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZKND /= 0
bZkne = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZKNE /= 0
bZknh = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZKNH /= 0
bZksed = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZKSED /= 0
bZksh = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZKSH /= 0
bZkt = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZKT /= 0
bZvbb = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVBB /= 0
bZvbc = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVBC /= 0
bZvkb = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKB /= 0
bZvkg = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKG /= 0
bZvkned = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKNED /= 0
bZvknha = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKNHA /= 0
bZvknhb = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKNHB /= 0
bZvksed = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKSED /= 0
bZvksh = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKSH /= 0
bZvkt = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVKT /= 0
bZfh = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZFH /= 0
bZfhmin = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZFHMIN /= 0
bZihintntl = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZIHINTNTL /= 0
bZvfh = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVFH /= 0
bZvfhmin = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVFHMIN /= 0
bZfa = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZFA /= 0
bZtso = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZTSO /= 0
bZacas = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZACAS /= 0
bZicntr = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZICNTR /= 0
bZicond = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZICOND /= 0
bZihintpause = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZIHINTPAUSE /= 0
bZihpm = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZIHPM /= 0
bZve32x = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVE32X /= 0
bZve32f = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVE32F /= 0
bZve64x = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVE64X /= 0
bZve64f = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVE64F /= 0
bZve64d = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVE64D /= 0
bZimop = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZIMOP /= 0
bZca = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZCA /= 0
bZcb = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZCB /= 0
bZcd = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZCD /= 0
bZcf = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZCF /= 0
bZcmop = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZCMOP /= 0
bZawrs = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZAWRS /= 0
bZaamo = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZAAMO /= 0
bZalrsc = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZALRSC /= 0
bSupm = hwprobe_ima_ext_0 .&. hwprobe_EXT_SUPM /= 0
bZfbfmin = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZFBFMIN /= 0
bZvfbfmin = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVFBFMIN /= 0
bZvfbfwma = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZVFBFWMA /= 0
bZicbom = hwprobe_ima_ext_0 .&. hwprobe_EXT_ZICBOM /= 0

#else

{-# INLINE bC #-}
bC = False

{-# INLINE bV #-}
bV = False

{-# INLINE bZba #-}
bZba = False

{-# INLINE bZbb #-}
bZbb = False

{-# INLINE bZbs #-}
bZbs = False

{-# INLINE bZicboz #-}
bZicboz = False

{-# INLINE bZbc #-}
bZbc = False

{-# INLINE bZbkb #-}
bZbkb = False

{-# INLINE bZbkc #-}
bZbkc = False

{-# INLINE bZbkx #-}
bZbkx = False

{-# INLINE bZknd #-}
bZknd = False

{-# INLINE bZkne #-}
bZkne = False

{-# INLINE bZknh #-}
bZknh = False

{-# INLINE bZksed #-}
bZksed = False

{-# INLINE bZksh #-}
bZksh = False

{-# INLINE bZkt #-}
bZkt = False

{-# INLINE bZvbb #-}
bZvbb = False

{-# INLINE bZvbc #-}
bZvbc = False

{-# INLINE bZvkb #-}
bZvkb = False

{-# INLINE bZvkg #-}
bZvkg = False

{-# INLINE bZvkned #-}
bZvkned = False

{-# INLINE bZvknha #-}
bZvknha = False

{-# INLINE bZvknhb #-}
bZvknhb = False

{-# INLINE bZvksed #-}
bZvksed = False

{-# INLINE bZvksh #-}
bZvksh = False

{-# INLINE bZvkt #-}
bZvkt = False

{-# INLINE bZfh #-}
bZfh = False

{-# INLINE bZfhmin #-}
bZfhmin = False

{-# INLINE bZihintntl #-}
bZihintntl = False

{-# INLINE bZvfh #-}
bZvfh = False

{-# INLINE bZvfhmin #-}
bZvfhmin = False

{-# INLINE bZfa #-}
bZfa = False

{-# INLINE bZtso #-}
bZtso = False

{-# INLINE bZacas #-}
bZacas = False

{-# INLINE bZicntr #-}
bZicntr = False

{-# INLINE bZicond #-}
bZicond = False

{-# INLINE bZihintpause #-}
bZihintpause = False

{-# INLINE bZihpm #-}
bZihpm = False

{-# INLINE bZve32x #-}
bZve32x = False

{-# INLINE bZve32f #-}
bZve32f = False

{-# INLINE bZve64x #-}
bZve64x = False

{-# INLINE bZve64f #-}
bZve64f = False

{-# INLINE bZve64d #-}
bZve64d = False

{-# INLINE bZimop #-}
bZimop = False

{-# INLINE bZca #-}
bZca = False

{-# INLINE bZcb #-}
bZcb = False

{-# INLINE bZcd #-}
bZcd = False

{-# INLINE bZcf #-}
bZcf = False

{-# INLINE bZcmop #-}
bZcmop = False

{-# INLINE bZawrs #-}
bZawrs = False

{-# INLINE bZaamo #-}
bZaamo = False

{-# INLINE bZalrsc #-}
bZalrsc = False

{-# INLINE bSupm #-}
bSupm = False

{-# INLINE bZfbfmin #-}
bZfbfmin = False

{-# INLINE bZvfbfmin #-}
bZvfbfmin = False

{-# INLINE bZvfbfwma #-}
bZvfbfwma = False

{-# INLINE bZicbom #-}
bZicbom = False

#endif
