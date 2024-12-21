local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local ScriptVersion = "1.1.2"
local Window = Fluent:CreateWindow({
    Title = "Aurora Hub " .. ScriptVersion,
    SubTitle = "by Hund335",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--stuff for future features
--day = game:GetService("ReplicatedStorage").world.cycle
--luck = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
--relic = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power"):InvokeServer()
--rods = game:GetService("ReplicatedStorage").playerstats.zypherinbo.Rods
--autosell settings
--      game:GetService("ReplicatedStorage").playerstats.zypherinbo.Settings.willautosell_relic,
--      game:GetService("ReplicatedStorage").playerstats.zypherinbo.Settings.willautosell_event,
--      game:GetService("ReplicatedStorage").playerstats.zypherinbo.Settings.willautosell_exotic,
--      game:GetService("ReplicatedStorage").playerstats.zypherinbo.Settings.willautosell_gemstone,
--      game:GetService("ReplicatedStorage").playerstats.zypherinbo.Settings.willautosell_legendary,
--      game:GetService("ReplicatedStorage").playerstats.zypherinbo.Settings.willautosell_mythical,
--events
--      game:GetService("ReplicatedStorage").world.luck_Mutation,
--      game:GetService("ReplicatedStorage").world.luck_Luck,
--      game:GetService("ReplicatedStorage").world.luck_Shiny,
--      game:GetService("ReplicatedStorage").world.luck_Sparkling,
--      game:GetService("ReplicatedStorage").world.luck_Weight,
--
--trade idk how this works yet
--local args = {
--    [1] = game:GetService("Players"):WaitForChild("Username you want to give to")
--}
--
--game:GetService("Players").LocalPlayer.Character:FindFirstChild("Captain's Goldfish").offer:FireServer(unpack(args))


--blurwater (disable) = game:GetService("Lighting").underwatercc,
--clearwater (disable) = game:GetService("Lighting").underwaterbl,

--zone = workspace.zypherinbo.zone.value

-- appraise anywhere
--workspace.world.npcs.Appraiser.dialogprompt.MaxActivationDistance = 7000000000
--workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()

local function createBillboardGui(locationName, position, rotation)
    -- Create a part to attach the BillboardGui
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1)
    part.Anchored = true
    part.CanCollide = false
    part.Position = position
    part.Orientation = Vector3.new(rotation.X, rotation.Y, rotation.Z)
    part.Name = locationName
    part.Parent = workspace

    -- Create the BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = part
    billboardGui.Size = UDim2.new(0, 80, 0, 70)  -- Adjusted size to fit both text lines
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = part

    -- Ensure the size is unaffected by distance
    billboardGui.MaxDistance = 0

    -- Create a frame to hold the text labels
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0) -- Full size of the BillboardGui
    frame.BackgroundTransparency = 1  -- No background color
    frame.Parent = billboardGui

    -- Create a UIListLayout to automatically manage layout of the text labels
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical  -- Stack the labels vertically
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)  -- Add a small padding between the labels
    layout.Parent = frame

    -- Create a text label for the location name
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0.5, 0)  -- Take up half the size of the BillboardGui
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "[" .. locationName .. "]"  -- Add brackets around the location name
    textLabel.TextColor3 = Color3.new(0, 0, 1) -- Blue color
    textLabel.TextScaled = true  -- Keep the text scaled proportionally
    textLabel.Font = Enum.Font.GothamBold  -- Set the font to Gotham Bold
    textLabel.Parent = frame

    -- Create another text label for the distance
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)  -- Take up the other half of the BillboardGui
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.TextColor3 = Color3.new(0, 0, 1)  -- Blue color
    distanceLabel.TextScaled = true  -- Keep the text scaled proportionally
    distanceLabel.Font = Enum.Font.Gotham  -- Set the font to Gotham
    distanceLabel.Parent = frame
end

do

        Config = {

        }
        _G.Config = Config
        AllFuncs = {}
        Threads = getgenv().Threads
        Players = game.Players
        LocalPlayer = game.Players.LocalPlayer
        Client = game.Players.LocalPlayer


        -- \\ Module GetService // --

        ReplicatedStorage = game:GetService('ReplicatedStorage')
        RunService = game:GetService("RunService")
        VirtualInputManager = game:GetService('VirtualInputManager')
        CollectionService = game:GetService("CollectionService")
        CoreGui = game:GetService("CoreGui")
        HttpService = game:GetService("HttpService")
        TeleportService = game:GetService("TeleportService")
        VirtualUser = game:GetService("VirtualUser")
        VirtualInputManager = game:GetService("VirtualInputManager")
        UserInputService = game:GetService("UserInputService")


        -- \\ Normal Module // --

        PlayerGui = LocalPlayer.PlayerGui
        Backpack = LocalPlayer.Backpack
        request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

        Char = Client.Character
        Character = Client.Character
        if not Threads then getgenv().Threads = {} end

        repeat
                LocalPlayer = Players.LocalPlayer
                wait()
        until LocalPlayer
end

-- // // // Services // // // --
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local VirtualUser = game:GetService("VirtualUser")
    local HttpService = game:GetService("HttpService")
    local GuiService = game:GetService("GuiService")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local CoreGui = game:GetService('StarterGui')
    local ContextActionService = game:GetService('ContextActionService')
    local UserInputService = game:GetService('UserInputService')
    

-- // // // Locals // // // --
    local LocalPlayer = Players.LocalPlayer
    local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
    local UserPlayer = HumanoidRootPart:WaitForChild("user")
    local ActiveFolder = Workspace:FindFirstChild("active")
    local FishingZonesFolder = Workspace:FindFirstChild("zones"):WaitForChild("fishing")
    local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
    local NpcFolder = Workspace:FindFirstChild("world"):WaitForChild("npcs")
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui", PlayerGui)
    local RenderStepped = RunService.RenderStepped
    local WaitForSomeone = RenderStepped.Wait
    local AntiAfk = 

    local IsIsonadeDetected = false
    local IsWhaleSharkDetected = false
    local IsGreatWhiteSharkDetected = false
    local IsGreatHammerheadSharkDetected = false
    local IsMegalodonDetected = false
    local IsAncientDepthSerpentDetected = false
