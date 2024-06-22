{-# LANGUAGE GADTs #-}
import System.CPUFeatures.X86 as X86
import System.CPUFeatures.Arm as Arm
import System.CPUFeatures.Arm.Intrinsics as ArmI
import Criterion.Main

main :: IO ()
main = defaultMain
       (case Arm.sFEAT_PMULL of
          STrue -> [ bench "polymul" $ nf (uncurry ArmI.polymul) (0xdeadbeef, 0xcafecafe)
                   -- , bench "polymul2" $ nf (uncurry ArmI.polymul2) (0xdeadbeef, 0xcafecafe)
                   ]
          SFalse -> []
       )
