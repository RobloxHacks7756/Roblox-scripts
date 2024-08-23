-- Rivals script with mobile compatibility
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function flingPlayer(targetPlayer)
if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = targetPlayer.Character.HumanoidRootPart
targetHRP.Velocity = Vector3.new(math.random(-5000, 5000), math.random(1000, 3000), math.random(-5000, 5000))
end
end

local function teleportPlayer(targetPlayer)
if targetPlayer and targetPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
if targetHRP then
targetHRP.CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0, 5, 0)
end
end
end

local function applySpeedBoost()
local speed = 100
LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

local function createGUI()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local flingButton = Instance.new("TextButton")
flingButton.Size = UDim2.new(0, 200, 0, 50)
flingButton.Position = UDim2.new(0, 50, 0, 50)
flingButton.Text = "Fling Players"
flingButton.Parent = screenGui

flingButton.MouseButton1Click:Connect(function()
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
flingPlayer(player)
end
end
end)

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 200, 0, 50)
teleportButton.Position = UDim2.new(0, 50, 0, 110)
teleportButton.Text = "Teleport to You"
teleportButton.Parent = screenGui

teleportButton.MouseButton1Click:Connect(function()
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
teleportPlayer(player)
end
end
end)

local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0, 200, 0, 50)
speedButton.Position = UDim2.new(0, 50, 0, 170)
