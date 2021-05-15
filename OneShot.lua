local met = getrawmetatable(game)
setreadonly(met,false)
local old = met.__namecall
met.__namecall = function(t,...)
local args = {...}
if(getnamecallmethod()=="FireServer") then
if(tostring(t) == "HitPart") then
  for i = 0,25 do old(t,...)end
end
 
end
return old(t,...)
end
