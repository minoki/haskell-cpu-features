features_string = [[
AESNI
BMI1
BMI2
GFNI
PCLMULQDQ
POPCNT
RDRAND
SHA
SSE3
SSSE3: SSE3
SSE4_1: SSSE3
SSE4_2: SSE4_1
AVX: SSE4_2
AVX2: AVX
F16C: AVX
FMA: AVX
AVX_VNNI: AVX2
AVX512F: AVX2 F16C FMA
AVX512VL: AVX512F
AVX512BW: AVX512F
AVX512DQ: AVX512F
AVX512CD: AVX512F
AVX512_BF16: AVX512BW
AVX512_BITALG: AVX512BW
AVX512_FP16: AVX512BW
AVX512_IFMA: AVX512F
AVX512_VBMI: AVX512BW
AVX512_VBMI2: AVX512BW
AVX512_VNNI: AVX512F
AVX512_VPOPCNTDQ: AVX512F
AVX10_1: AVX2 F16C FMA
AVX10_2: AVX10_1
VAES: AVX2 AESNI
VPCLMULQDQ: AVX PCLMULQDQ
AMX_TILE
AMX_BF16: AMX_TILE
AMX_FP16: AMX_TILE
AMX_INT8: AMX_TILE
]]

local features = {}
local has_dependency = {}
for line in string.gmatch(features_string, "[^\n]+") do
  local a, b = string.match(line, "([%w_]+):(.+)")
  if a ~= nil then
    local t = {}
    for name in string.gmatch(b, "[%w_]+") do
      table.insert(t, name)
      has_dependency[name] = true
    end
    table.insert(features, {a, t})
  else
    table.insert(features, {line, {}})
  end
end

for _, feature in ipairs(features) do
  local name = feature[1]
  local super = {name .. " ~ True"}
  for _, s in ipairs(feature[2]) do
    table.insert(super, "Has" .. s)
  end
  if #super == 1 then
    io.write(string.format("class %s => Has%s\n", super[1], name))
    io.write(string.format("instance %s => Has%s\n", super[1], name))
    io.write("\n")
  else
    io.write(string.format("class (%s) => Has%s\n", table.concat(super, ", "), name))
    io.write(string.format("instance (%s) => Has%s\n", table.concat(super, ", "), name))
    io.write("\n")
  end
end

for _, feature in ipairs(features) do
  local name = feature[1]
  local super = feature[2]
  local x = "k"
  for _, s in ipairs(super) do
    if x ~= "k" then
      x = "(" .. x .. ")"
    end
    x = string.format("unsafeAssume%s %s", s, x)
  end
  io.write(string.format("unsafeAssume%s :: (Has%s => a) -> a\n", name, name))
  io.write(string.format("unsafeAssume%s k = case unsafeCoerce Refl :: %s :~: True of Refl -> %s\n", name, name, x))
  io.write("\n")
  io.write(string.format("query%s :: Maybe (Dict Has%s)\n", name, name))
  io.write(string.format("query%s = case s%s of STrue -> unsafeAssume%s (Just Dict); SFalse -> Nothing\n", name, name, name))
  io.write(string.format("{-# NOINLINE query%s #-}\n", name))
  io.write("\n")
end
