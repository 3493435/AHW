print("Join https://discord.gg/ZSDyzkTDcz")

local marketplaceService = game:GetService("MarketplaceService")

    local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
    if isSuccessful then
        print(info.Name)
    end

if game.PlaceId == 155615604 then --- Prison Life

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/forumsLib/main/source.lua"))()
    local Forums = Library.new(info.Name)  


    local A1 = Forums:NewSection("Main")
    local MainSection = Forums:NewSection("Get Weapons")
    local Teams = Forums:NewSection("Teams")

    A1:NewSlider("Walk Speed Adjuster", 16, 400, function(value)
        game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    A1:NewSlider("Jump Power Adjuster", 50, 50, 300, function(value)
        game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = value
    end)

    A1:NewSlider("HipHeight Adjuster", 0.5, 0.5, 100, function(value)
        game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = value
    end)


    MainSection:NewButton("Get M9", function()
        game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver.M9.ITEMPICKUP)
    end)

    MainSection:NewButton("Get Remington", function()
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
    end)

    MainSection:NewButton("Get Crude Knife", function()
        game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP)
    end)

    MainSection:NewButton("Get Hammer", function()
        game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single.Hammer.ITEMPICKUP)
    end)

    MainSection:NewButton("Get AK-47", function()
        game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
    end)

    Teams:NewButton("Become Guard", function()
        game.workspace.Remote.TeamEvent:FireServer("Bright blue")
    end)

    Teams:NewButton("Become Inmate", function()
        game.workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)

    Teams:NewButton("Become Neutral", function()
        Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end)

    Teams:NewButton("Become Criminal", function()
        local location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
    end)

    local GunMods = Forums:NewSection("Gun Mods")

    GunMods:NewDropdown("Gun Mod", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
        module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
        module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
    end
    if module ~= nil then
        module["MaxAmmo"] = math.huge
        module["CurrentAmmo"] = math.huge
        module["StoredAmmo"] = math.huge
        module["FireRate"] = 0.000001
        module["Spread"] = 0
        module["Range"] = math.huge
        module["Bullets"] = 10
        module["ReloadTime"] = 0.000001
        module["AutoFire"] = true
    end
    end)

    local MiscMain = Forums:NewSection("Misc")

    MiscMain:NewButton("Arrest All Criminals", function()
        local Player = game.Players.LocalPlayer
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
            if v.Name ~= Player.Name then
                local i = 10
                repeat
                wait()
                i = i-1
                game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
            end
        end
    Player.Character.HumanoidRootPart.CFrame = cpos
    end)

    MiscMain:NewButton("Remove Clothing", function()
        game.Players.LocalPlayer.Character.Clothing:Destroy()
        wait(0.1)
        game.Players.LocalPlayer.Character.Clothing:Destroy()
    end)


    MiscMain:NewTextBox("TP To Player", "Username", function(value)
        local plr1 = game.Players.LocalPlayer.Character
        local plr2 = game.Workspace:FindFirstChild(value)
        
        plr1.HumanoidRootPart.CFrame = plr2.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
    end)

    MiscMain:NewButton("Destroy All Doors", function()
        game:GetService("Workspace").Doors:Destroy()
    end)

    MiscMain:NewButton("Escape", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(497.262573, 198.039948, 2212.94336)
    end)

    MiscMain:NewButton("Invisible", function()
        local player = game.Players.LocalPlayer
        position = player.Character.HumanoidRootPart.Position
        wait(0.1)
        player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
        wait(0.1)
        humanoidrootpart = player.Character.HumanoidRootPart:clone()
        wait(0.1)
        player.Character.HumanoidRootPart:Destroy()
        humanoidrootpart.Parent = player.Character
        player.Character:MoveTo(position)
        wait()

        game.Players.LocalPlayer.Character.Torso.Transparency = 1
        game.Players.LocalPlayer.Character.Head.Transparency  = 1
        game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
        game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
        game.Players.LocalPlayer.Character.Head.face:Remove()
    end)

    MiscMain:NewButton("Reset Character", function()
        game.Players.LocalPlayer.Character:BreakJoints()
    end)

    MiscMain:NewButton("TP To Car", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").CarContainer.Sedan.Body.Seat.Position)
    end)

    local TeleportMain = Forums:NewSection("Teleport", 5012544693)

    TeleportMain:NewButton("TP to Criminal Base", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    end)

    TeleportMain:NewButton("TP to CourtYard", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798.999756, 95.1383057, 2540.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end)

    TeleportMain:NewButton('TP to Cafeteria', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(875.049805, 96.9333496, 2271.5498, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    end)

    TeleportMain:NewButton('TP to Prison', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(590.699524, 98.0399399, 2269.83911)
    end)

    TeleportMain:NewButton('TP to Sewers', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.092468, 78.6991119, 2437.32397)
    end)

    TeleportMain:NewButton('TP to Prison Cells', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.500366, 99.9899902, 2458.89307)
    end)

    TeleportMain:NewButton('TP to Prison Roof', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820.341248, 118.990005, 2378.33838)
    end)

    TeleportMain:NewButton('TP to Police Base', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(835.926208, 99.9900055, 2267.71191)
    end)

    TeleportMain:NewButton('TP to Gate Button', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(504.488312, 102.039917, 2242.48389)
    end)

    TeleportMain:NewButton('TP to Survailence', function()
        local CPart = game:GetService("Workspace").Prison_Guard_Outpost.furniture_cctv.cctv.Chair.Part

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CPart.Position)
    end)

    TeleportMain:NewButton('TP to Neutral Spawn', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(879.38031, 27.7899876, 2349.28955)
    end)

    local Credits = Forums:NewSection("Credits")

    local Srds = Credits:NewButton("https://discord.gg/ZSDyzkTDcz", function()
        print("Join https://discord.gg/ZSDyzkTDcz for the lastest update")
    end)

