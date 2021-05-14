local Client
for i,v in pairs(getgc(true)) do
	if type(v) == "table" and rawget(v, "mode") then
		Client = v;
	end
end

local wkspc = Client.wkspc
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

function isSameTeam(Player, Player2)
	if wkspc.FFA.Value == true then
		return false
	else
		return Player.TeamColor == Player2.TeamColor and true or false
	end
end

function getClosestToMouse()
	local closestdis = math.huge
	local closestplr
	local mspos = Mouse.hit.p
	for i,v in pairs(Players:GetPlayers()) do
		if v:DistanceFromCharacter(mspos) < closestdis and not isSameTeam(LocalPlayer, v) and v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Spawned") then
			closestplr = v
			closestdis = v:DistanceFromCharacter(mspos)
		end
	end
	if not closestplr then return LocalPlayer end
	return closestplr
end

rawset(Client, "firebullet", 
	newcclosure(function()
		local Random
		repeat
			Random = getClosestToMouse()
			until Random.Character and Random.Character:FindFirstChild("Head")
		local Gun = ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.NRPBS.EquippedTool.Value);
		local Distance = (LocalPlayer.Character.Head.Position - Random.Character.Head.Position).magnitude
		
		for i = 1, 5 do
			ReplicatedStorage.Events.HitPart:FireServer(
				Random.Character.Head,
				Random.Character.Head.Position + Vector3.new(math.random(), math.random(), math.random()),
				Gun.Name,
				2,
				Distance,
				false,
				true,
				false,
				1,
				false,
				Gun.FireRate.Value,
				Gun.ReloadTime.Value,
				Gun.Ammo.Value,
				Gun.StoredAmmo.Value,
				Gun.Bullets.Value,
				Gun.EquipTime.Value,
				Gun.RecoilControl.Value,
				Gun.Auto.Value,
				Gun['Speed%'].Value,
				wkspc.DistributedTime.Value
			)
		end
	end)
)
