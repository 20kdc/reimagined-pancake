-- Build HTML from reference & all chapters
local i = 1
while true do
 local f = io.open("ScriptSource/" .. i .. ".rb", "r")
 i = i + 1
 if not f then break end
 local enabled = false
 local incode = false
 while true do
  local ps = f:read()
  if not ps then break end
  if ps == "##" then
   enabled = true
  else
   if enabled then
    if ps:sub(1, 1) == "#" then
     if incode then
      print()
      incode = false
     end
     print(ps:sub(3))
    else
     if not incode then
      print()
      incode = true
     end
     print("    " .. ps)
    end
   end
  end
 end
 f:close()
end
print("# Reference")
while true do
 local s = io.read()
 if not s then return end
 if s:sub(1, 1) == "#" then
  -- extra sub-level
  print("#" .. s)
 else
  print(s)
 end
end
