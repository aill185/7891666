local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer

local function teleportToVector3(pos)
    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
    end
end

local recordedPosition = nil

UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.F2 and not gameProcessed then
        local char = lp.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            recordedPosition = hrp.Position
        end
    elseif input.KeyCode == Enum.KeyCode.F3 and not gameProcessed then
        if recordedPosition then
            teleportToVector3(recordedPosition)
        end
    end
end)
