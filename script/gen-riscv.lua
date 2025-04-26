features_string = [[
C
V
Zba
Zbb
Zbs
Zicboz
Zbc
Zbkb
Zbkc
Zbkx
Zknd
Zkne
Zknh
Zksed
Zksh
Zkt
Zvbb
Zvbc
Zvkb
Zvkg
Zvkned
Zvknha
Zvknhb
Zvksed
Zvksh
Zvkt
Zfh
Zfhmin
Zihintntl
Zvfh
Zvfhmin
Zfa
Ztso
Zacas
Zicntr
Zicond
Zihintpause
Zihpm
Zve32x
Zve32f
Zve64x
Zve64f
Zve64d
Zimop
Zca
Zcb
Zcd
Zcf
Zcmop
Zawrs
Zaamo
Zalrsc
Supm
Zfbfmin
Zvfbfmin
Zvfbfwma
Zicbom
]]

local features, feature_names = {}, {}
local has_dependency = {}
for line in string.gmatch(features_string, "[^\n]+") do
  local a, b = string.match(line, "([%w_]+):(.+)")
  if a ~= nil then
    local t = {}
    for name in string.gmatch(b, "[%w_]+") do
      table.insert(t, name)
      has_dependency[name] = true
    end
    table.insert(feature_names, a)
    table.insert(features, {a, t})
  else
    table.insert(feature_names, line)
    table.insert(features, {line, {}})
  end
end

if arg[1] == "bool" then
  for _, name in ipairs(feature_names) do
    io.write(string.format("b%s :: Bool\n", name))
  end
elseif arg[1] == "unavail" then
  for _, name in ipairs(feature_names) do
    io.write(string.format("{-# INLINE b%s #-}\nb%s = False\n\n", name, name))
  end
elseif arg[1] == "bool_linux" then
  for _, name in ipairs(feature_names) do
    local hwp
    if name:sub(1, 1) == "Z" or name:sub(1, 1) == "S" then
      hwp = "hwprobe_EXT_" .. name:upper()
    elseif name == "C" then
      hwp = "hwprobe_IMA_C" -- Use hwcap?
    elseif name == "V" then
      hwp = "hwprobe_IMA_V" -- Use hwcap?
    end
    io.write(string.format("b%s = hwprobe_ima_ext_0 .&. %s /= 0\n", name, hwp))
  end
elseif arg[1] == "hwprobe" then
  for _, name in ipairs(feature_names) do
    local hwp
    if name:sub(1, 1) == "Z" or name:sub(1, 1) == "S" then
      hwp = "EXT_" .. name:upper()
    elseif name == "C" then
      hwp = "IMA_C"
    elseif name == "V" then
      hwp = "IMA_V"
    end
    io.write(string.format("hwprobe_%s :: Word64\nhwprobe_%s = #{const RISCV_HWPROBE_%s}\n\n", hwp, hwp, hwp))
  end
elseif arg[1] == "hwprobe_maybemissing" then
  for _, name in ipairs(feature_names) do
    local hwp
    if name:sub(1, 1) == "Z" or name:sub(1, 1) == "S" then
      hwp = "EXT_" .. name:upper()
    elseif name == "C" then
      hwp = "IMA_C"
    elseif name == "V" then
      hwp = "IMA_V"
    end
    io.write(string.format([[
hwprobe_%s :: Word64
#ifdef RISCV_HWPROBE_%s
hwprobe_%s = #{const RISCV_HWPROBE_%s}
#else
hwprobe_%s = 0 -- TODO: Should we embed the value?
#endif

]], hwp, hwp, hwp, hwp, hwp))
  end
elseif arg[1] == "test" then
  for _, name in ipairs(feature_names) do
    io.write(string.format("  putStrLn $ \"RISCV.%s = \" ++ show RISCV.b%s\n", name, name))
  end
elseif arg[1] == "bool_export" then
  for i, name in ipairs(feature_names) do
    if i == 1 then
      io.write(string.format("  (b%s\n", name))
    else
      io.write(string.format("  ,b%s\n", name))
    end
  end
  io.write("  ) where\n")
elseif arg[1] == "typebool" then
  io.write[[
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
module System.CPUFeatures.RISCV.TypeBool
]]
  for i, name in ipairs(feature_names) do
    if i == 1 then
      io.write(string.format("  (%s, s%s\n", name, name))
    else
      io.write(string.format("  ,%s, s%s\n", name, name))
    end
  end
  io.write("  ,SBool(..)\n")
  io.write("  ) where\n")
  io.write[[
import System.CPUFeatures.RISCV.Bool
import System.CPUFeatures.Util

]]
  for _, name in ipairs(feature_names) do
    io.write(string.format("type family %s :: Bool\n", name))
  end
  io.write("\n")
  for _, name in ipairs(feature_names) do
    io.write(string.format("s%s :: SBool %s\n", name, name))
    io.write(string.format("s%s = unsafeBoolToSBool b%s\n\n", name, name))
  end
elseif arg[1] == "constraint" then
  io.write[[
module System.CPUFeatures.RISCV.Constraint
]]
  for i, name in ipairs(feature_names) do
    if i == 1 then
      io.write(string.format("  (Has%s, query%s\n", name, name))
    else
      io.write(string.format("  ,Has%s, query%s\n", name, name))
    end
  end
  io.write("  ,Dict(Dict)\n")
  io.write("  ) where\n")
  io.write[[
import System.CPUFeatures.RISCV.Constraint.Unsafe
]]
elseif arg[1] == "constraint_unsafe" then
  io.write[[
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

]]
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
  
  for i, feature in ipairs(features) do
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
    if i < #features then
      io.write("\n")
    end
  end  
end
