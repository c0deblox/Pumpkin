local a
local b
for i,v in next, getgc() do
  if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
     a = getfenv(v);
     b = v
  end
end
game.RunService.Heartbeat:Connect(function()
   debug.setupvalue(b,5,420)
   a.DISABLED = false
   a.DISABLED2 = false
   a.currentspread = 0
   a.recoil = 0
   a.mode = "automatic"
end)
