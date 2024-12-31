features_string = [[
FEAT_AES
FEAT_AFP
FEAT_BF16
FEAT_BTI
FEAT_CSV2
FEAT_CSV3
FEAT_DIT
FEAT_DotProd
FEAT_DPB
FEAT_DPB2
FEAT_ECV
FEAT_FCMA
FEAT_FHM
FEAT_FlagM
FEAT_FlagM2
FEAT_FP16
FEAT_FPAC
FEAT_FRINTTS
FEAT_I8MM
FEAT_JSCVT
FEAT_LRCPC
FEAT_LRCPC2
FEAT_LSE
FEAT_LSE2
FEAT_PAuth
FEAT_PAuth2
FEAT_PMULL
FEAT_RDM
FEAT_RPRES
FEAT_SB
FEAT_SHA1
FEAT_SHA256
FEAT_SHA3
FEAT_SHA512
FEAT_SME
FEAT_SME_F64F64
FEAT_SME_I16I64
FEAT_SME2
FEAT_SPECRES
FEAT_SSBS
FEAT_SVE
FEAT_SVE2
FEAT_WFxT
]]
features = {}
for s in string.gmatch(features_string, "[%w_]+") do
  table.insert(features, s)
end

if arg[1] == "bool" then
  for _, name in ipairs(features) do
    io.write(string.format("b%s :: Bool\n", name))
  end
elseif arg[1] == "sbool" then
  for _, name in ipairs(features) do
    io.write(string.format("s%s :: SBool %s\n", name, name))
  end
elseif arg[1] == "sbool_impl" then
  for _, name in ipairs(features) do
    io.write(string.format("s%s = unsafeBoolToSBool b%s\n", name, name))
  end
elseif arg[1] == "unavail" then
  for _, name in ipairs(features) do
    io.write(string.format("{-# INLINE b%s #-}\nb%s = False\n\n", name, name))
  end
elseif arg[1] == "darwin" then
  for _, name in ipairs(features) do
    io.write(string.format("{-# NOINLINE b%s #-}\nb%s = hs_cpu_features_sysctl \"hw.optional.arm.%s\"#\n\n", name, name, name))
  end
elseif arg[1] == "test" then
  for _, name in ipairs(features) do
    io.write(string.format("  putStrLn $ \"Arm.%s = \" ++ show Arm.b%s\n", name, name))
  end
elseif arg[1] == "export" then
  for i, name in ipairs(features) do
    if i == 1 then
      io.write(string.format("  (%s, b%s, s%s\n", name, name, name))
    else
      io.write(string.format("  ,%s, b%s, s%s\n", name, name, name))
    end
  end
  io.write("  ,SBool(..)\n")
  io.write("  ) where\n")
end
