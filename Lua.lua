if not game:IsLoaded() then game.Loaded:Wait() end
if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

if getgenv().RunScript == true then return end
getgenv().RunScript = true

-- ตั้งค่า queue_on_teleport ให้โหลดสคริปต์หลัก
local queueScript = [[
loadstring(game:HttpGet('https://raw.githubusercontent.com/dyumra/Detail/refs/heads/main/Lua.lua'))()
]]
queue_on_teleport(queueScript)

repeat task.wait(0.1) until game.Players.LocalPlayer and game.Players.LocalPlayer.Character
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local HRP = character:FindFirstChild("HumanoidRootPart")

-- ฟังก์ชันตรวจจับ GUI และสลับเซิฟ
local function checkAndRunHZ()
    local success, gui = pcall(function()
        return player.PlayerGui:WaitForChild("MainScreen_Sibling"):WaitForChild("Enable")
    end)
    if success and gui.Value == true then
        -- รันสคริปต์ hztest
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/hztest2.lua"))()
        -- ย้ายเซิฟไป PlaceId ใหม่
        game:GetService("TeleportService"):Teleport(86076978383613)
    end
end

-- รันตรวจสอบแบบ Loop หรือ Spawn
task.spawn(function()
    while wait(1) do
        checkAndRunHZ()
    end
end)