elseif game.PlaceId == 2248408710 then --- Destruction Simulator

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/forumsLib/main/source.lua"))()
    local Forums = Library.new(info.Name)

    local MainSection = Forums:NewSection("Main")

    MainSection:NewButton("Coins", function()
        local A_1 = "Coins"
        local A_2 = 9999999999999
        local A_3 = 9999999
        local Event = game:GetService("ReplicatedStorage").Remotes.generateBoost
        Event:FireServer(A_1, A_2, A_3)
        end)

    MainSection:NewButton("Levels", function()
        local A_1 = "Levels"
        local A_2 = 19
        local A_3 = 19
        local Event = game:GetService("ReplicatedStorage").Remotes.generateBoost
        Event:FireServer(A_1, A_2, A_3)
        end)

    MainSection:NewButton("Sell Bricks", function()
        local Event = game:GetService("ReplicatedStorage").Remotes.sellBricks
        Event:FireServer()
        end)

    local BoostsSection = Forums:NewSection("Boosts")

    BoostsSection:NewButton("Coin Boost", function()
        local A_1 = "CoinBoost"
        local A_2 = 99999999999999
        local A_3 = 2
        local Event = game:GetService("ReplicatedStorage").Remotes.generateBoost
        Event:FireServer(A_1, A_2, A_3)
        end)

    BoostsSection:NewButton("Extra Speed", function()
        local A_1 = "ExtraSpeed"
        local A_2 = 99999999999999
        local A_3 = 2
        local Event = game:GetService("ReplicatedStorage").Remotes.generateBoost
        Event:FireServer(A_1, A_2, A_3)
        end)

    BoostsSection:NewButton("Super Jump", function()
        local A_1 = "SuperJump"
        local A_2 = 99999999999999
        local A_3 = 2
        local Event = game:GetService("ReplicatedStorage").Remotes.generateBoost
        Event:FireServer(A_1, A_2, A_3)
        end)

    BoostsSection:NewButton("Brick Boost", function()
        local A_1 = "BrickBoost"
        local A_2 = 99999999999999
        local A_3 = 2
        local Event = game:GetService("ReplicatedStorage").Remotes.generateBoost
        Event:FireServer(A_1, A_2, A_3)
        end)

    local Credits = Forums:NewSection("Credits")

    local Srds = Credits:NewButton("https://discord.gg/ZSDyzkTDcz", function()
        print("Join https://discord.gg/ZSDyzkTDcz for the lastest update")
    end)

elseif game.PlaceId == 189707 then --- Natural Disaster Survival

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/forumsLib/main/source.lua"))()
    local Forums = Library.new(info.Name)

    local MainSection = Forums:NewSection("Main")

    MainSection:NewSlider("Walkspeed", 16, 250, function(value)
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    MainSection:NewSlider("Jumppower", 50, 250, function(value)
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
    end)

    MainSection:NewButton("Remove FallDamage", function()
        while wait() do
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].FallDamageScript:Destroy()
        end
        print ("Removed FallDamage Dont Worry About The Error")
    end)

    MainSection:NewToggle("Pick Map", function(state)
        if state then
            TextLabel = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MapVotePage
            TextLabel.Visible = true
        else
            TextLabel = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.MapVotePage
            TextLabel.Visible = false
        end
    end)

    local Credits = Forums:NewSection("Credits")

    local Srds = Credits:NewButton("https://discord.gg/ZSDyzkTDcz", function()
        print("Join https://discord.gg/ZSDyzkTDcz for the lastest update")
    end)

