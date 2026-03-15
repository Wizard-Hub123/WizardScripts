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
            end
        end)
    end
end

local SeedTab = Window:CreateTab("Seed Shop")
local GearTab = Window:CreateTab("Gear Shop")

-- TURBO AUTO BUY ALL
_G.AllSeeds = false
SeedTab:CreateToggle({
    Name = "Instant Buy All Seeds",
    Callback = function(v)
        _G.AllSeeds = v
        task.spawn(function()
            while _G.AllSeeds do
                if canBuy() then
                    for _, name in pairs(seeds) do
                        if not _G.AllSeeds then break end
                        instantPurchase("SeedShop", name)
                        task.wait() -- Minimal wait para hindi ma-kick
                    end
                else
                    task.wait(1) -- Mag-wait ng 1 sec bago mag-check ulit para hindi ka ma-TP kung wala kang pera
                end
                task.wait(0.1)
            end
        end)
    end
})

_G.AllGears = false
GearTab:CreateToggle({
    Name = "Instant Buy All Gears",
    Callback = function(v)
        _G.AllGears = v
        task.spawn(function()
            while _G.AllGears do
                if canBuy() then
                    for _, name in pairs(gears) do
                        if not _G.AllGears then break end
                        instantPurchase("GearShop", name)
                        task.wait()
                    end
                else
                    task.wait(1)
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
