{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
module System.CPUFeatures.RISCV.TypeBool
  (C, sC
  ,V, sV
  ,Zba, sZba
  ,Zbb, sZbb
  ,Zbs, sZbs
  ,Zicboz, sZicboz
  ,Zbc, sZbc
  ,Zbkb, sZbkb
  ,Zbkc, sZbkc
  ,Zbkx, sZbkx
  ,Zknd, sZknd
  ,Zkne, sZkne
  ,Zknh, sZknh
  ,Zksed, sZksed
  ,Zksh, sZksh
  ,Zkt, sZkt
  ,Zvbb, sZvbb
  ,Zvbc, sZvbc
  ,Zvkb, sZvkb
  ,Zvkg, sZvkg
  ,Zvkned, sZvkned
  ,Zvknha, sZvknha
  ,Zvknhb, sZvknhb
  ,Zvksed, sZvksed
  ,Zvksh, sZvksh
  ,Zvkt, sZvkt
  ,Zfh, sZfh
  ,Zfhmin, sZfhmin
  ,Zihintntl, sZihintntl
  ,Zvfh, sZvfh
  ,Zvfhmin, sZvfhmin
  ,Zfa, sZfa
  ,Ztso, sZtso
  ,Zacas, sZacas
  ,Zicntr, sZicntr
  ,Zicond, sZicond
  ,Zihintpause, sZihintpause
  ,Zihpm, sZihpm
  ,Zve32x, sZve32x
  ,Zve32f, sZve32f
  ,Zve64x, sZve64x
  ,Zve64f, sZve64f
  ,Zve64d, sZve64d
  ,Zimop, sZimop
  ,Zca, sZca
  ,Zcb, sZcb
  ,Zcd, sZcd
  ,Zcf, sZcf
  ,Zcmop, sZcmop
  ,Zawrs, sZawrs
  ,Zaamo, sZaamo
  ,Zalrsc, sZalrsc
  ,Supm, sSupm
  ,Zfbfmin, sZfbfmin
  ,Zvfbfmin, sZvfbfmin
  ,Zvfbfwma, sZvfbfwma
  ,Zicbom, sZicbom
  ,SBool(..)
  ) where
import System.CPUFeatures.RISCV.Bool
import System.CPUFeatures.Util

type family C :: Bool
type family V :: Bool
type family Zba :: Bool
type family Zbb :: Bool
type family Zbs :: Bool
type family Zicboz :: Bool
type family Zbc :: Bool
type family Zbkb :: Bool
type family Zbkc :: Bool
type family Zbkx :: Bool
type family Zknd :: Bool
type family Zkne :: Bool
type family Zknh :: Bool
type family Zksed :: Bool
type family Zksh :: Bool
type family Zkt :: Bool
type family Zvbb :: Bool
type family Zvbc :: Bool
type family Zvkb :: Bool
type family Zvkg :: Bool
type family Zvkned :: Bool
type family Zvknha :: Bool
type family Zvknhb :: Bool
type family Zvksed :: Bool
type family Zvksh :: Bool
type family Zvkt :: Bool
type family Zfh :: Bool
type family Zfhmin :: Bool
type family Zihintntl :: Bool
type family Zvfh :: Bool
type family Zvfhmin :: Bool
type family Zfa :: Bool
type family Ztso :: Bool
type family Zacas :: Bool
type family Zicntr :: Bool
type family Zicond :: Bool
type family Zihintpause :: Bool
type family Zihpm :: Bool
type family Zve32x :: Bool
type family Zve32f :: Bool
type family Zve64x :: Bool
type family Zve64f :: Bool
type family Zve64d :: Bool
type family Zimop :: Bool
type family Zca :: Bool
type family Zcb :: Bool
type family Zcd :: Bool
type family Zcf :: Bool
type family Zcmop :: Bool
type family Zawrs :: Bool
type family Zaamo :: Bool
type family Zalrsc :: Bool
type family Supm :: Bool
type family Zfbfmin :: Bool
type family Zvfbfmin :: Bool
type family Zvfbfwma :: Bool
type family Zicbom :: Bool

sC :: SBool C
sC = unsafeBoolToSBool bC

sV :: SBool V
sV = unsafeBoolToSBool bV

sZba :: SBool Zba
sZba = unsafeBoolToSBool bZba

sZbb :: SBool Zbb
sZbb = unsafeBoolToSBool bZbb

sZbs :: SBool Zbs
sZbs = unsafeBoolToSBool bZbs

sZicboz :: SBool Zicboz
sZicboz = unsafeBoolToSBool bZicboz

sZbc :: SBool Zbc
sZbc = unsafeBoolToSBool bZbc

sZbkb :: SBool Zbkb
sZbkb = unsafeBoolToSBool bZbkb

sZbkc :: SBool Zbkc
sZbkc = unsafeBoolToSBool bZbkc

sZbkx :: SBool Zbkx
sZbkx = unsafeBoolToSBool bZbkx

sZknd :: SBool Zknd
sZknd = unsafeBoolToSBool bZknd

sZkne :: SBool Zkne
sZkne = unsafeBoolToSBool bZkne

sZknh :: SBool Zknh
sZknh = unsafeBoolToSBool bZknh

sZksed :: SBool Zksed
sZksed = unsafeBoolToSBool bZksed

sZksh :: SBool Zksh
sZksh = unsafeBoolToSBool bZksh

sZkt :: SBool Zkt
sZkt = unsafeBoolToSBool bZkt

sZvbb :: SBool Zvbb
sZvbb = unsafeBoolToSBool bZvbb

sZvbc :: SBool Zvbc
sZvbc = unsafeBoolToSBool bZvbc

sZvkb :: SBool Zvkb
sZvkb = unsafeBoolToSBool bZvkb

sZvkg :: SBool Zvkg
sZvkg = unsafeBoolToSBool bZvkg

sZvkned :: SBool Zvkned
sZvkned = unsafeBoolToSBool bZvkned

sZvknha :: SBool Zvknha
sZvknha = unsafeBoolToSBool bZvknha

sZvknhb :: SBool Zvknhb
sZvknhb = unsafeBoolToSBool bZvknhb

sZvksed :: SBool Zvksed
sZvksed = unsafeBoolToSBool bZvksed

sZvksh :: SBool Zvksh
sZvksh = unsafeBoolToSBool bZvksh

sZvkt :: SBool Zvkt
sZvkt = unsafeBoolToSBool bZvkt

sZfh :: SBool Zfh
sZfh = unsafeBoolToSBool bZfh

sZfhmin :: SBool Zfhmin
sZfhmin = unsafeBoolToSBool bZfhmin

sZihintntl :: SBool Zihintntl
sZihintntl = unsafeBoolToSBool bZihintntl

sZvfh :: SBool Zvfh
sZvfh = unsafeBoolToSBool bZvfh

sZvfhmin :: SBool Zvfhmin
sZvfhmin = unsafeBoolToSBool bZvfhmin

sZfa :: SBool Zfa
sZfa = unsafeBoolToSBool bZfa

sZtso :: SBool Ztso
sZtso = unsafeBoolToSBool bZtso

sZacas :: SBool Zacas
sZacas = unsafeBoolToSBool bZacas

sZicntr :: SBool Zicntr
sZicntr = unsafeBoolToSBool bZicntr

sZicond :: SBool Zicond
sZicond = unsafeBoolToSBool bZicond

sZihintpause :: SBool Zihintpause
sZihintpause = unsafeBoolToSBool bZihintpause

sZihpm :: SBool Zihpm
sZihpm = unsafeBoolToSBool bZihpm

sZve32x :: SBool Zve32x
sZve32x = unsafeBoolToSBool bZve32x

sZve32f :: SBool Zve32f
sZve32f = unsafeBoolToSBool bZve32f

sZve64x :: SBool Zve64x
sZve64x = unsafeBoolToSBool bZve64x

sZve64f :: SBool Zve64f
sZve64f = unsafeBoolToSBool bZve64f

sZve64d :: SBool Zve64d
sZve64d = unsafeBoolToSBool bZve64d

sZimop :: SBool Zimop
sZimop = unsafeBoolToSBool bZimop

sZca :: SBool Zca
sZca = unsafeBoolToSBool bZca

sZcb :: SBool Zcb
sZcb = unsafeBoolToSBool bZcb

sZcd :: SBool Zcd
sZcd = unsafeBoolToSBool bZcd

sZcf :: SBool Zcf
sZcf = unsafeBoolToSBool bZcf

sZcmop :: SBool Zcmop
sZcmop = unsafeBoolToSBool bZcmop

sZawrs :: SBool Zawrs
sZawrs = unsafeBoolToSBool bZawrs

sZaamo :: SBool Zaamo
sZaamo = unsafeBoolToSBool bZaamo

sZalrsc :: SBool Zalrsc
sZalrsc = unsafeBoolToSBool bZalrsc

sSupm :: SBool Supm
sSupm = unsafeBoolToSBool bSupm

sZfbfmin :: SBool Zfbfmin
sZfbfmin = unsafeBoolToSBool bZfbfmin

sZvfbfmin :: SBool Zvfbfmin
sZvfbfmin = unsafeBoolToSBool bZvfbfmin

sZvfbfwma :: SBool Zvfbfwma
sZvfbfwma = unsafeBoolToSBool bZvfbfwma

sZicbom :: SBool Zicbom
sZicbom = unsafeBoolToSBool bZicbom

