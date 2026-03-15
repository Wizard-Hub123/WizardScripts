local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Wizard Hub | v3.0",
    LoadingTitle = "Loading...",
    ConfigurationSaving = {Enabled = false}
})

local seedShopPos = Vector3.new(176.703, 204.018, 672)
local gearShopPos = Vector3.new(217.917, 203.999, 605.876)

local seeds = {"Carrot Seed", "Corn Seed", "Onion Seed", "Strawberry Seed", "Mushroom Seed", "Beetroot Seed", "Tomato Seed", "Apple Seed", "Rose Seed", "Wheat Seed", "Banana Seed", "Plum Seed", "Potato Seed", "Cabbage Seed", "Cherry Seed", "Bamboo Seed", "Mango Seed", "Watermelon Seed", "Pineapple Seed"}
local gears = {{i=2,n="Watering Can"},{i=3,n="Basic Sprinkler"},{i=4,n="Harvest Bell"},{i=6,n="Turbo Spinkler"},{i=7,n="Favorite Tool"},{i=8,n="Super Sprinkler"},{i=9,n="Trowel"},{i=10,n="Reverter"}}

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
    
    -- Eto yung fix para sa Gear
    local arg
    if shopType == "SeedShop" then
        arg = data
    else
        -- Gear format fix
        arg = {[1] = "GearShop", [data.i] = data.n}
    end

    pcall(function()
        -- Unang try: Bili agad
        remote:InvokeServer(shopType, arg)
        
        -- Bypass distance
        forceTP(targetPos)
        task.wait(0.02)
        
        -- Pangalawang try para siguradong pasok
        remote:InvokeServer(shopType, arg)
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
                for _, g in pairs(gears) do
                    if not _G.AllGears then break end
                    fastPurchase("GearShop", g)
                    task.wait(0.01)
                end
                task.wait()
            end
        end)
    end
})

for i, name in ipairs(seeds) do SeedTab:CreateToggle({Name = "Auto "..name, Callback = function(v) _G["S"..i] = v task.spawn(function() while _G["S"..i] do fastPurchase("SeedShop", name) task.wait(0.05) end end) end}) end
for i, g in ipairs(gears) do GearTab:CreateToggle({Name = "Auto "..g.n, Callback = function(v) _G["G"..i] = v task.spawn(function() while _G["G"..i] do fastPurchase("GearShop", g) task.wait(0.05) end end) end}) end

local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
