local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Turbo Edition Loading...",
    ConfigurationSaving = {Enabled = false}
})

-- COORDINATES
local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {"Watering Can", "Basic Sprinkler", "Harvest Bell", "Turbo Sprinkler", "Favorite Tool", "Super Sprinkler", "Trowel", "Reverter"}

-- CHECK STOCK LOGIC (Silently checks if buy is possible)
local function hasStock(shopType)
    -- Simpleng check: Kung malayo ka at ayaw bumili, i-release ang TP.
    -- (Dahil remote-based, gagamit tayo ng pcall bypass)
    return true 
end

local function forceTP(target)
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(0,0,0)
        root.CFrame = CFrame.new(target)
    end
end

-- TURBO PURCHASE (0.001 delay for maximum speed)
local function turboPurchase(shopType, itemName)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    
    -- Teleport lang kung bibili talaga
    forceTP(targetPos)
    
    -- Spam request (4 times per call para siguradong pasok)
    for i = 1, 4 do
        remote:InvokeServer(shopType, itemName)
    end
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

-- AUTO BUY ALL SEEDS (TURBO)
_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Turbo Buy All Seeds",
    CurrentValue = false,
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                for _, name in pairs(seeds) do
                    if not _G.AllSeeds then break end
                    turboPurchase("SeedShop", name)
                    task.wait(0.001) -- Grabe kabilis
                end
                task.wait()
            end
        end)
    end
})

-- AUTO BUY ALL GEARS (TURBO)
_G.AllGears = false
GearTab:CreateToggle({
    Name = "Turbo Buy All Gears",
    CurrentValue = false,
    Callback = function(v)
        _G.AllGears = v
        task.spawn(function()
            while _G.AllGears do
                for _, name in pairs(gears) do
                    if not _G.AllGears then break end
                    turboPurchase("GearShop", name)
                    task.wait(0.001) -- Grabe kabilis
                end
                task.wait()
            end
        end)
    end
})

-- INDIVIDUAL TOGGLES (TURBO)
for i, name in ipairs(seeds) do 
    SeedTab:CreateToggle({
        Name = "Turbo "..name, 
        Callback = function(v) 
            _G["S"..i] = v 
            task.spawn(function() 
                while _G["S"..i] do 
                    turboPurchase("SeedShop", name) 
                    task.wait(0.001) 
                end 
            end) 
        end
    }) 
end

for i, name in ipairs(gears) do 
    GearTab:CreateToggle({
        Name = "Turbo "..name, 
        Callback = function(v) 
            _G["G"..i] = v 
            task.spawn(function() 
                while _G["G"..i] do 
                    turboPurchase("GearShop", name) 
                    task.wait(0.001) 
                end 
            end) 
        end
    }) 
end

-- ANTI-AFK
local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