elseif game.PlaceId == 142823291 then

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/forumsLib/main/source.lua"))()
    local Forums = Library.new(info.Name)

    local MainSection = Forums:NewSection("Main")
    local EmotesSection = Forums:NewSection("Emotes")
    local TrollingSection = Forums:NewSection("Trolling")

    local CoreGui = game:GetService("StarterGui")

    local noclip = false

    MainSection:NewButton("Teleport To Murder", function()
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Knife") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
            end
        end
    end)

    MainSection:NewButton("Teleport To Sheriff", function()
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character:FindFirstChild("Revolver") or v.Backpack:FindFirstChild("Revolver") or v.Character:FindFirstChild("Gun") or v.Backpack:FindFirstChild("Gun") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
            end
        end
    end)

    MainSection:NewButton("Find Murder", function()
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Knife") then
                
    CoreGui:SetCore("SendNotification", {
        Title = "Murder Finder!";
        Text = v.Name.." Is Murder";
        Duration = 5;
    })
            end
        end
    end)

    MainSection:NewButton("Name Esp", function()
        for i,v in pairs(game.Players:GetChildren()) do
            local billboard = Instance.new("BillboardGui");billboard.SizeOffset = Vector2.new(0,1);billboard.Size = UDim2.new(5,0,1.5,0);local label = Instance.new("TextLabel"); label.BackgroundTransparency = 1; label.Size = UDim2.new(1,0,1,0); label.Text = v.Name; label.TextScaled = true;label.Parent = billboard;billboard.Parent = v.Character.Head;label.TextColor3 = Color3.fromRGB(0,255,0);billboard.AlwaysOnTop = true
            end
        end)

    MainSection:NewToggle("Noclip", function(t)
    noclip = t
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
    if noclip == true then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)

    EmotesSection:NewButton("Sit", function()
        local string_1 = "sit";
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton("Zen", function()
        local string_1 = "zen";
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton("Dab", function()
        local string_1 = "dab";
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton("Floss", function()
        local string_1 = "floss";
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton("Ninja", function()
        local string_1 = "ninja";
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)

    EmotesSection:NewButton("Zombie", function()
        local string_1 = "zombie";
        local Target = game:GetService("ReplicatedStorage").PlayEmote;
        Target:Fire(string_1);
    end)



    TrollingSection:NewButton("Fake Knife", function()
        local lp = game.Players.LocalPlayer
        local tool;local handle;local knife;
        local animation1 = Instance.new("Animation")
        animation1.AnimationId = "rbxassetid://2467567750"
        local animation2 = Instance.new("Animation")
        animation2.AnimationId = "rbxassetid://1957890538"
        local anims = {animation1,animation2}
        tool = Instance.new("Tool")
        tool.Name = "Fake Knife"
        tool.Grip = CFrame.new(0, -1.16999984, 0.0699999481, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        tool.GripForward = Vector3.new(-0, -0, -1)
        tool.GripPos = Vector3.new(0,-1.17,0.0699999)
        tool.GripRight = Vector3.new(1,0,0)
        tool.GripUp = Vector3.new(0,1,0)
        handle = Instance.new("Part")
        handle.Size = Vector3.new(0.310638815, 3.42103457, 1.08775854)
        handle.Name = "Handle"
        handle.Transparency = 1
        handle.Parent = tool
        tool.Parent = lp.Backpack
        knife=lp.Character:WaitForChild("KnifeDisplay")
        knife.Massless = true
        lp:GetMouse().Button1Down:Connect(function()
        if tool and  tool.Parent == lp.Character then
        local an = lp.Character.Humanoid:LoadAnimation(anims[math.random(1,2)])
        an:Play()
        end
        end)
        local aa = Instance.new("Attachment",handle)
        local ba = Instance.new("Attachment",knife)
        local hinge = Instance.new("HingeConstraint",knife)
        hinge.Attachment0=aa hinge.Attachment1=ba
        hinge.LimitsEnabled = true
        hinge.LowerAngle = 0
        hinge.Restitution = 0
        hinge.UpperAngle = 0
        lp.Character:WaitForChild"UpperTorso":FindFirstChild("Weld"):Destroy()
        game:GetService"RunService".Heartbeat:Connect(function()
        setsimulationradius(1/0,1/0)
        if tool.Parent == lp.Character then
        knife.CFrame = handle.CFrame
        else
        knife.CFrame = lp.Character:WaitForChild"UpperTorso".CFrame
        end
        end)
        end)

    local Credits = Forums:NewSection("Credits")

    local Srds = Credits:NewButton("https://discord.gg/ZSDyzkTDcz", function()
        print("Join https://discord.gg/ZSDyzkTDcz for the lastest update")
    end)

end