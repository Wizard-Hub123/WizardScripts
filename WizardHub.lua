local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Turbo V4 Loading...",
    ConfigurationSaving = {Enabled = false}
})

local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {"Watering Can", "Basic Sprinkler", "Harvest Bell", "Turbo Sprinkler", "Favorite Tool", "Super Sprinkler", "Trowel", "Reverter"}

-- FUNCTION PARA SA STOCK AT PERA CHECK
local function canBuy()
    local player = game.Players.LocalPlayer
    local leaderstats = player:FindFirstChild("leaderstats")
    local money = leaderstats and leaderstats:FindFirstChild("Money") -- Palitan mo itong "Money" kung iba ang tawag sa pera sa game (e.g. "Coins")
    
    if money and money.Value > 0 then
        return true
    end
    return false
end

local function forceTP(target)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Ultra Speed Loading...",
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

-- ULTRA FAST PURCHASE LOGIC
local function ultraPurchase(shopType, itemName)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    
    forceTP(targetPos)
    -- Spam 3 times per call para siguradong pumasok sa server
    pcall(function()
        remote:InvokeServer(shopType, itemName)
        remote:InvokeServer(shopType, itemName)
        remote:InvokeServer(shopType, itemName)
    end)
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

-- [ TURBO BUY ALL SECTION ] --
SeedTab:CreateSection("Turbo Buy All")

_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Instant Buy ALL Seeds",
    CurrentValue = false,
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                for _, name in pairs(seeds) do
                    if not _G.AllSeeds then break end
                    ultraPurchase("SeedShop", name)
                    task.wait(0.001) -- Eto yung requested speed mo
                end
                task.wait(0.1) -- Konting hinga bago mag-loop ulit para makagalaw
            end
        end)
    end
})

GearTab:CreateSection("Turbo Buy All")

_G.AllGears = false
GearTab:CreateToggle({
    Name = "Instant Buy ALL Gears",
    CurrentValue = false,
    Callback = function(v)
        _G.AllGears = v
        task.spawn(function()
            while _G.AllGears do
                for _, name in pairs(gears) do
                    if not _G.AllGears then break end
                    ultraPurchase("GearShop", name)
                    task.wait(0.001)
                end
                task.wait(0.1)
            end
        end)
    end
})

-- [ INDIVIDUAL TOGGLES SECTION ] --
SeedTab:CreateSection("Individual Seeds")
for i, name in ipairs(seeds) do 
    SeedTab:CreateToggle({
        Name = "Auto "..name, 
        CurrentValue = false,
        Callback = function(v) 
            _G["S"..i] = v 
            task.spawn(function() 
                while _G["S"..i] do 
                    ultraPurchase("SeedShop", name) 
                    task.wait(0.001) 
                end 
            end) 
        end
    }) 
end

GearTab:CreateSection("Individual Gears")
for i, name in ipairs(gears) do 
    GearTab:CreateToggle({
        Name = "Auto "..name, 
        CurrentValue = false,
        Callback = function(v) 
            _G["G"..i] = v 
            task.spawn(function() 
                while _G["G"..i] do 
                    ultraPurchase("GearShop", name) 
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
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(target)
    end
end

-- INSTANT PURCHASE LOGIC
local function instantPurchase(shopType, itemName)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    
    if canBuy() then
        forceTP(targetPos)
        -- Gagamit ng task.spawn para hindi mag-lag o tumigil ang script
        task.spawn(function()
            for i = 1, 10 do -- Isasampal ang 10 requests nang sabay-sabay
                remote:InvokeServer(shopType, itemName)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Fix V5 Loading...",
    ConfigurationSaving = {Enabled = false}
})
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Spam God Loading...",
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

-- GET CURRENT MONEY (Change "Money" if your leaderstats name is different)
local function getMoney()
    local p = game.Players.LocalPlayer
    return p.leaderstats and p.leaderstats:FindFirstChild("Money") and p.leaderstats.Money.Value or 0
end

-- SPAM 50 BUY LOGIC WITH STOCK CHECK
local function spamPurchase(shopType, itemName)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    
    local startMoney = getMoney()
    
    -- Teleport to shop
    forceTP(targetPos)
    task.wait(0.01)
    
    -- Spam 50 times
    for i = 1, 50 do
        pcall(function()
            remote:InvokeServer(shopType, itemName)
        end)
    end
    
    task.wait(0.05) -- Sandaling hintay para mag-update ang leaderstats
    
    -- STOCK CHECK: Kung hindi nabawasan ang pera, ibig sabihin Out of Stock
    if getMoney() >= startMoney then
        return false -- No stock / No purchase made
    end
    return true -- Successfully bought
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

-- [ TURBO BUY ALL SECTION ] --
_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Spam Buy ALL Seeds (50x)",
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                for _, name in pairs(seeds) do
                    if not _G.AllSeeds then break end
                    local success = spamPurchase("SeedShop", name)
                    if not success then 
                        -- Kung wala nang stock, skip muna sa susunod na seed
                        task.wait(0.01)
                    end
                end
                task.wait(0.5) -- Pahinga para makagalaw 'pag tapos na ang listahan
            end
        end)
    end
})

_G.AllGears = false
GearTab:CreateToggle({
    Name = "Spam Buy ALL Gears (50x)",
    Callback = function(v)
        _G.AllGears = v
        task.spawn(function()
            while _G.AllGears do
                for _, name in pairs(gears) do
                    if not _G.AllGears then break end
                    local success = spamPurchase("GearShop", name)
                    if not success then task.wait(0.01) end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- [ INDIVIDUAL TOGGLES ] --
SeedTab:CreateSection("Individual Seeds")
for i, name in ipairs(seeds) do 
    SeedTab:CreateToggle({
        Name = "Auto "..name, 
        Callback = function(v) 
            _G["S"..i] = v 
            task.spawn(function() 
                while _G["S"..i] do 
                    local success = spamPurchase("SeedShop", name)
                    if not success then task.wait(1) end -- Wait 1s if out of stock
                    task.wait(0.001)
                end 
            end) 
        end
    }) 
end

GearTab:CreateSection("Individual Gears")
for i, name in ipairs(gears) do 
    GearTab:CreateToggle({
        Name = "Auto "..name, 
        Callback = function(v) 
            _G["G"..i] = v 
            task.spawn(function() 
                while _G["G"..i] do 
                    local success = spamPurchase("GearShop", name)
                    if not success then task.wait(1) end
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
ed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {"Watering Can", "Basic Sprinkler", "Harvest Bell", "Turbo Sprinkler", "Favorite Tool", "Super Sprinkler", "Trowel", "Reverter"}

local function forceTP(target)
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(target)
    end
end

-- TURBO FLOW LOGIC
local function turboPurchase(shopType, itemList)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    
    -- Teleport ka muna sa shop bago mag-spam
    forceTP(targetPos)
    task.wait(0.1) -- Bigay lang natin ng konting hinga para ma-detect ng game
    

end)
ervice'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
