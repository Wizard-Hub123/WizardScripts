local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Ultra-Speed Loading...",
    ConfigurationSaving = {Enabled = false}
})

local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {"Watering Can", "Basic Sprinkler", "Harvest Bell", "Turbo Sprinkler", "Favorite Tool", "Super Sprinkler", "Trowel", "Reverter"}

local function forceTP(target)
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(target)
    end
end

-- REAL TURBO SPAM (No Waiting)
local function fastSpam(shopType, itemName)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    -- Sabay-sabay na 50 requests nang hindi naghihintay ng sagot
    for i = 1, 50 do
        task.spawn(function()
            remote:InvokeServer(shopType, itemName)
        end)
    end
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

_G.MasterAuto = false
SeedTab:CreateToggle({
    Name = "MASTER TURBO BUY (0.001 Speed)",
    CurrentValue = false,
    Callback = function(v)
        _G.MasterAuto = v
        task.spawn(function()
            while _G.MasterAuto do
                -- 1. SEEDS MUNA
                forceTP(seedShopPos)
                for _, name in pairs(seeds) do
                    if not _G.MasterAuto then break end
                    fastSpam("SeedShop", name)
                    task.wait(0.001)
                end
                
                -- 2. LILIPAT SA GEAR AGAD
                forceTP(gearShopPos)
                for _, name in pairs(gears) do
                    if not _G.MasterAuto then break end
                    fastSpam("GearShop", name)
                    task.wait(0.001)
                end
                
                -- 3. PAHINGA PARA MAKAGALAW KUNG WALANG STOCK
                task.wait(0.5)
            end
        end)
    end
})

-- ANTI-AFK
local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