-- // // // Features List // // // --
-- a lot
-- // // // Location Tables // // // --
    -- Location Values
    -- Define the locations as a table
    local locations = {
        ["Moosewood"] = {Position = Vector3.new(470.000000, 150.935791, 260.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["The Depths"] = {Position = Vector3.new(853.240295, -740.365906, 1335.115723), Rotation = Vector3.new(180.000000, 55.258999, 180.000000)},
        ["Ancient Isles"] = {Position = Vector3.new(5805.021484, 135.301498, 405.922119), Rotation = Vector3.new(0.000000, -42.668999, 0.000000)},
        ["Forsaken Shores"] = {Position = Vector3.new(-2675.331055, 164.795013, 1758.057129), Rotation = Vector3.new(0.000000, 75.242996, 0.000000)},
        ["Enchant"] = {Position = Vector3.new(1310.264404, -805.292236, -99.972527), Rotation = Vector3.new(180.000000, -1.252000, 180.000000)},
        ["Terapin"] = {Position = Vector3.new(-143.000000, 145.072601, 1909.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Crafting"] = {Position = Vector3.new(-3160.000000, -745.563965, 1684.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Roslit Bay"] = {Position = Vector3.new(-1476.000000, 133.500000, 671.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Desolate Deep"] = {Position = Vector3.new(-1656.197144, -213.779999, -2846.942383), Rotation = Vector3.new(0.000000, 56.243000, 0.000000)},
        ["Sunstone"] = {Position = Vector3.new(-933.000000, 131.816345, -1119.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Brine Pool"] = {Position = Vector3.new(-1794.000000, -142.961349, -3302.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Spike"] = {Position = Vector3.new(-1254.000000, 137.389557, 1555.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Statue of Skibidi"] = {Position = Vector3.new(73.000000, 141.929993, -1028.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Arch"] = {Position = Vector3.new(999.000000, 131.320236, -1237.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Snowcap"] = {Position = Vector3.new(2649.000000, 142.283829, 2521.000244), Rotation = Vector3.new(0.000000, -26.242001, 0.000000)},
        ["Volcano"] = {Position = Vector3.new(-1929.942017, 151.588486, 328.903198), Rotation = Vector3.new(0.000000, -3.254000, 0.000000)},
        ["Vertigo"] = {Position = Vector3.new(-110.001328, -515.299377, 1149.999268), Rotation = Vector3.new(180.000000, 2.255000, 180.000000)},
        ["Mushgrove"] = {Position = Vector3.new(2501.000000, 131.000015, -720.000000), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Fischmas 2024"] = {Position = Vector3.new(87.360214, 294.499969, -10303.833008), Rotation = Vector3.new(0.000000, 0.000000, 0.000000)},
        ["Fischmas City"] = {Position = Vector3.new(25.335495, 364.635834, -9582.040039), Rotation = Vector3.new(180.000000, 74.999001, 180.000000)}
    }

    local LocationValues = {
        {name = "moosewood", coords = Vector3.new(470, 150, 260)},
        {name = "the depths", coords = Vector3.new(853.2406616210938, -740.3659057617188, 1335.1163330078125)},
        {name = "ancient", coords = Vector3.new(5803.2783203125, 135.30149841308594, 407.7121887207031)},
        {name = "forsaken shores", coords = Vector3.new(-2675.330078125, 164.75064086914062, 1758.0570068359375)},
        {name = "enchant", coords = Vector3.new(1296, -805, -299)},
        {name = "terapin", coords = Vector3.new(-143, 145, 1909)},
        {name = "Crafting", coords = Vector3.new(-3160, -745, 1684)},
        {name = "roslit", coords = Vector3.new(-1476, 133, 671)},
        {name = "desolate Deep", coords = Vector3.new(-1655, -213, -2846)},
        {name = "sunstone Island", coords = Vector3.new(-933, 131, -1119)},
        {name = "brine pool", coords = Vector3.new(-1794, -143, -3302)},
        {name = "spike", coords = Vector3.new(-1254, 137, 1555)},
        {name = "statue of Skibidi", coords = Vector3.new(73, 141, -1028)},
        {name = "Arch", coords = Vector3.new(999, 131, -1237)},
        {name = "snowcap", coords = Vector3.new(2649, 142, 2521)},
        {name = "Volcano", coords = Vector3.new(-1908, 164, 310)},
        {name = "Vertigo", coords = Vector3.new(-110, -515, 1150)},
        {name = "mushgrove", coords = Vector3.new(2501, 131, -720)},
        {name = "Fischmas 2024", coords = Vector3.new(87.36021423339844, 294.5, -10303.8330078125)},
        }

    --Item Values
    local ItemValues = {
        {name = "Training_Rod", coords = Vector3.new(457.693848, 148.357529, 230.414307)},
        {name = "Plastic_Rod", coords = Vector3.new(454.425385, 148.169739, 229.172424)},
        {name = "Lucky_Rod", coords = Vector3.new(446.085999, 148.253006, 222.160004)},
        {name = "Kings_Rod", coords = Vector3.new(1375.57642, -810.201721, -303.509247)},
        {name = "Flimsy_Rod", coords = Vector3.new(471.107697, 148.36171, 229.642441)},
        {name = "Nocturnal_Rod", coords = Vector3.new(-141.874237, -515.313538, 1139.04529)},
        {name = "Fast_Rod", coords = Vector3.new(447.183563, 148.225739, 220.187454)},
        {name = "Carbon_Rod", coords = Vector3.new(454.083618, 150.590073, 225.328827)},
        {name = "Long_Rod", coords = Vector3.new(485.695038, 171.656326, 145.746109)},
        {name = "Mythical_Rod", coords = Vector3.new(389.716705, 132.588821, 314.042847)},
        {name = "Midas_Rod", coords = Vector3.new(401.981659, 133.258316, 326.325745)},
        {name = "Trident_Rod", coords = Vector3.new(-1484.34192, -222.325562, -2194.77002)},
        {name = "Enchated_Altar", coords = Vector3.new(1310.54651, -799.469604, -82.7303467)},
        {name = "Bait_Crate", coords = Vector3.new(384.575134, 135.351928, 337.534027)},
        {name = "Quality_Bait_Crate", coords = Vector3.new(-177.876, 144.472, 1932.844)},
        {name = "Crab_Cage", coords = Vector3.new(474.803589, 149.664566, 229.49469)},
        {name = "GPS", coords = Vector3.new(517.896729, 149.217636, 284.856842)},
        {name = "Basic_Diving_Gear", coords = Vector3.new(369.174774, 132.508835, 248.705368)},
        {name = "Fish_Radar", coords = Vector3.new(365.75177, 134.50499, 274.105804)},
        }

    --NPC Values
    local NPCValues = {
    {name = "Witch", coords = Vector3.new(409.638092, 134.451523, 311.403687)},
    {name = "Quiet_Synph", coords = Vector3.new(566.263245, 152.000031, 353.872101)},
    {name = "Pierre", coords = Vector3.new(391.38855, 135.348389, 196.712387)},
    {name = "Phineas", coords = Vector3.new(469.912292, 150.69342, 277.954987)},
    {name = "Paul", coords = Vector3.new(381.741882, 136.500031, 341.891022)},
    {name = "Shipwright", coords = Vector3.new(357.972595, 133.615967, 258.154541)},
    {name = "Angler", coords = Vector3.new(480.102478, 150.501053, 302.226898)},
    {name = "Marc", coords = Vector3.new(466.160034, 151.00206, 224.497086)},
    {name = "Lucas", coords = Vector3.new(449.33963, 181.999893, 180.689072)},
    {name = "Latern_Keeper", coords = Vector3.new(-39.0456772, -246.599976, 195.644363)},
    {name = "Latern_Keeper2", coords = Vector3.new(-17.4230175, -304.970276, -14.529892)},
    {name = "Inn_Keeper", coords = Vector3.new(487.458466, 150.800034, 231.498932)},
    {name = "Roslit_Keeper", coords = Vector3.new(-1512.37891, 134.500031, 631.24353)},
    {name = "FishingNpc_1", coords = Vector3.new(-1429.04138, 134.371552, 686.034424)},
    {name = "FishingNpc_2", coords = Vector3.new(-1778.55408, 149.791779, 648.097107)},
    {name = "FishingNpc_3", coords = Vector3.new(-1778.26807, 147.83165, 653.258606)},
    {name = "Henry", coords = Vector3.new(483.539307, 152.383057, 236.296143)},
    {name = "Daisy", coords = Vector3.new(581.550049, 165.490753, 213.499969)},
    {name = "Appraiser", coords = Vector3.new(453.182373, 150.500031, 206.908783)},
    {name = "Merchant", coords = Vector3.new(416.690521, 130.302628, 342.765289)},
    {name = "Mod_Keeper", coords = Vector3.new(-39.0905838, -245.141144, 195.837891)},
    {name = "Ashe", coords = Vector3.new(-1709.94055, 149.862411, 729.399536)},
    {name = "Alfredrickus", coords = Vector3.new(-1520.60632, 142.923264, 764.522034)},
    }

    local totemvalues = {
        {name = "Aurora", coords = Vector3.new(-1811, -136, -3282)},
        {name = "Smokescreen", coords = Vector3.new(2789, 139, -625)},
        {name = "Windset", coords = Vector3.new(2849, 178, 2702)},
        {name = "Tempest", coords = Vector3.new(35, 132, 1943)},
        {name = "Sundial", coords = Vector3.new(-1148, 134, -1075)},
        {name = "Eclipse", coords = Vector3.new(5968, 273, 838)},
        {name = "Meteor", coords = Vector3.new(-1948, 275, 230)},
    }
    local MerchantValues = {
        {name = "moosewood", coords = Vector3.new(470, 150, 260), remotePath = "Marc Merchant"},
        {name = "the depths", coords = Vector3.new(853.2406616210938, -740.3659057617188, 1335.1163330078125), remotePath = "Milo Merchant"},
        {name = "ancient", coords = Vector3.new(5803.2783203125, 135.30149841308594, 407.7121887207031), remotePath = "Mann Merchant"},
        {name = "forsaken shores", coords = Vector3.new(-2675.330078125, 164.75064086914062, 1758.0570068359375), remotePath = "Marytn Merchant"},
        {name = "roslit", coords = Vector3.new(-1476, 133, 671), remotePath = "Matt Merchant"},
        {name = "desolate Deep", coords = Vector3.new(-1655, -213, -2846), remotePath = "Mel Merchant"},
        {name = "sunstone Island", coords = Vector3.new(-933, 131, -1119), remotePath = "Max Merchant"},
        {name = "snowcap", coords = Vector3.new(2649, 142, 2521), remotePath = "Mike Merchant"},
    }
-- // // // Variables // // // --
    local CastMode = "Blatant"
    local ShakeMode = "Navigation"
    local ReelMode = "Blatant"
    local CollectMode = "Teleports"
    local teleportSpots = {}
    local FreezeChar = false
    local DayOnlyLoop = nil
    local BypassGpsLoop = nil
    local Noclip = false
    local RunCount = false
    local WebhookLog = false
    local espEnabled = false
-- // // // Tabs // // // --
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "house" }),
        Teleport = Window:AddTab({ Title = "Teleport", Icon = "backpack" }),
        Items = Window:AddTab({ Title = "Items", Icon = "backpack" }),
        Player = Window:AddTab({ Title = "Player", Icon = "person-standing" }),
        Auto = Window:AddTab({ Title = "Automatically", Icon = "computer" }),
        Misc = Window:AddTab({ Title = "Misc", Icon = "circle-ellipsis" }),
        Webhook = Window:AddTab({ Title = "Webhook", Icon = "database" }),
        Executor = Window:AddTab({ Title = "Executor", Icon = "scroll-text" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
        Info = Window:AddTab({ Title = "Info", Icon = "info" }),
        }

    local Options = Fluent.Options

-- // // // FUNCTIONS // // // --

function AntiAfk2()
    task.spawn(function()
        while AntiAfk do
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(false)
            task.wait(0.01)
        end
    end)

    -- Spawn another thread to press the "L" key every 5 minutes
function AntiAfk3()
    task.spawn(function()
        while AntiAfk do
            local VirtualInputManager = game:GetService("VirtualInputManager")
            VirtualInputManager:SendKeyEvent(true, "L", false, nil) -- Press "L"
            task.wait(0.1) -- Short delay to simulate key press
            VirtualInputManager:SendKeyEvent(false, "L", false, nil) -- Release "L"
            task.wait(300) -- Wait 5 minutes (300 seconds)
        end
    end)
end
end
AntiAfk2()
antiAfk3()


-- // // // Noclip // // // --
    NoclipConnection = RunService.Stepped:Connect(function()
        if Noclip == true then
            if LocalCharacter ~= nil then
                for i, v in pairs(LocalCharacter:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
            end
        end
    end)
    function rememberPosition()
        spawn(function()
            local initialCFrame = HumanoidRootPart.CFrame

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Parent = HumanoidRootPart

            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.D = 100
            bodyGyro.P = 10000
            bodyGyro.CFrame = initialCFrame
            bodyGyro.Parent = HumanoidRootPart

            while AutoFreeze do
                HumanoidRootPart.CFrame = initialCFrame
                task.wait(0.01)
            end
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
            if bodyGyro then
                bodyGyro:Destroy()
            end
        end)
    end
-- // // // Sell items // // // --
    -- all merchents
    --moosewood workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --depths workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Milo Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --ancient workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mann Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --forsaken workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marytn Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --roslit workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Matt Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --desolate workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mel Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --sunstone workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Max Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    --snowcap workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mike Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()


    function SellHand()
            local currentPosition = HumanoidRootPart.CFrame
            local sellPosition = CFrame.new(464, 151, 232)
            local wasAutoFreezeActive = false
            if AutoFreeze then
                wasAutoFreezeActive = true
                AutoFreeze = false
            end
            HumanoidRootPart.CFrame = sellPosition
            task.wait(0.5)
            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell"):InvokeServer()
            task.wait(1)
            HumanoidRootPart.CFrame = currentPosition
            if wasAutoFreezeActive then
                AutoFreeze = true
                rememberPosition()
            end
        end
    -- Function to calculate the distance between two Vector3 points
    local function getDistance(pos1, pos2)
        return (pos1 - pos2).Magnitude
    end

    function SellAll()
        -- Ensure LocalPlayer and HumanoidRootPart exist
        local player = game.Players.LocalPlayer
        if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            warn("LocalPlayer or HumanoidRootPart not found!")
            return
        end
        -- gotta add setup function that teleports and interacts with all merchants

        local humanoidRootPart = player.Character.HumanoidRootPart
        local currentPosition = humanoidRootPart.Position

        print("Current Position: " .. tostring(currentPosition))  -- Debugging step

        -- Find the nearest location
        local nearestLocation = nil
        local shortestDistance = math.huge
        print("Looking for nearest location...")  -- Debugging step

        for _, location in ipairs(MerchantValues) do
            local distance = getDistance(currentPosition, location.coords)
            print("Checking location: " .. location.name .. " at distance: " .. distance)  -- Debugging step
            if distance < shortestDistance then
                shortestDistance = distance
                nearestLocation = location
            end
        end

        if nearestLocation then
            print("Nearest location found: " .. nearestLocation.name)  -- Debugging step

            -- Fire the corresponding RemoteEvent for the nearest location
            local world = workspace:WaitForChild("world")
            local npcs = world:WaitForChild("npcs")
            print("Searching for NPCs in world...")  -- Debugging step
            local merchant = npcs:FindFirstChild(nearestLocation.remotePath)

            if merchant then
                print("Merchant found: " .. nearestLocation.remotePath)  -- Debugging step
                local sellAllEvent = merchant:FindFirstChild("merchant"):FindFirstChild("sellall")
                if sellAllEvent and sellAllEvent.InvokeServer then
                    print("Invoking sellAll event...")  -- Debugging step
                    sellAllEvent:InvokeServer()
                    print("Sold items at nearest location: " .. nearestLocation.name)
                else
                    warn("sellall event not found or invalid at: " .. nearestLocation.name)
                end
            else
                warn("Merchant NPC not found for: " .. nearestLocation.name)
            end
        else
            warn("No nearest location found!")
        end
    end


-- // // // Main Tab // // // --

    local section = Tabs.Main:AddSection("Main")
    local FreezeCharacter = Tabs.Main:AddToggle("FreezeCharacter", {Title = "Freeze Character", Default = false })
    FreezeCharacter:OnChanged(function()
        local oldpos = HumanoidRootPart.CFrame
        FreezeChar = Options.FreezeCharacter.Value
        task.wait()
        while WaitForSomeone(RenderStepped) do
            if FreezeChar and HumanoidRootPart ~= nil then
                task.wait()
                HumanoidRootPart.CFrame = oldpos
            else
                break
            end
        end
    end)
-- // // //  Sell Tab  // // // --
    local section = Tabs.Items:AddSection("Sell Items")
    Tabs.Items:AddButton({
        Title = "Sell Hand",
        Description = "",
        Callback = function()
            SellHand()
        end
    })
    Tabs.Items:AddButton({
        Title = "Sell All",
        Description = "",
        Callback = function()
            SellAll()
        end
    })
    -- Add a table to keep track of whether the player has visited a merchant or not
    local visitedMerchants = {}

    local section = Tabs.Auto:AddSection("Sell")
    local Slider = Tabs.Auto:AddSlider("AutoSellDelay", {
        Title = "Auto Sell Delay",
        Description = "Set the delay inbetween each time selling",
        Default = 120,
        Min = 1,
        Max = 600,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })


    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)


    Slider:SetValue(120)

    local Toggle = Tabs.Auto:AddToggle("Autoselltoggle", {Title = "Auto Sell", Default = false})


    local function triggerSellAllAfterDelay(delay)
        Fluent:Notify({
            Title = "SellAll",
            Content = "For this to work, go to your nearest merchant and sell everything 1 time after that it will work until you rejoin.",
            Duration = 10
        })
        while Toggle.Value do  -- While the toggle is ON
            print("Waiting for", delay, "seconds...")
            wait(delay)  -- Wait for the specified delay time
            print("Triggering SellAll()...")
            SellAll()  -- This will call the SellAll function
        end
    end


    Toggle:OnChanged(function()
        print("Toggle changed:", Toggle.Value)
        if Toggle.Value then
            print("Toggle is ON. Starting to trigger SellAll repeatedly with delay.")
            local delay = Slider.Value  -- Get the slider value
            print("Slider value (delay):", delay)
            triggerSellAllAfterDelay(delay)  -- Start triggering SellAll repeatedly after the delay
        else
            print("Toggle is OFF. Stopping SellAll triggers.")
        end
    end)


    Toggle:SetValue(false)

    -- Function to teleport player to nearest merchant and track first-time visits
    local function teleportToMerchantAndSell(player)
        local nearestMerchant = nil
        local nearestDistance = math.huge

        -- Find the nearest merchant
        for _, merchant in ipairs(MerchantValues) do
            local distance = (player.Character.HumanoidRootPart.Position - merchant.coords).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestMerchant = merchant
            end
        end

        if nearestMerchant then
            -- Check if the player has already visited this merchant
            if not visitedMerchants[nearestMerchant.name] then
                -- Store the original position before teleporting to the merchant
                local originalPosition = player.Character.HumanoidRootPart.Position

                -- First-time visit, teleport to the merchant
                print("Teleporting to", nearestMerchant.name)
                local rootPart = player.Character.HumanoidRootPart
                local merchantLocation = nearestMerchant.coords
                rootPart.CFrame = CFrame.new(merchantLocation)
                task.wait(0.5)

                -- Log that the player has visited this merchant
                visitedMerchants[nearestMerchant.name] = true

                -- Interact with the merchant's SellAll
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild(nearestMerchant.remotePath):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()

                -- Wait for a few seconds to simulate selling
                task.wait(3)

                -- Teleport back to the original position (you can customize the position as needed)
                rootPart.CFrame = CFrame.new(originalPosition)
                print("Teleported back to original position")
            else
                print("Player has already visited", nearestMerchant.name, "before. Skipping teleportation.")
            end
        end
    end

    -- You can call teleportToMerchantAndSell(player) when needed.
    -- Example:
    -- teleportToMerchantAndSell(game.Players.LocalPlayer)
-- // // // Treasure Tab // // // --
    local section = Tabs.Items:AddSection("Treasure")
    Tabs.Items:AddButton({
        Title = "Teleport to Jack Marrow",
        Callback = function()
            HumanoidRootPart.CFrame = CFrame.new(-2824.359, 214.311, 1518.130)
        end
    })
    Tabs.Items:AddButton({
        Title = "Repair Map",
        Callback = function()
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "Treasure Map" then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
                end
            end
        end
    })
    Tabs.Items:AddButton({
        Title = "Collect Treasure",
        Callback = function()
            for i, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    v.HoldDuration = 0
                end
            end
            for i, v in pairs(workspace.world.chests:GetDescendants()) do
                if v:IsA("Part") and v:FindFirstChild("ChestSetup") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait(0.5)
                    for _, v in pairs(workspace.world.chests:GetDescendants()) do
                        if v.Name == "ProximityPrompt" then
                            fireproximityprompt(v)
                        end
                    end
                    task.wait(1)
                end
            end
        end
    })
-- // // // Player Tab // // // --
    local section = Tabs.Player:AddSection("Character")
    local Slider = Tabs.Player:AddSlider("Slider", {
        Title = "WalkSpeed Slider",
        Description = "Adjust your character's walk speed",
        Default = 16, -- Default Roblox WalkSpeed
        Min = 0,
        Max = 250,
        Rounding = 1,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass("Humanoid")

            -- Ensure that humanoid is found and set the initial WalkSpeed
            if humanoid then
                humanoid.WalkSpeed = Value
                print("WalkSpeed changed to:", Value)
            end
        end
    })

    -- Continuously monitor and update WalkSpeed if it's changed elsewhere
    local function monitorWalkSpeed()
        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        -- Monitor and update WalkSpeed periodically
        game:GetService("RunService").Heartbeat:Connect(function()
            if humanoid and humanoid.WalkSpeed ~= Slider.Value then
                humanoid.WalkSpeed = Slider.Value
            end
        end)
    end

    -- Call the function to start monitoring
    monitorWalkSpeed()





    Slider:SetValue(16) -- Sets the initial WalkSpeed
    -- infinite jump
    local InfiniteJumpToggle = Tabs.Player:AddToggle("InfiniteJump", {Title = "Enable Infinite Jump", Default = false})

    InfiniteJumpToggle:OnChanged(function()
        local isEnabled = InfiniteJumpToggle.Value
        if isEnabled then
            -- Enable infinite jump
            local UserInputService = game:GetService("UserInputService")
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            -- Define the infinite jump function
            _G.InfiniteJumpEnabled = true
            UserInputService.JumpRequest:Connect(function()
                if _G.InfiniteJumpEnabled then
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
            print("Infinite jump enabled.")
        else
            -- Disable infinite jump
            _G.InfiniteJumpEnabled = false
            print("Infinite jump disabled.")
        end
    end)

    InfiniteJumpToggle:SetValue(false)
    -- walk on water
    local WalkOnWater = Tabs.Player:AddToggle("WalkOnWater", {Title = "Walk On Water", Default = false })
    WalkOnWater:OnChanged(function()
        for i,v in pairs(workspace.zones.fishing:GetChildren()) do
            if v.Name == WalkZone then
                v.CanCollide = Options.WalkOnWater.Value
                if v.Name == "Ocean" then
                    for i,v in pairs(workspace.zones.fishing:GetChildren()) do
                        if v.Name == "Deep Ocean" then
                            v.CanCollide = Options.WalkOnWater.Value
                        end
                    end
                end
            end
        end
    end)
    local WalkOnWaterZone = Tabs.Player:AddDropdown("WalkOnWaterZone", {
        Title = "Walk On Water Zone",
        Values = {"Ocean", "Desolate Deep", "The Depths"},
        Multi = false,
        Default = "Ocean",
    })

    local IdentityHiderUI = Tabs.Player:AddToggle("IdentityHiderUI", {Title = "Protect Identity", Default = false })   
    IdentityHiderUI:OnChanged(function()
        while Options.IdentityHiderUI.Value == true do
            if UserPlayer:FindFirstChild("streak") then UserPlayer.streak.Text = "inf" end
            if UserPlayer:FindFirstChild("level") then UserPlayer.level.Text = "Level: inf" end
            if UserPlayer:FindFirstChild("level") then UserPlayer.user.Text = "Admin" end
            local hud = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("hud"):WaitForChild("safezone")
            if hud:FindFirstChild("coins") then hud.coins.Text = "inf$" end
            if hud:FindFirstChild("lvl") then hud.lvl.Text = "Inf LVL" end
            task.wait(0.01)
        end
    end)
    WalkOnWaterZone:OnChanged(function(Value)
        WalkZone = Value
    end)
    local ToggleNoclip = Tabs.Player:AddToggle("ToggleNoclip", {Title = "Noclip", Default = false })
    ToggleNoclip:OnChanged(function()
        Noclip = Options.ToggleNoclip.Value
    end)

-- // // // Misc Tab // // // --
    local section = Tabs.Misc:AddSection("Bypass")

        local BypassRadar = Tabs.Misc:AddToggle("BypassRadar", {Title = "Bypass Fish Radar", Default = true })
        BypassRadar:OnChanged(function()
            for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
                if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
                    v.Enabled = Options.BypassRadar.Value
                end
            end
        end)
    -- Define PlayerGui
    local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Example GetPosition function
    local function GetPosition()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            return character.PrimaryPart.Position
        end
        return Vector3.new(0, 0, 0)
    end

    -- Example ExportValue function
    local function ExportValue(value)
        return string.format("%.2f", value)
    end

    -- Add toggle functionality
    local BypassGPS = Tabs.Misc:AddToggle("BypassGPS", {Title = "Bypass GPS", Default = false})
    local BypassGpsLoop -- Declare the loop variable
    local previousValue = Options.BypassGPS.Value -- Track previous toggle value

    -- Function to handle enabling/disabling
    local function HandleToggle(value)
        if value then
            -- Clone the GPS object
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local GPSPath = ReplicatedStorage:WaitForChild("resources"):WaitForChild("items"):WaitForChild("items"):WaitForChild("GPS"):WaitForChild("GPS").gpsMain:WaitForChild("xyz")
            local XyzClone = GPSPath:Clone()
            print("GPS object cloned successfully.")

            -- Attach to HUD
            local Backpack = PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
            XyzClone.Parent = Backpack

            -- Update position
            local function UpdatePosition()
                local Pos = GetPosition()
                local StringInput = string.format("%s, %s, %s", ExportValue(Pos.X), ExportValue(Pos.Y), ExportValue(Pos.Z))
                XyzClone.Text = "<font color='#ff4949'>X</font><font color='#a3ff81'>Y</font><font color='#626aff'>Z</font>: " .. StringInput
            end

            -- Initial update
            UpdatePosition()

            -- Continuous updates
            BypassGpsLoop = game:GetService("RunService").Heartbeat:Connect(UpdatePosition)
        else
            -- Remove GPS clone
            local Backpack = PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
            local ExistingXyz = Backpack:FindFirstChild("xyz")
            if ExistingXyz then
                ExistingXyz:Destroy()
            end

            -- Disconnect loop
            if BypassGpsLoop then
                BypassGpsLoop:Disconnect()
                BypassGpsLoop = nil
            end
        end
    end

    -- Manual value change detection
    game:GetService("RunService").RenderStepped:Connect(function()
        local currentValue = Options.BypassGPS.Value
        if currentValue ~= previousValue then
            previousValue = currentValue
            HandleToggle(currentValue)
        end
    end)

    -- // Visual // --
    local section = Tabs.Misc:AddSection("Visual")
    local Players = game:GetService("Players") -- Get the Players service
    local player = Players.LocalPlayer -- Define the local player

    local Toggle = Tabs.Misc:AddToggle("Zoom", {Title = "Infinite Zoom", Default = false})

    Toggle:OnChanged(function()
        local isToggled = Toggle.Value -- Correct reference to the toggle's state
        if isToggled then
            -- Set CameraMaxZoomDistance to 15000
            player.CameraMaxZoomDistance = 15000
            print("CameraMaxZoomDistance set to 15000")
        else
            -- Reset CameraMaxZoomDistance to default (you can adjust this value if needed)
            player.CameraMaxZoomDistance = 128 -- Default Roblox max zoom distance
            print("CameraMaxZoomDistance reset to default (128)")
        end
    end)

    Toggle:SetValue(false)
    -- // ESP // --
    local section = Tabs.Misc:AddSection("ESP")
    local Toggle = Tabs.Misc:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    local espEnabled = Toggle.Value  -- Initial state based on the toggle

    -- Function to create or remove ESP dynamically
    local function updateESP()
        if espEnabled then
            -- Create ESP for all locations when the toggle is enabled
            for name, data in pairs(locations) do
                createBillboardGui(name, data.Position, data.Rotation)
            end
        else
            -- Remove all existing ESPs when the toggle is disabled
            for _, part in pairs(workspace:GetChildren()) do
                if part:IsA("Part") and part.Name ~= "Baseplate" then
                    part:Destroy()  -- Destroy all ESP parts
                end
            end
        end
    end

    Toggle:OnChanged(function()
        espEnabled = Toggle.Value  -- Update the espEnabled state based on the toggle
        print("Toggle changed:", espEnabled)

        updateESP()  -- Update the ESP based on the new toggle state
    end)

    -- Initial call to enable ESP at the start if espEnabled is true
    if espEnabled then
        updateESP()
    end





    --remove fog
    local RemoveFog = Tabs.Misc:AddToggle("RemoveFog", {Title = "Remove Fog", Default = false })
    RemoveFog:OnChanged(function()
        if Options.RemoveFog.Value == true then
            if game:GetService("Lighting"):FindFirstChild("Sky") then
                game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
            end
        else
            if game:GetService("Lighting").bloom:FindFirstChild("Sky") then
                game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
            end
        end
    end)
    -- day only
    local DayOnly = Tabs.Misc:AddToggle("DayOnly", {Title = "Day Only", Default = false })
    DayOnly:OnChanged(function()
        if Options.DayOnly.Value == true then
            DayOnlyLoop = RunService.Heartbeat:Connect(function()
                                game:GetService("Lighting").TimeOfDay = "12:00:00"
                        end)
                else
                        if DayOnlyLoop then
                                DayOnlyLoop:Disconnect()
                                DayOnlyLoop = nil
                        end
        end
    end)
    Options.MyToggle:SetValue(false)
    -- // Gameplay // --
    local section = Tabs.Misc:AddSection("Gameplay")
    -- instant interact
    local HoldDuration = Tabs.Misc:AddToggle("HoldDuration", {Title = "Hold Duration 0 sec", Default = false })
    HoldDuration:OnChanged(function()
        if Options.HoldDuration.Value == true then
            for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    v.HoldDuration = 0
                end
            end
        end
    end)

    -- Use spawn to run the reset code in the background
    spawn(function()
        while true do
            wait(60)  -- wait for 60 seconds (1 minute)
            if Options.HoldDuration.Value == true then
                for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.ClassName == "ProximityPrompt" then
                        v.HoldDuration = 0
                    end
                end
            end
        end
    end)

    --disable oxygen
    local DisableOxygen = Tabs.Misc:AddToggle("DisableOxygen", {Title = "Disable Oxygen", Default = true })
    DisableOxygen:OnChanged(function()
        LocalPlayer.Character.client.oxygen.Disabled = Options.DisableOxygen.Value
    end)
    -- copy coordinates
    Tabs.Misc:AddButton({
        Title = "Copy XYZ",
        Description = "Copy Clipboard",
        Callback = function()
    -- Script to get LocalPlayer's position and rotation and copy it to the clipboard
    -- Ensure you have the proper permissions to use setclipboard (e.g., in a local plugin or certain executors)

    -- Services
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    if not LocalPlayer then
        warn("LocalPlayer not found.")
        return
    end

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Function to copy data to clipboard
    local function setClipboard(data)
        if setclipboard then
            setclipboard(data)
            print("Data copied to clipboard:", data)
        else
            warn("setclipboard function is not available.")
        end
    end

    -- Get position and rotation
    local position = humanoidRootPart.Position
    local rotation = humanoidRootPart.Rotation

    -- Format data as a single-line table
    local dataTable = string.format("{Position = Vector3.new(%f, %f, %f), Rotation = Vector3.new(%f, %f, %f)}", position.X, position.Y, position.Z, rotation.X, rotation.Y, rotation.Z)

    -- Copy to clipboard
    setClipboard(dataTable)

            end
        })


-- // // // Teleport // // //  --

    local locationNames = {}
    for _, location in ipairs(LocationValues) do
        table.insert(locationNames, location.name)
    end
    local ItemNames = {}
    for _, item in ipairs(ItemValues) do
        table.insert(ItemNames, item.name)
    end
    local TotemNames = {}
    for _, npc in ipairs(totemvalues) do
        table.insert(TotemNames, totem.name)
    end
    local NPCNames = {}
    for _, npc in ipairs(NPCValues) do
        table.insert(NPCNames, npc.name)
    end
        -- /// /// Locations /// /// --
        local section = Tabs.Teleport:AddSection("Locations")
        -- Create the dropdown menu
        local Dropdown = Tabs.Teleport:AddDropdown("LocationDropdown", {
            Title = "Select a Location",
            Values = locationNames,
            Multi = false,
            Default = 1,
        })

        -- Add the teleport button
        Tabs.Teleport:AddButton({
            Title = "Teleport",
            Description = "Teleport to the selected location",
            Callback = function()
                -- Get the selected location name
                local selectedLocationName = Dropdown.Value
                if selectedLocationName then
                    -- Find the location in LocationValues by name
                    local selectedLocation
                    for _, location in ipairs(LocationValues) do
                        if location.name == selectedLocationName then
                            selectedLocation = location
                            break
                        end
                    end

                    -- If a valid location was found
                    if selectedLocation and game.Players.LocalPlayer.Character then
                        local character = game.Players.LocalPlayer.Character
                        if character:FindFirstChild("HumanoidRootPart") then
                            -- Teleport the player to the selected location's coordinates
                            character.HumanoidRootPart.CFrame = CFrame.new(selectedLocation.coords)
                        else
                            warn("HumanoidRootPart not found in the character")
                        end
                    else
                        warn("Location not found or player character missing")
                    end
                else
                    warn("No location selected")
                end
            end,
        })
        --/// /// ITEMS /// /// --
        local section = Tabs.Teleport:AddSection("Items")
        -- Create the dropdown menu
        local Dropdown = Tabs.Teleport:AddDropdown("ItemDropdown", {
            Title = "Select an Item",
            Values = ItemNames,
            Multi = false,
            Default = 1,
        })

        -- Add the teleport button
        Tabs.Teleport:AddButton({
            Title = "Teleport",
            Description = "Teleport to the selected Item",
            Callback = function()
                -- Get the selected location name
                local selectedItemName = Dropdown.Value
                if selectedItemName then
                    -- Find the location in LocationValues by name
                    local selectedItem
                    for _, location in ipairs(ItemValues) do
                        if location.name == selectedItemName then
                            selectedItem = location
                            break
                        end
                    end

                    -- If a valid location was found
                    if selectedItem and game.Players.LocalPlayer.Character then
                        local character = game.Players.LocalPlayer.Character
                        if character:FindFirstChild("HumanoidRootPart") then
                            -- Teleport the player to the selected location's coordinates
                            character.HumanoidRootPart.CFrame = CFrame.new(selectedItem.coords)
                        else
                            warn("HumanoidRootPart not found in the character")
                        end
                    else
                        warn("Location not found or player character missing")
                    end
                else
                    warn("No location selected")
                end
            end,
        })
        --/// /// Totems /// /// --
        local section = Tabs.Teleport:AddSection("Totems")
        -- Create the dropdown menu
        local Dropdown = Tabs.Teleport:AddDropdown("TotemDropdown", {
            Title = "Select a Totem",
            Values = TotemNames,
            Multi = false,
            Default = 1,
        })

        -- Add the teleport button
        Tabs.Teleport:AddButton({
            Title = "Teleport",
            Description = "Teleport to the selected Totem",
            Callback = function()
                -- Get the selected location name
                local selectedTotemName = Dropdown.Value
                if selectedTotemName then
                    -- Find the location in LocationValues by name
                    local selectedTotem
                    for _, location in ipairs(totemvalues) do
                        if location.name == selectedTotemName then
                            selectedTotem = totem
                            break
                        end
                    end

                    -- If a valid location was found
                    if selectedTotem and game.Players.LocalPlayer.Character then
                        local character = game.Players.LocalPlayer.Character
                        if character:FindFirstChild("HumanoidRootPart") then
                            -- Teleport the player to the selected location's coordinates
                            character.HumanoidRootPart.CFrame = CFrame.new(selectedLocation.coords)
                        else
                            warn("HumanoidRootPart not found in the character")
                        end
                    else
                        warn("Location not found or player character missing")
                    end
                else
                    warn("No Totem selected")
                end
            end,
        })

        --/// /// NPCS /// /// --
        local section = Tabs.Teleport:AddSection("NPCs")
        -- Create the dropdown menu
        local Dropdown = Tabs.Teleport:AddDropdown("NpcDropdown", {
            Title = "Select a NPC",
            Values = NPCNames,
            Multi = false,
            Default = 1,
        })

        -- Add the teleport button
        Tabs.Teleport:AddButton({
            Title = "Teleport",
            Description = "Teleport to the selected NPC",
            Callback = function()
                -- Get the selected location name
                local selectednpcName = Dropdown.Value
                if selectednpcName then
                    -- Find the location in LocationValues by name
                    local selectednpc
                    for _, location in ipairs(NpcValues) do
                        if location.name == selectednpcName then
                            selectednpc = location
                            break
                        end
                    end

                    -- If a valid location was found
                    if selectednpc and game.Players.LocalPlayer.Character then
                        local character = game.Players.LocalPlayer.Character
                        if character:FindFirstChild("HumanoidRootPart") then
                            -- Teleport the player to the selected location's coordinates
                            character.HumanoidRootPart.CFrame = CFrame.new(selectednpc.coords)
                        else
                            warn("HumanoidRootPart not found in the character")
                        end
                    else
                        warn("Location not found or player character missing")
                    end
                else
                    warn("No location selected")
                end
            end,
        })
        local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
        local player = Players.LocalPlayer

        -- Function to update the dropdown values with the list of all players
        local function UpdatePlayerListDropdown(dropdown)
            local playerNames = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player then -- Exclude the local player
                    table.insert(playerNames, p.Name)
                end
            end
            dropdown:SetValues(playerNames)
            end
        local section = Tabs.Teleport:AddSection("Player")
        local PlayerDropdown = Tabs.Teleport:AddDropdown("PlayerDropdown", {
            Title = "Select Player",
            Values = {}, -- Initially empty
            Multi = false,
            Default = nil,
            })

            -- Populate the dropdown with the current player list
            UpdatePlayerListDropdown(PlayerDropdown)

            -- Update the dropdown whenever a player joins or leaves
            Players.PlayerAdded:Connect(function()
            UpdatePlayerListDropdown(PlayerDropdown)
            end)
            Players.PlayerRemoving:Connect(function()
            UpdatePlayerListDropdown(PlayerDropdown)
            end)

            local Players = game:GetService("Players")

            -- Function to update the player's last known position
            local function updateLastKnownPosition(player)
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local position = character.HumanoidRootPart.Position
                    -- Store the position as an attribute (you can also use a DataStore if needed)
                    player:SetAttribute("LastKnownPosition", position)
                    print("Last known position updated for", player.Name, position)
                end
            end

            -- Update the last known position when the player moves or at certain intervals
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    -- Make sure to update last known position when the character respawns
                    character:WaitForChild("HumanoidRootPart")
                    updateLastKnownPosition(player)
                end)

                -- Monitor character's humanoid for movement or disconnect
                local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.Running:Connect(function(speed)
                        if speed > 0 then
                            -- Update position when the player moves
                            updateLastKnownPosition(player)
                        end
                    end)
                end
            end)

            -- Initial update for existing players
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer then
                    if player.Character then
                        updateLastKnownPosition(player)
                    end
                    player.CharacterAdded:Connect(function(character)
                        character:WaitForChild("HumanoidRootPart")
                        updateLastKnownPosition(player)
                    end)
                end
            end

            -- Function for teleporting to another player's last known position
            Tabs.Teleport:AddButton({
                Title = "Teleport to Player",
                Description = "Teleport to the selected player, even if they are not rendered.",
                Callback = function()
                    local selectedPlayerName = PlayerDropdown.Value
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer then
                            -- Attempt to get the position from the player's character
                            local targetPosition
                            if targetPlayer.Character then
                                -- If the character exists, we use the HumanoidRootPart position
                                local humanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if humanoidRootPart then
                                    targetPosition = humanoidRootPart.Position
                                end
                            end

                            -- If no valid character position found, fall back to last known position
                            if not targetPosition then
                                targetPosition = targetPlayer:GetAttribute("LastKnownPosition")  -- Retrieve the last known position
                            end

                            if targetPosition then
                                local character = player.Character or player.CharacterAdded:Wait()
                                if character and character:FindFirstChild("HumanoidRootPart") then
                                    -- Teleport the player to the target position
                                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                                    print("Teleported to", selectedPlayerName)
                                else
                                    print("Could not find your character's HumanoidRootPart!")
                                end
                            else
                                print("Could not find target player's position!")
                            end
                        else
                            print("Target player not found or does not have a valid character!")
                        end
                    else
                        print("No player selected!")
                    end
                end
            })

            local section = Tabs.Teleport:AddSection("Server")

-- // // // Premium Autofish // // //   --
        -- auto sell rariies, freeze position and make more reliable when fishing
        -- Declare toggle state and location variables

        local Locations = {
            EXP = {Position = Vector3.new(-2675.331055, 164.795013, 1758.057129), Rotation = Vector3.new(0, 75.243, 0)},
            Money = {Position = Vector3.new(890.312195, -737.915710, 1123.411865), Rotation = Vector3.new(0.000000, -1.344000, 0.000000)},
            Event = {Position = Vector3.new(87.360214, 294.499969, -10303.833008), Rotation = Vector3.new(0, 0, 0)},
            Ancient = {Position = Vector3.new(5805.021484, 135.301498, 405.922119), Rotation = Vector3.new(0, -42.669, 0)},
            None = nil
        }

        local section = Tabs.Auto:AddSection("Farm")

        local autofishEnabled = false
        local selectedLocation = "EXP" -- Default teleport location

        -- Dropdown with teleport locations
        local Dropdown = Tabs.Auto:AddDropdown("Dropdown", {
            Title = "Teleport Location",
            Values = {"EXP", "Money", "Event", "Ancient", "None"},
            Multi = false,
            Default = "EXP",
        })

        Dropdown:OnChanged(function(newValue)
            selectedLocation = newValue
        end)

        -- Location data
    -- Autofarm toggle
    local ToggleAutofarm = Tabs.Auto:AddToggle("ToggleAutoFarm", {Title = "Fish Autofarm", Default = false})

    ToggleAutofarm:OnChanged(function(newState)
        autofishEnabled = newState -- Update state dynamically
        local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value

        if autofishEnabled then
            -- Teleport to the selected location (both Position and Rotation)
            if Locations[selectedLocation] then
                local location = Locations[selectedLocation]
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location.Position) * CFrame.Angles(math.rad(location.Rotation.X), math.rad(location.Rotation.Y), math.rad(location.Rotation.Z))
            end

            -- Start the autofishing loop in a coroutine
            coroutine.wrap(function()
                local XyzClone
                while autofishEnabled and task.wait(0.1) do
                    -- Equip the fishing rod
                    if Backpack:FindFirstChild(RodName) then
                        LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
                    end

                    if LocalPlayer.Character:FindFirstChild(RodName) and LocalPlayer.Character:FindFirstChild(RodName):FindFirstChild("bobber") then
                        -- Ensure only one XyzClone exists
                        if not XyzClone then
                            XyzClone = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
                            XyzClone.Parent = PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
                            XyzClone.Name = "Lure"
                        end

                        XyzClone.Text = "<font color='#ff4949'>Lure </font>: 0%"
                        local lureChanged = false
                        local lureValue = LocalPlayer.Character:FindFirstChild(RodName).values.lure.Value

                        -- Check if lure value changes within 30 seconds
                        coroutine.wrap(function()
                            local initialLureValue = lureValue
                           -- local initialCastValue = LocalPlayer.Character:FindFirstChild(RodName).values.casted.Value
                            task.wait(15)
                            if lureValue == initialLureValue then
                                lureChanged = false
                                LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
                            else
                                lureChanged = true
                            end
                        end)()

                        repeat
                            pcall(function()
                                PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
                                game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
                            end)

                            -- Update lure percentage
                            XyzClone.Text = "<font color='#ff4949'>Lure </font>: " .. string.format("%.2f", LocalPlayer.Character:FindFirstChild(RodName).values.lure.Value) .. "%"
                            RunService.Heartbeat:Wait()
                        until not LocalPlayer.Character:FindFirstChild(RodName) or LocalPlayer.Character:FindFirstChild(RodName).values.bite.Value or not autofishEnabled or lureChanged

                        XyzClone.Text = "<font color='#ff4949'>FISHING!</font>"
                        delay(1.5, function()
                            if XyzClone then
                                XyzClone:Destroy()
                                XyzClone = nil
                            end
                        end)

                        repeat
                            ReplicatedStorage.events.reelfinished:FireServer(1000000000000, true)
                            task.wait(0.5)
                        until not LocalPlayer.Character:FindFirstChild(RodName) or not LocalPlayer.Character:FindFirstChild(RodName).values.bite.Value or not autofishEnabled
                    else
                        LocalPlayer.Character:FindFirstChild(RodName).events.cast:FireServer(1000000000000)
                        task.wait(2)
                    end
                end

                -- Clean up XyzClone when loop exits
                if XyzClone then
                    XyzClone:Destroy()
                    XyzClone = nil
                end
            end)()
        end
    end)
-- // // // Scripts // // // --
    Tabs.Executor:AddButton({
        Title = "Speed Hub X",
        Description = "Open Speed Hub X",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end
    })
    Tabs.Executor:AddButton({
        Title = "FlyGui V3",
        Description = "Open FlyGui V3",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        end
    })
    Tabs.Executor:AddButton({
        Title = "Unnamed ESP",
        Description = "Open Unnamed ESP",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
        end
    })
    Tabs.Executor:AddButton({
        Title = "Infinity Yield",
        Description = "Open Infinity Yield",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end
    })
    Tabs.Executor:AddButton({
        Title = "Dex Explorer",
        Description = "Open Dex Explorer",
        Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
        end
    })
    local ExecutorInput = Tabs.Executor:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })
    Tabs.Executor:AddButton({
        Title = "Load Script",
        Description = "Load Script pasted in Executor",
        Callback = function()
            loadstring(game:HttpGet( ExecutorInput.value, true))()
            print("script executed")
        end
    })
-- // // // Webhook // // //
--need
-- // // // SERVICES // // // --
    -- Addons:
    -- SaveManager (Allows you to have a configuration system)
    -- InterfaceManager (Allows you to have a interface managment system)

    -- Hand the library over to our managers
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    -- Ignore keys that are used by ThemeManager.
    -- (we dont want configs to save themes, do we?)
    SaveManager:IgnoreThemeSettings()

    -- You can add indexes of elements the save manager should ignore
    SaveManager:SetIgnoreIndexes({})

    -- use case for doing it this way:
    -- a script hub could have themes in a global folder
    -- and game configs in a separate folder per game
    InterfaceManager:SetFolder("FluentScriptHub")
    SaveManager:SetFolder("FluentScriptHub/specific-game")

    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)


    Window:SelectTab(1)

    Fluent:Notify({
    Title = "Aurora Hub",
    Content = "The script has been loaded.",
    Duration = 8
    })

    -- You can use the SaveManager:LoadAutoloadConfig() to load a config
    -- which has been marked to be one that auto loads!
    SaveManager:LoadAutoloadConfig()
    --hi git