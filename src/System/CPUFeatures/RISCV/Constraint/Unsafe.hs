{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
module System.CPUFeatures.RISCV.Constraint.Unsafe
  ( module System.CPUFeatures.RISCV.Constraint.Unsafe
  , Dict (Dict)
  ) where
import Data.Type.Equality ((:~:)(Refl))
import System.CPUFeatures.Util
import System.CPUFeatures.RISCV.TypeBool
import Unsafe.Coerce (unsafeCoerce)

class C ~ True => HasC
instance C ~ True => HasC

class V ~ True => HasV
instance V ~ True => HasV

class Zba ~ True => HasZba
instance Zba ~ True => HasZba

class Zbb ~ True => HasZbb
instance Zbb ~ True => HasZbb

class Zbs ~ True => HasZbs
instance Zbs ~ True => HasZbs

class Zicboz ~ True => HasZicboz
instance Zicboz ~ True => HasZicboz

class Zbc ~ True => HasZbc
instance Zbc ~ True => HasZbc

class Zbkb ~ True => HasZbkb
instance Zbkb ~ True => HasZbkb

class Zbkc ~ True => HasZbkc
instance Zbkc ~ True => HasZbkc

class Zbkx ~ True => HasZbkx
instance Zbkx ~ True => HasZbkx

class Zknd ~ True => HasZknd
instance Zknd ~ True => HasZknd

class Zkne ~ True => HasZkne
instance Zkne ~ True => HasZkne

class Zknh ~ True => HasZknh
instance Zknh ~ True => HasZknh

class Zksed ~ True => HasZksed
instance Zksed ~ True => HasZksed

class Zksh ~ True => HasZksh
instance Zksh ~ True => HasZksh

class Zkt ~ True => HasZkt
instance Zkt ~ True => HasZkt

class Zvbb ~ True => HasZvbb
instance Zvbb ~ True => HasZvbb

class Zvbc ~ True => HasZvbc
instance Zvbc ~ True => HasZvbc

class Zvkb ~ True => HasZvkb
instance Zvkb ~ True => HasZvkb

class Zvkg ~ True => HasZvkg
instance Zvkg ~ True => HasZvkg

class Zvkned ~ True => HasZvkned
instance Zvkned ~ True => HasZvkned

class Zvknha ~ True => HasZvknha
instance Zvknha ~ True => HasZvknha

class Zvknhb ~ True => HasZvknhb
instance Zvknhb ~ True => HasZvknhb

class Zvksed ~ True => HasZvksed
instance Zvksed ~ True => HasZvksed

class Zvksh ~ True => HasZvksh
instance Zvksh ~ True => HasZvksh

class Zvkt ~ True => HasZvkt
instance Zvkt ~ True => HasZvkt

class Zfh ~ True => HasZfh
instance Zfh ~ True => HasZfh

class Zfhmin ~ True => HasZfhmin
instance Zfhmin ~ True => HasZfhmin

class Zihintntl ~ True => HasZihintntl
instance Zihintntl ~ True => HasZihintntl

class Zvfh ~ True => HasZvfh
instance Zvfh ~ True => HasZvfh

class Zvfhmin ~ True => HasZvfhmin
instance Zvfhmin ~ True => HasZvfhmin

class Zfa ~ True => HasZfa
instance Zfa ~ True => HasZfa

class Ztso ~ True => HasZtso
instance Ztso ~ True => HasZtso

class Zacas ~ True => HasZacas
instance Zacas ~ True => HasZacas

class Zicntr ~ True => HasZicntr
instance Zicntr ~ True => HasZicntr

class Zicond ~ True => HasZicond
instance Zicond ~ True => HasZicond

class Zihintpause ~ True => HasZihintpause
instance Zihintpause ~ True => HasZihintpause

class Zihpm ~ True => HasZihpm
instance Zihpm ~ True => HasZihpm

class Zve32x ~ True => HasZve32x
instance Zve32x ~ True => HasZve32x

class Zve32f ~ True => HasZve32f
instance Zve32f ~ True => HasZve32f

class Zve64x ~ True => HasZve64x
instance Zve64x ~ True => HasZve64x

class Zve64f ~ True => HasZve64f
instance Zve64f ~ True => HasZve64f

class Zve64d ~ True => HasZve64d
instance Zve64d ~ True => HasZve64d

class Zimop ~ True => HasZimop
instance Zimop ~ True => HasZimop

class Zca ~ True => HasZca
instance Zca ~ True => HasZca

class Zcb ~ True => HasZcb
instance Zcb ~ True => HasZcb

class Zcd ~ True => HasZcd
instance Zcd ~ True => HasZcd

class Zcf ~ True => HasZcf
instance Zcf ~ True => HasZcf

class Zcmop ~ True => HasZcmop
instance Zcmop ~ True => HasZcmop

class Zawrs ~ True => HasZawrs
instance Zawrs ~ True => HasZawrs

class Zaamo ~ True => HasZaamo
instance Zaamo ~ True => HasZaamo

class Zalrsc ~ True => HasZalrsc
instance Zalrsc ~ True => HasZalrsc

class Supm ~ True => HasSupm
instance Supm ~ True => HasSupm

class Zfbfmin ~ True => HasZfbfmin
instance Zfbfmin ~ True => HasZfbfmin

class Zvfbfmin ~ True => HasZvfbfmin
instance Zvfbfmin ~ True => HasZvfbfmin

class Zvfbfwma ~ True => HasZvfbfwma
instance Zvfbfwma ~ True => HasZvfbfwma

class Zicbom ~ True => HasZicbom
instance Zicbom ~ True => HasZicbom

unsafeAssumeC :: (HasC => a) -> a
unsafeAssumeC k = case unsafeCoerce Refl :: C :~: True of Refl -> k

queryC :: Maybe (Dict HasC)
queryC = case sC of STrue -> unsafeAssumeC (Just Dict); SFalse -> Nothing
{-# NOINLINE queryC #-}

unsafeAssumeV :: (HasV => a) -> a
unsafeAssumeV k = case unsafeCoerce Refl :: V :~: True of Refl -> k

queryV :: Maybe (Dict HasV)
queryV = case sV of STrue -> unsafeAssumeV (Just Dict); SFalse -> Nothing
{-# NOINLINE queryV #-}

unsafeAssumeZba :: (HasZba => a) -> a
unsafeAssumeZba k = case unsafeCoerce Refl :: Zba :~: True of Refl -> k

queryZba :: Maybe (Dict HasZba)
queryZba = case sZba of STrue -> unsafeAssumeZba (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZba #-}

unsafeAssumeZbb :: (HasZbb => a) -> a
unsafeAssumeZbb k = case unsafeCoerce Refl :: Zbb :~: True of Refl -> k

queryZbb :: Maybe (Dict HasZbb)
queryZbb = case sZbb of STrue -> unsafeAssumeZbb (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZbb #-}

unsafeAssumeZbs :: (HasZbs => a) -> a
unsafeAssumeZbs k = case unsafeCoerce Refl :: Zbs :~: True of Refl -> k

queryZbs :: Maybe (Dict HasZbs)
queryZbs = case sZbs of STrue -> unsafeAssumeZbs (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZbs #-}

unsafeAssumeZicboz :: (HasZicboz => a) -> a
unsafeAssumeZicboz k = case unsafeCoerce Refl :: Zicboz :~: True of Refl -> k

queryZicboz :: Maybe (Dict HasZicboz)
queryZicboz = case sZicboz of STrue -> unsafeAssumeZicboz (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZicboz #-}

unsafeAssumeZbc :: (HasZbc => a) -> a
unsafeAssumeZbc k = case unsafeCoerce Refl :: Zbc :~: True of Refl -> k

queryZbc :: Maybe (Dict HasZbc)
queryZbc = case sZbc of STrue -> unsafeAssumeZbc (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZbc #-}

unsafeAssumeZbkb :: (HasZbkb => a) -> a
unsafeAssumeZbkb k = case unsafeCoerce Refl :: Zbkb :~: True of Refl -> k

queryZbkb :: Maybe (Dict HasZbkb)
queryZbkb = case sZbkb of STrue -> unsafeAssumeZbkb (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZbkb #-}

unsafeAssumeZbkc :: (HasZbkc => a) -> a
unsafeAssumeZbkc k = case unsafeCoerce Refl :: Zbkc :~: True of Refl -> k

queryZbkc :: Maybe (Dict HasZbkc)
queryZbkc = case sZbkc of STrue -> unsafeAssumeZbkc (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZbkc #-}

unsafeAssumeZbkx :: (HasZbkx => a) -> a
unsafeAssumeZbkx k = case unsafeCoerce Refl :: Zbkx :~: True of Refl -> k

queryZbkx :: Maybe (Dict HasZbkx)
queryZbkx = case sZbkx of STrue -> unsafeAssumeZbkx (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZbkx #-}

unsafeAssumeZknd :: (HasZknd => a) -> a
unsafeAssumeZknd k = case unsafeCoerce Refl :: Zknd :~: True of Refl -> k

queryZknd :: Maybe (Dict HasZknd)
queryZknd = case sZknd of STrue -> unsafeAssumeZknd (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZknd #-}

unsafeAssumeZkne :: (HasZkne => a) -> a
unsafeAssumeZkne k = case unsafeCoerce Refl :: Zkne :~: True of Refl -> k

queryZkne :: Maybe (Dict HasZkne)
queryZkne = case sZkne of STrue -> unsafeAssumeZkne (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZkne #-}

unsafeAssumeZknh :: (HasZknh => a) -> a
unsafeAssumeZknh k = case unsafeCoerce Refl :: Zknh :~: True of Refl -> k

queryZknh :: Maybe (Dict HasZknh)
queryZknh = case sZknh of STrue -> unsafeAssumeZknh (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZknh #-}

unsafeAssumeZksed :: (HasZksed => a) -> a
unsafeAssumeZksed k = case unsafeCoerce Refl :: Zksed :~: True of Refl -> k

queryZksed :: Maybe (Dict HasZksed)
queryZksed = case sZksed of STrue -> unsafeAssumeZksed (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZksed #-}

unsafeAssumeZksh :: (HasZksh => a) -> a
unsafeAssumeZksh k = case unsafeCoerce Refl :: Zksh :~: True of Refl -> k

queryZksh :: Maybe (Dict HasZksh)
queryZksh = case sZksh of STrue -> unsafeAssumeZksh (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZksh #-}

unsafeAssumeZkt :: (HasZkt => a) -> a
unsafeAssumeZkt k = case unsafeCoerce Refl :: Zkt :~: True of Refl -> k

queryZkt :: Maybe (Dict HasZkt)
queryZkt = case sZkt of STrue -> unsafeAssumeZkt (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZkt #-}

unsafeAssumeZvbb :: (HasZvbb => a) -> a
unsafeAssumeZvbb k = case unsafeCoerce Refl :: Zvbb :~: True of Refl -> k

queryZvbb :: Maybe (Dict HasZvbb)
queryZvbb = case sZvbb of STrue -> unsafeAssumeZvbb (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvbb #-}

unsafeAssumeZvbc :: (HasZvbc => a) -> a
unsafeAssumeZvbc k = case unsafeCoerce Refl :: Zvbc :~: True of Refl -> k

queryZvbc :: Maybe (Dict HasZvbc)
queryZvbc = case sZvbc of STrue -> unsafeAssumeZvbc (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvbc #-}

unsafeAssumeZvkb :: (HasZvkb => a) -> a
unsafeAssumeZvkb k = case unsafeCoerce Refl :: Zvkb :~: True of Refl -> k

queryZvkb :: Maybe (Dict HasZvkb)
queryZvkb = case sZvkb of STrue -> unsafeAssumeZvkb (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvkb #-}

unsafeAssumeZvkg :: (HasZvkg => a) -> a
unsafeAssumeZvkg k = case unsafeCoerce Refl :: Zvkg :~: True of Refl -> k

queryZvkg :: Maybe (Dict HasZvkg)
queryZvkg = case sZvkg of STrue -> unsafeAssumeZvkg (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvkg #-}

unsafeAssumeZvkned :: (HasZvkned => a) -> a
unsafeAssumeZvkned k = case unsafeCoerce Refl :: Zvkned :~: True of Refl -> k

queryZvkned :: Maybe (Dict HasZvkned)
queryZvkned = case sZvkned of STrue -> unsafeAssumeZvkned (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvkned #-}

unsafeAssumeZvknha :: (HasZvknha => a) -> a
unsafeAssumeZvknha k = case unsafeCoerce Refl :: Zvknha :~: True of Refl -> k

queryZvknha :: Maybe (Dict HasZvknha)
queryZvknha = case sZvknha of STrue -> unsafeAssumeZvknha (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvknha #-}

unsafeAssumeZvknhb :: (HasZvknhb => a) -> a
unsafeAssumeZvknhb k = case unsafeCoerce Refl :: Zvknhb :~: True of Refl -> k

queryZvknhb :: Maybe (Dict HasZvknhb)
queryZvknhb = case sZvknhb of STrue -> unsafeAssumeZvknhb (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvknhb #-}

unsafeAssumeZvksed :: (HasZvksed => a) -> a
unsafeAssumeZvksed k = case unsafeCoerce Refl :: Zvksed :~: True of Refl -> k

queryZvksed :: Maybe (Dict HasZvksed)
queryZvksed = case sZvksed of STrue -> unsafeAssumeZvksed (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvksed #-}

unsafeAssumeZvksh :: (HasZvksh => a) -> a
unsafeAssumeZvksh k = case unsafeCoerce Refl :: Zvksh :~: True of Refl -> k

queryZvksh :: Maybe (Dict HasZvksh)
queryZvksh = case sZvksh of STrue -> unsafeAssumeZvksh (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvksh #-}

unsafeAssumeZvkt :: (HasZvkt => a) -> a
unsafeAssumeZvkt k = case unsafeCoerce Refl :: Zvkt :~: True of Refl -> k

queryZvkt :: Maybe (Dict HasZvkt)
queryZvkt = case sZvkt of STrue -> unsafeAssumeZvkt (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvkt #-}

unsafeAssumeZfh :: (HasZfh => a) -> a
unsafeAssumeZfh k = case unsafeCoerce Refl :: Zfh :~: True of Refl -> k

queryZfh :: Maybe (Dict HasZfh)
queryZfh = case sZfh of STrue -> unsafeAssumeZfh (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZfh #-}

unsafeAssumeZfhmin :: (HasZfhmin => a) -> a
unsafeAssumeZfhmin k = case unsafeCoerce Refl :: Zfhmin :~: True of Refl -> k

queryZfhmin :: Maybe (Dict HasZfhmin)
queryZfhmin = case sZfhmin of STrue -> unsafeAssumeZfhmin (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZfhmin #-}

unsafeAssumeZihintntl :: (HasZihintntl => a) -> a
unsafeAssumeZihintntl k = case unsafeCoerce Refl :: Zihintntl :~: True of Refl -> k

queryZihintntl :: Maybe (Dict HasZihintntl)
queryZihintntl = case sZihintntl of STrue -> unsafeAssumeZihintntl (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZihintntl #-}

unsafeAssumeZvfh :: (HasZvfh => a) -> a
unsafeAssumeZvfh k = case unsafeCoerce Refl :: Zvfh :~: True of Refl -> k

queryZvfh :: Maybe (Dict HasZvfh)
queryZvfh = case sZvfh of STrue -> unsafeAssumeZvfh (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvfh #-}

unsafeAssumeZvfhmin :: (HasZvfhmin => a) -> a
unsafeAssumeZvfhmin k = case unsafeCoerce Refl :: Zvfhmin :~: True of Refl -> k

queryZvfhmin :: Maybe (Dict HasZvfhmin)
queryZvfhmin = case sZvfhmin of STrue -> unsafeAssumeZvfhmin (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvfhmin #-}

unsafeAssumeZfa :: (HasZfa => a) -> a
unsafeAssumeZfa k = case unsafeCoerce Refl :: Zfa :~: True of Refl -> k

queryZfa :: Maybe (Dict HasZfa)
queryZfa = case sZfa of STrue -> unsafeAssumeZfa (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZfa #-}

unsafeAssumeZtso :: (HasZtso => a) -> a
unsafeAssumeZtso k = case unsafeCoerce Refl :: Ztso :~: True of Refl -> k

queryZtso :: Maybe (Dict HasZtso)
queryZtso = case sZtso of STrue -> unsafeAssumeZtso (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZtso #-}

unsafeAssumeZacas :: (HasZacas => a) -> a
unsafeAssumeZacas k = case unsafeCoerce Refl :: Zacas :~: True of Refl -> k

queryZacas :: Maybe (Dict HasZacas)
queryZacas = case sZacas of STrue -> unsafeAssumeZacas (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZacas #-}

unsafeAssumeZicntr :: (HasZicntr => a) -> a
unsafeAssumeZicntr k = case unsafeCoerce Refl :: Zicntr :~: True of Refl -> k

queryZicntr :: Maybe (Dict HasZicntr)
queryZicntr = case sZicntr of STrue -> unsafeAssumeZicntr (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZicntr #-}

unsafeAssumeZicond :: (HasZicond => a) -> a
unsafeAssumeZicond k = case unsafeCoerce Refl :: Zicond :~: True of Refl -> k

queryZicond :: Maybe (Dict HasZicond)
queryZicond = case sZicond of STrue -> unsafeAssumeZicond (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZicond #-}

unsafeAssumeZihintpause :: (HasZihintpause => a) -> a
unsafeAssumeZihintpause k = case unsafeCoerce Refl :: Zihintpause :~: True of Refl -> k

queryZihintpause :: Maybe (Dict HasZihintpause)
queryZihintpause = case sZihintpause of STrue -> unsafeAssumeZihintpause (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZihintpause #-}

unsafeAssumeZihpm :: (HasZihpm => a) -> a
unsafeAssumeZihpm k = case unsafeCoerce Refl :: Zihpm :~: True of Refl -> k

queryZihpm :: Maybe (Dict HasZihpm)
queryZihpm = case sZihpm of STrue -> unsafeAssumeZihpm (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZihpm #-}

unsafeAssumeZve32x :: (HasZve32x => a) -> a
unsafeAssumeZve32x k = case unsafeCoerce Refl :: Zve32x :~: True of Refl -> k

queryZve32x :: Maybe (Dict HasZve32x)
queryZve32x = case sZve32x of STrue -> unsafeAssumeZve32x (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZve32x #-}

unsafeAssumeZve32f :: (HasZve32f => a) -> a
unsafeAssumeZve32f k = case unsafeCoerce Refl :: Zve32f :~: True of Refl -> k

queryZve32f :: Maybe (Dict HasZve32f)
queryZve32f = case sZve32f of STrue -> unsafeAssumeZve32f (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZve32f #-}

unsafeAssumeZve64x :: (HasZve64x => a) -> a
unsafeAssumeZve64x k = case unsafeCoerce Refl :: Zve64x :~: True of Refl -> k

queryZve64x :: Maybe (Dict HasZve64x)
queryZve64x = case sZve64x of STrue -> unsafeAssumeZve64x (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZve64x #-}

unsafeAssumeZve64f :: (HasZve64f => a) -> a
unsafeAssumeZve64f k = case unsafeCoerce Refl :: Zve64f :~: True of Refl -> k

queryZve64f :: Maybe (Dict HasZve64f)
queryZve64f = case sZve64f of STrue -> unsafeAssumeZve64f (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZve64f #-}

unsafeAssumeZve64d :: (HasZve64d => a) -> a
unsafeAssumeZve64d k = case unsafeCoerce Refl :: Zve64d :~: True of Refl -> k

queryZve64d :: Maybe (Dict HasZve64d)
queryZve64d = case sZve64d of STrue -> unsafeAssumeZve64d (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZve64d #-}

unsafeAssumeZimop :: (HasZimop => a) -> a
unsafeAssumeZimop k = case unsafeCoerce Refl :: Zimop :~: True of Refl -> k

queryZimop :: Maybe (Dict HasZimop)
queryZimop = case sZimop of STrue -> unsafeAssumeZimop (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZimop #-}

unsafeAssumeZca :: (HasZca => a) -> a
unsafeAssumeZca k = case unsafeCoerce Refl :: Zca :~: True of Refl -> k

queryZca :: Maybe (Dict HasZca)
queryZca = case sZca of STrue -> unsafeAssumeZca (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZca #-}

unsafeAssumeZcb :: (HasZcb => a) -> a
unsafeAssumeZcb k = case unsafeCoerce Refl :: Zcb :~: True of Refl -> k

queryZcb :: Maybe (Dict HasZcb)
queryZcb = case sZcb of STrue -> unsafeAssumeZcb (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZcb #-}

unsafeAssumeZcd :: (HasZcd => a) -> a
unsafeAssumeZcd k = case unsafeCoerce Refl :: Zcd :~: True of Refl -> k

queryZcd :: Maybe (Dict HasZcd)
queryZcd = case sZcd of STrue -> unsafeAssumeZcd (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZcd #-}

unsafeAssumeZcf :: (HasZcf => a) -> a
unsafeAssumeZcf k = case unsafeCoerce Refl :: Zcf :~: True of Refl -> k

queryZcf :: Maybe (Dict HasZcf)
queryZcf = case sZcf of STrue -> unsafeAssumeZcf (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZcf #-}

unsafeAssumeZcmop :: (HasZcmop => a) -> a
unsafeAssumeZcmop k = case unsafeCoerce Refl :: Zcmop :~: True of Refl -> k

queryZcmop :: Maybe (Dict HasZcmop)
queryZcmop = case sZcmop of STrue -> unsafeAssumeZcmop (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZcmop #-}

unsafeAssumeZawrs :: (HasZawrs => a) -> a
unsafeAssumeZawrs k = case unsafeCoerce Refl :: Zawrs :~: True of Refl -> k

queryZawrs :: Maybe (Dict HasZawrs)
queryZawrs = case sZawrs of STrue -> unsafeAssumeZawrs (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZawrs #-}

unsafeAssumeZaamo :: (HasZaamo => a) -> a
unsafeAssumeZaamo k = case unsafeCoerce Refl :: Zaamo :~: True of Refl -> k

queryZaamo :: Maybe (Dict HasZaamo)
queryZaamo = case sZaamo of STrue -> unsafeAssumeZaamo (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZaamo #-}

unsafeAssumeZalrsc :: (HasZalrsc => a) -> a
unsafeAssumeZalrsc k = case unsafeCoerce Refl :: Zalrsc :~: True of Refl -> k

queryZalrsc :: Maybe (Dict HasZalrsc)
queryZalrsc = case sZalrsc of STrue -> unsafeAssumeZalrsc (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZalrsc #-}

unsafeAssumeSupm :: (HasSupm => a) -> a
unsafeAssumeSupm k = case unsafeCoerce Refl :: Supm :~: True of Refl -> k

querySupm :: Maybe (Dict HasSupm)
querySupm = case sSupm of STrue -> unsafeAssumeSupm (Just Dict); SFalse -> Nothing
{-# NOINLINE querySupm #-}

unsafeAssumeZfbfmin :: (HasZfbfmin => a) -> a
unsafeAssumeZfbfmin k = case unsafeCoerce Refl :: Zfbfmin :~: True of Refl -> k

queryZfbfmin :: Maybe (Dict HasZfbfmin)
queryZfbfmin = case sZfbfmin of STrue -> unsafeAssumeZfbfmin (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZfbfmin #-}

unsafeAssumeZvfbfmin :: (HasZvfbfmin => a) -> a
unsafeAssumeZvfbfmin k = case unsafeCoerce Refl :: Zvfbfmin :~: True of Refl -> k

queryZvfbfmin :: Maybe (Dict HasZvfbfmin)
queryZvfbfmin = case sZvfbfmin of STrue -> unsafeAssumeZvfbfmin (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvfbfmin #-}

unsafeAssumeZvfbfwma :: (HasZvfbfwma => a) -> a
unsafeAssumeZvfbfwma k = case unsafeCoerce Refl :: Zvfbfwma :~: True of Refl -> k

queryZvfbfwma :: Maybe (Dict HasZvfbfwma)
queryZvfbfwma = case sZvfbfwma of STrue -> unsafeAssumeZvfbfwma (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZvfbfwma #-}

unsafeAssumeZicbom :: (HasZicbom => a) -> a
unsafeAssumeZicbom k = case unsafeCoerce Refl :: Zicbom :~: True of Refl -> k

queryZicbom :: Maybe (Dict HasZicbom)
queryZicbom = case sZicbom of STrue -> unsafeAssumeZicbom (Just Dict); SFalse -> Nothing
{-# NOINLINE queryZicbom #-}
