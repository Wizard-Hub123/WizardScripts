local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Anti-Magnet Loading...",
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

local function getMoney()
    local p = game.Players.LocalPlayer
    local m = p:FindFirstChild("leaderstats") and p.leaderstats:FindFirstChild("Money")
    return m and m.Value or 0
end

-- TURBO SPAM FUNCTION
local function trySpamBuy(shopType, itemName, pos)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local startMoney = getMoney()
    
    -- Isang beses lang mag-TP para hindi nakakahilo
    forceTP(pos)
    
    -- Spam 50x sa bawat item
    for i = 1, 50 do
        task.spawn(function()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Final Smart Flow...",
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

local function getMoney()
    local p = game.Players.LocalPlayer
    local m = p:FindFirstChild("leaderstats") and p.leaderstats:FindFirstChild("Money")
    return m and m.Value or 0
end

-- TURBO SPAM FUNCTION
local function tryUltraSpam(shopType, itemName, pos)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local startMoney = getMoney()
    
    -- Teleport once per item check
    forceTP(pos)
    
    -- Spam 50x
    for i = 1, 50 do
        task.spawn(function()
            remote:InvokeServer(shopType, itemName)
        end)
    end
    
    task.wait(0.08) -- Saktong delay para ma-check kung nabawasan ang pera
    return getMoney() < startMoney
end

local MainTab = Window:CreateTab("Auto Farm")

_G.MasterAuto = false
MainTab:CreateToggle({
    Name = "Auto Buy All (Seeds & Gears)",
    CurrentValue = false,
    Callback = function(v)
        _G.MasterAuto = v
        task.spawn(function()
            while _G.MasterAuto do
                local anyPurchase = false
                
                -- 1. SEED SHOP: Uubusin muna lahat bago lumipat
                for _, name in pairs(seeds) do
                    if not _G.MasterAuto then break end
                    if tryUltraSpam("SeedShop", name, seedShopPos) then
                        anyPurchase = true
                    end
                    task.wait(0.001)
                end
                
                -- 2. GEAR SHOP: Isang beses lang lilipat pagkatapos ng seeds
                for _, name in pairs(gears) do
                    if not _G.MasterAuto then break end
                    if tryUltraSpam("GearShop", name, gearShopPos) then
                        anyPurchase = true
                    end
                    task.wait(0.001)
                end
                
                -- 3. SMART STOP: Pag wala nang stock kahit saan
                if not anyPurchase then
                    -- Titigil ang TP nang 10 seconds para makalakad ka
                    task.wait(10) 
                else
                    task.wait(0.1)
                end
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
t == 0 then
                    -- Kapag sinuyod na lahat at wala talagang pambili, 
                    -- bitaw muna ang TP nang 8 seconds para makalakad ka.
                    task.wait(8)
                else
                    task.wait(0.1)
                end
            end
        end)
    end
})

-- ANTI-AFK (Fixed)
local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
