-- skrip yang mengubah warna blok
local colors = {
	BrickColor.new("Bright red"),
	BrickColor.new("Bright violet"),
	BrickColor.new("Bright green"),
	BrickColor.new("Bright blue"),
	BrickColor.new("Really black"),
	BrickColor.new("White"),
	BrickColor.new("Bright yellow"),
	BrickColor.new("Bright pink"),
}

local usedColors = {}

local function setRandomColor(part)
	local availableColors = {}
	for _, color in ipairs(colors) do
		if not usedColors[color.Number] then
			table.insert(availableColors, color)
		end
	end	
	if #availableColors == 0 then
		usedColors = {}
		availableColors = colors
	end
	local randomIndex = math.random(1, #availableColors)	
	local randomColor = availableColors[randomIndex]
	part.BrickColor = randomColor
	usedColors[randomColor.Number] = true
end

local function changeColors()
	while true do
		wait(3) 
		local parts = workspace.LevelParts:GetChildren() 
		for _, part in pairs(parts) do			
			setRandomColor(part)			
		end
	end
end

changeColors()
