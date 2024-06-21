{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
module System.CPUFeatures.Util where
import Data.Kind
import Unsafe.Coerce

type SBool :: Bool -> Type
data SBool x where
  STrue :: SBool True
  SFalse :: SBool False

unsafeBoolToSBool :: Bool -> SBool a
unsafeBoolToSBool True = unsafeCoerce STrue
unsafeBoolToSBool False = unsafeCoerce SFalse
