module Main where

import System.CPUFeatures.Arm

main :: IO ()
main = do
  putStrLn $ "FEAT_AES = " ++ show bFEAT_AES
  putStrLn $ "FEAT_BF16 = " ++ show bFEAT_BF16
  putStrLn $ "FEAT_BTI = " ++ show bFEAT_BTI
  putStrLn $ "FEAT_CSV2 = " ++ show bFEAT_CSV2
  putStrLn $ "FEAT_CSV3 = " ++ show bFEAT_CSV3
  putStrLn $ "FEAT_DIT = " ++ show bFEAT_DIT
  putStrLn $ "FEAT_DotProd = " ++ show bFEAT_DotProd
  putStrLn $ "FEAT_DPB = " ++ show bFEAT_DPB
  putStrLn $ "FEAT_DPB2 = " ++ show bFEAT_DPB2
  putStrLn $ "FEAT_ECV = " ++ show bFEAT_ECV
  putStrLn $ "FEAT_FCMA = " ++ show bFEAT_FCMA
  putStrLn $ "FEAT_FHM = " ++ show bFEAT_FHM
  putStrLn $ "FEAT_FlagM = " ++ show bFEAT_FlagM
  putStrLn $ "FEAT_FlagM2 = " ++ show bFEAT_FlagM2
  putStrLn $ "FEAT_FP16 = " ++ show bFEAT_FP16
  putStrLn $ "FEAT_FPAC = " ++ show bFEAT_FPAC
  putStrLn $ "FEAT_FRINTTS = " ++ show bFEAT_FRINTTS
  putStrLn $ "FEAT_I8MM = " ++ show bFEAT_I8MM
  putStrLn $ "FEAT_JSCVT = " ++ show bFEAT_JSCVT
  putStrLn $ "FEAT_LRCPC = " ++ show bFEAT_LRCPC
  putStrLn $ "FEAT_LRCPC2 = " ++ show bFEAT_LRCPC2
  putStrLn $ "FEAT_LSE = " ++ show bFEAT_LSE
  putStrLn $ "FEAT_LSE2 = " ++ show bFEAT_LSE2
  putStrLn $ "FEAT_PAuth = " ++ show bFEAT_PAuth
  putStrLn $ "FEAT_PAuth2 = " ++ show bFEAT_PAuth2
  putStrLn $ "FEAT_PMULL = " ++ show bFEAT_PMULL
  putStrLn $ "FEAT_RDM = " ++ show bFEAT_RDM
  putStrLn $ "FEAT_SB = " ++ show bFEAT_SB
  putStrLn $ "FEAT_SHA1 = " ++ show bFEAT_SHA1
  putStrLn $ "FEAT_SHA256 = " ++ show bFEAT_SHA256
  putStrLn $ "FEAT_SHA3 = " ++ show bFEAT_SHA3
  putStrLn $ "FEAT_SHA512 = " ++ show bFEAT_SHA512
  putStrLn $ "FEAT_SPECRES = " ++ show bFEAT_SPECRES
  putStrLn $ "FEAT_SSBS = " ++ show bFEAT_SSBS
  putStrLn $ "FEAT_SVE = " ++ show bFEAT_SVE
  putStrLn $ "FEAT_SVE2 = " ++ show bFEAT_SVE2
