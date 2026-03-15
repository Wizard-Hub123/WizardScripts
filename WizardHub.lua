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
            remote:InvokeServer(shopType, itemName)
        end)
    end
    
    task.wait(0.08) -- Saktong delay para ma-check ang pera
    return getMoney() < startMoney -- True kung may nabili
end

local SeedTab = Window:CreateTab("Seed Shop")

_G.MasterAuto = false
SeedTab:CreateToggle({
    Name = "Master Smart Buy (Auto-Stop TP)",
    CurrentValue = false,
    Callback = function(v)
        _G.MasterAuto = v
        task.spawn(function()
            while _G.MasterAuto do
                local totalSeedsBought = 0
                local totalGearsBought = 0
                
                -- 1. UBUSIN MUNA ANG SEEDS
                for _, name in pairs(seeds) do
                    if not _G.MasterAuto then break end
                    -- I-check kung may mabili sa seed na 'to
                    if trySpamBuy("SeedShop", name, seedShopPos) then
                        totalSeedsBought = totalSeedsBought + 1
                        task.wait(0.001)
                    end
                end
                
                -- 2. PAGKATAPOS, UBUSIN ANG GEARS
                for _, name in pairs(gears) do
                    if not _G.MasterAuto then break end
                    if trySpamBuy("GearShop", name, gearShopPos) then
                        totalGearsBought = totalGearsBought + 1
                        task.wait(0.001)
                    end
                end
                
                -- 3. SMART STOP
                if totalSeedsBought == 0 and totalGearsBought == 0 then
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
