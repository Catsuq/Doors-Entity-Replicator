return function(_, CanEntityKill)
	local m=Instance.new("Model");m.Name="Lookman"
	spawn(function()
		local L_1_ = CanEntityKill
		local L_2_ = false
		local L_3_ = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
		local L_4_ = game:GetObjects("rbxassetid://11388224925")[1]
		L_4_.Parent=m
		local L_5_ = math.random(1,#L_3_.Nodes:GetChildren())
		L_4_.CFrame = (#L_3_.Nodes:GetChildren()==1 and L_3_.Base or L_3_.Nodes[L_5_]).CFrame + Vector3.new(0, 7, 0)
		m.Parent = workspace
		L_4_.Initiate:Play()
		task.wait(0.5)
		L_4_.Attachment.Eyes.Enabled = true
		L_4_.whisper:Play()
		local L_6_ = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		local function L_7_func(L_8_arg0)
			local L_9_, L_10_ = workspace.CurrentCamera:WorldToViewportPoint(L_8_arg0.Position)
			local L_11_ = L_10_ and L_9_.Z > 0
			local L_12_ = RaycastParams.new()
			L_12_.FilterType = Enum.RaycastFilterType.Blacklist
			L_12_.FilterDescendantsInstances = {
				L_8_arg0
			}
			local L_13_ = workspace:Raycast(L_8_arg0.Position, (game.Players.LocalPlayer.Character.Collision.Position - L_8_arg0.Position), L_12_)
			if L_11_ then
				if L_13_ and (L_13_ and L_13_.Instance).Parent == game.Players.LocalPlayer.Character then
					return true
				end
			end
		end
		while true do
			if workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value] ~= L_3_ then
				L_1_ = false
				task.wait(0.2)
				L_4_:Destroy()
			end
			if L_1_ then
				if (not L_2_ and L_7_func(L_4_)) or (L_2_ and not L_7_func(L_4_)) and m:GetAttribute("Killing")==nil then
					L_6_.Health -= 10
					if L_6_.Health <= 0 then
						game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Eyes"
						debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function, 1, {
							"You died to the Eyes...",
							"They don't like to be stared at."
						})
					end
				end
			end
			task.wait(0.2)
		end
	end)
	return m
end