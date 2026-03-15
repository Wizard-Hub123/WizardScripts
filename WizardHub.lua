local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Systems Loading...",
    ConfigurationSaving = {Enabled = false}
})

local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {{n="Watering Can"},{n="Basic Sprinkler"},{n="Harvest Bell"},{n="Turbo Sprinkler"},{n="Favorite Tool"},{n="Super Sprinkler"},{n="Trowel"},{n="Reverter"}}

local function forceTP(target)
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(0,0,0)
        root.CFrame = CFrame.new(target)
    end
end

local function fastPurchase(shopType, data)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    pcall(function()
        if shopType == "SeedShop" then
            remote:InvokeServer("SeedShop", data)
            forceTP(targetPos)
            task.wait(0.01)
            remote:InvokeServer("SeedShop", data)
        else
            local args = {"GearShop", data.n or data}
            remote:InvokeServer(unpack(args))
            forceTP(targetPos)
            task.wait(0.01)
            remote:InvokeServer(unpack(args))
        end
    end)
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Auto Buy All Seeds",
    CurrentValue = false,
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                for _, name in pairs(seeds) do
                    if not _G.AllSeeds then break end
                    fastPurchase("SeedShop", name)
                    task.wait(0.01)
                end
                task.wait()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Systems Loading...",
    ConfigurationSaving = {Enabled = false}
})

local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {{n="Watering Can"},{n="Basic Sprinkler"},{n="Harvest Bell"},{n="Turbo Sprinkler"},{n="Favorite Tool"},{n="Super Sprinkler"},{n="Trowel"},{n="Reverter"}}

local function forceTP(target)
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(0,0,0)
        root.CFrame = CFrame.new(target)
    end
end

local function fastPurchase(shopType, data)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    pcall(function()
        if shopType == "SeedShop" then
            remote:InvokeServer("SeedShop", data)
            forceTP(targetPos)
            task.wait(0.01)
            remote:InvokeServer("SeedShop", data)
        else
            local args = {"GearShop", data.n or data}
            remote:InvokeServer(unpack(args))
            forceTP(targetPos)
            task.wait(0.01)
            remote:InvokeServer(unpack(args))
        end
    end)
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Auto Buy All Seeds",
    CurrentValue = false,
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                for _, name in pairs(seeds) do
                    if not _G.AllSeeds then break end
                    fastPurchase("SeedShop", name)
                    task.wait(0.01)
                end
                task.wait()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | Garden Horizons v3.0",
    LoadingTitle = "Wizard Systems Loading...",
    ConfigurationSaving = {Enabled = false}
})

-- COORDINATES
local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {"Watering Can", "Basic Sprinkler", "Harvest Bell", "Turbo Sprinkler", "Favorite Tool", "Super Sprinkler", "Trowel", "Reverter"}

local function forceTP(target)
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Velocity = Vector3.new(0,0,0)
        root.CFrame = CFrame.new(target)
    end
end

-- FIXED PURCHASE PARA SA GEAR SHOP
local function fastPurchase(shopType, itemName)
    local remote = game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem
    local targetPos = (shopType == "SeedShop") and seedShopPos or gearShopPos
    
    pcall(function()
        if shopType == "SeedShop" then
            remote:InvokeServer("SeedShop", itemName)
        else
            -- Saktong format para sa Gear Shop base sa logs mo
            remote:InvokeServer("GearShop", itemName)
        end
        
        forceTP(targetPos)
        task.wait(0.01)
        
        if shopType == "SeedShop" then
            remote:InvokeServer("SeedShop", itemName)
        else
            remote:InvokeServer("GearShop", itemName)
        end
    end)
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

-- AUTO BUY ALL TOGGLES
_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Auto Buy All Seeds",
    CurrentValue = false,
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                for _, name in pairs(seeds) do
                    if not _G.AllSeeds then break end
                    fastPurchase("SeedShop", name)
                    task.wait(0.01)
                end
                task.wait()
            end
        end)
    end
})

_G.AllGears = false
GearTab:CreateToggle({
    Name = "Auto Buy All Gears",
    CurrentValue = false,
    Callback = function(v)
        _G.AllGears = v
        task.spawn(function()
            while _G.AllGears do
                for _, name in pairs(gears) do
                    if not _G.AllGears then break end
                    fastPurchase("GearShop", name)
                    task.wait(0.01)
                end
                task.wait()
            end
        end)
    end
})

-- INDIVIDUAL TOGGLES
for i, name in ipairs(seeds) do SeedTab:CreateToggle({Name = "Auto "..name, Callback = function(v) _G["S"..i] = v task.spawn(function() while _G["S"..i] do fastPurchase("SeedShop", name) task.wait(0.05) end end) end}) end
for i, name in ipairs(gears) do GearTab:CreateToggle({Name = "Auto "..name, Callback = function(v) _G["G"..i] = v task.spawn(function() while _G["G"..i] do fastPurchase("GearShop", name) task.wait(0.05) end end) end}) end

-- ANTI-AFK
local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
