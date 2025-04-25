features_string = [[
AESNI
AMX_BF16
AMX_FP16
AMX_INT8
AMX_TILE
AVX
AVX_VNNI
AVX10_1
AVX10_2
AVX2
AVX512_BF16
AVX512_BITALG
AVX512_FP16
AVX512_IFMA
AVX512_VBMI
AVX512_VBMI2
AVX512_VNNI
AVX512_VPOPCNTDQ
AVX512BW
AVX512CD
AVX512DQ
AVX512F
AVX512VL
BMI1
BMI2
F16C
FMA
GFNI
PCLMULQDQ
POPCNT
RDRAND
SHA
SSE3
SSE4_1
SSE4_2
SSSE3
VAES
VPCLMULQDQ
]]
features = {}
for s in string.gmatch(features_string, "[%w_]+") do
  table.insert(features, s)
end

if arg[1] == "decl" then
  for _, name in ipairs(features) do
    io.write(string.format("type family %s :: Bool\n", name))
  end
  io.write("\n")
  for _, name in ipairs(features) do
    io.write(string.format("b%s :: Bool\n", name))
  end
  io.write("\n")
  io.write("mAVX10 :: Maybe Int\n")
  io.write("\n")
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
elseif arg[1] == "test" then
  for _, name in ipairs(features) do
    io.write(string.format("  putStrLn $ \"X86.%s = \" ++ show X86.b%s\n", name, name))
  end
elseif arg[1] == "export" then
  for i, name in ipairs(features) do
    if i == 1 then
      io.write(string.format("  (%s, b%s, s%s\n", name, name, name))
    else
      io.write(string.format("  ,%s, b%s, s%s\n", name, name, name))
    end
  end
  io.write("  ,mAVX10\n")
  io.write("  ,SBool(..)\n")
  io.write("  ) where\n")
end
