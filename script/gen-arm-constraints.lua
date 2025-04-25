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
FEAT_SME_F64F64: FEAT_SME
FEAT_SME_I16I64: FEAT_SME
FEAT_SME2: FEAT_SME
FEAT_SPECRES
FEAT_SSBS
FEAT_SVE
FEAT_SVE2: FEAT_SVE
FEAT_WFxT
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
