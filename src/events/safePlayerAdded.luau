local Players = game:GetService("Players")

local function safePlayerAdded(onAdded: (Player) -> ())
	for _, player in Players:GetPlayers() do
		task.spawn(onAdded, player)
	end

	return Players.PlayerAdded:Connect(onAdded)
end

return safePlayerAdded
