local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Smart-TP Loading...",
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

-- SMART MONEY CHECK
local function getMoney()
    local p = game.Players.LocalPlayer
    local m = p:FindFirstChild("leaderstats") and p.leaderstats:FindFirstChild("Money")
    return m and m.Value or 0
end

-- TURBO PURCHASE WITH STOCK-STOP
local function smartSpam(shopType, itemName, pos)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local startMoney = getMoney()
    
    -- Mag-TP lang kung ite-test kung may stock
    forceTP(pos)
    
    -- Instant 50 requests
    for i = 1, 50 do
        task.spawn(function()
            remote:InvokeServer(shopType, itemName)
        end)
    end
    
    task.wait(0.05) -- Saglit na check
    
    -- Kung hindi nabawasan ang pera, return false (Out of Stock)
    if getMoney() >= startMoney then
        return false
    end
    return true
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

_G.MasterAuto = false
SeedTab:CreateToggle({
    Name = "Master Smart Buy (Auto-Stop TP)",
    CurrentValue = false,
    Callback = function(v)
        _G.MasterAuto = v
        task.spawn(function()
            while _G.MasterAuto do
                local anyStock = false
                
                -- 1. SEEDS CHECK
                for _, name in pairs(seeds) do
                    if not _G.MasterAuto then break end
                    if smartSpam("SeedShop", name, seedShopPos) then
                        anyStock = true
                        task.wait(0.001)
                    end
                end
                
                -- 2. GEARS CHECK
                for _, name in pairs(gears) do
                    if not _G.MasterAuto then break end
                    if smartSpam("GearShop", name, gearShopPos) then
                        anyStock = true
                        task.wait(0.001)
                    end
                end
                
                -- 3. FREEDOM LOGIC
                if not anyStock then
                    -- Kapag sinuyod na lahat at wala talagang mabili, 
                    -- papakawalan ka ng TP nang 5 seconds para makagala ka.
                    task.wait(5)
                end
                task.wait(0.1)
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
