-- Project Delta Ultimate Cheat Menu
-- Paste this entire script into your executor

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Create the main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProjectDeltaMenu"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "PROJECT DELTA MENU v5.2"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Title.Parent = MainFrame

-- Tab system
local Tabs = {"Combat", "Visuals", "World", "Admin"}
local currentTab = "Combat"

local function CreateButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = position
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    button.Parent = MainFrame
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Combat Tab
local combatFrame = Instance.new("Frame")
combatFrame.Size = UDim2.new(1, 0, 1, -40)
combatFrame.Position = UDim2.new(0, 0, 0, 40)
combatFrame.BackgroundTransparency = 1
combatFrame.Visible = true
combatFrame.Parent = MainFrame

local aimbotToggle = CreateButton("Aimbot: OFF", UDim2.new(0.05, 0, 0.1, 0), function()
    -- Aimbot toggle logic
end)

local aimbotKeybind = CreateButton("Aimbot Key: Q", UDim2.new(0.05, 0, 0.2, 0), function()
    -- Keybind change logic
end)

-- Visuals Tab
local visualsFrame = Instance.new("Frame")
visualsFrame.Size = UDim2.new(1, 0, 1, -40)
visualsFrame.Position = UDim2.new(0, 0, 0, 40)
visualsFrame.BackgroundTransparency = 1
visualsFrame.Visible = false
visualsFrame.Parent = MainFrame

-- World Tab
local worldFrame = Instance.new("Frame")
worldFrame.Size = UDim2.new(1, 0, 1, -40)
worldFrame.Position = UDim2.new(0, 0, 0, 40)
worldFrame.BackgroundTransparency = 1
worldFrame.Visible = false
worldFrame.Parent = MainFrame

local swimToggle = CreateButton("Swim NoClip: OFF", UDim2.new(0.05, 0, 0.1, 0), function()
    -- Swim toggle logic
end)

-- Tab buttons
for i, tabName in ipairs(Tabs) do
    local tabButton = CreateButton(tabName, UDim2.new(0.25 * (i-1), 0, 0, 0), function()
        combatFrame.Visible = (tabName == "Combat")
        visualsFrame.Visible = (tabName == "Visuals")
        worldFrame.Visible = (tabName == "World")
        -- Add other tabs as needed
    end)
    tabButton.Size = UDim2.new(0.25, 0, 0, 40)
end

-- Keybind system
local waitingForKey = nil
UIS.InputBegan:Connect(function(input)
    if waitingForKey then
        waitingForKey.Text = "Key: " .. input.KeyCode.Name
        waitingForKey = nil
    end
end)

-- How to modify the script URL:
-- 1. Upload this script to pastebin/github
-- 2. Change the URL in the loadstring below
-- 3. The updated version will load when you execute

local function UpdateScript()
    loadstring(game:HttpGet("YOUR_SCRIPT_URL_HERE"))()
end

local updateButton = CreateButton("Check for Updates", UDim2.new(0.05, 0, 0.9, 0), UpdateScript)
