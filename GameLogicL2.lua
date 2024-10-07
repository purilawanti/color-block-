--Skrip GameLogic
local partsGame = workspace.LevelParts:GetChildren()
local partsLobby = workspace.TeleportsLobby:GetChildren()
local teleportPointsGame = {}
local teleportPointsLobby = {}

local Players = game:GetService("Players")


for _, part in pairs(partsGame) do
	local position = part.Position + Vector3.new(0,2,0)
	table.insert(teleportPointsGame, position)
end

for _, part in pairs(partsLobby) do
	local position = part.Position + Vector3.new(0,2,0)
	table.insert(teleportPointsLobby, position)
end


local function getRandomTeleportPoint(spawns)
	local randomIndex = math.random(1, #spawns)
	return spawns[randomIndex]
end

local function teleportPlayerToRandomPoint(player, spawns)
	local character = player.Character
	if character then
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then

			humanoidRootPart.CFrame = CFrame.new(getRandomTeleportPoint(spawns))
		end
	end
end

while true do	
	while #Players:GetPlayers() < 1 do		
		wait()
	end
	for _, player in pairs(game.Players:GetPlayers()) do
		player:SetAttribute("Tag", "Match")
		teleportPlayerToRandomPoint(player, teleportPointsGame)
	end
	wait(5)		
	
	for _, player in pairs(game.Players:GetPlayers()) do
		if player:GetAttribute("Tag", "Match") then
			player:SetAttribute("Tag", nil)
			teleportPlayerToRandomPoint(player, teleportPointsLobby)
		end		
	end
	wait(5)	
end
