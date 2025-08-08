-- new fruit bettle

-- AntiAFK
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

-- test UI

local thread
local pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"

local Update
local newLib
local PakeUIBaru = true

if PakeUIBaru then -- pake ui baru ygy
    Update = loadstring(game:HttpGet("https://raw.githubusercontent.com/VanciSonic/Lgtihb/main/LgantihubBaru"))()
elseif not PakeUIBaru then -- pake ui lama, pake wrapper gini dah gw
    Update = {}
    newLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VanciSonic/Lgtihb/main/Lgantihub"))()

-- window
function Update:Window(title, icon,...)
	local LIBRARY = setmetatable({}, Update)
	
	local loading = newLib:Init(title, icon, true, "Username", { discord = "discord.gg/isnahamzah", youtube=  "@isnahamzah"})
	
	
	-- loading bar
	function LIBRARY:SetProgress(int)
		loading:SetProgress(int)
	end
	function LIBRARY:Finish()
		loading:Finish()
	end
	
	-- gw lupa add ini njir
	function LIBRARY:AddChangelog(list)
		local self = setmetatable({}, LIBRARY)
		return newLib:AddChangelog(list)
	end
	
	
	function LIBRARY:SetSAT(bool)
            return newLib:SetSAT(bool)
        end

    function LIBRARY:SetFunctionSAT(func)
        return newLib:SetFunctionSAT(func)
    end
	
	-- addtab
	function LIBRARY:AddTab(name, imgID)
		local TAB = setmetatable({}, LIBRARY)
		
		if not string.find(imgID, "rbxassetid://", 1, true) then
			imgID = "rbxassetid://"..imgID
		end
		
		local newTab = newLib:AddTab(name, imgID)
		
		-- the insiders
		function TAB:AddLabel(name)
			local self = setmetatable({}, TAB)
			return newTab:AddLabel(name)
		end
		function TAB:AddLabel1(name)
			local self = setmetatable({}, TAB)
			return newTab:AddLabel(name)
		end
		
		function TAB:AddButton(name, callback)
			local self = setmetatable({}, TAB)
			return newTab:AddButton(name, "", callback)
		end
		
		function TAB:AddSlider(name, min, max, start, callback, inc)
			local self = setmetatable({}, TAB)
			return newTab:AddSlider(name, "", {default = start, inc = (inc or 1), min = min, max = max}, callback)
		end
		
		function TAB:AddTextbox(name, clearonfocuslost, callback)
			local self = setmetatable({}, TAB)
			return newTab:AddTextbox(name, "", {clearonfocus = clearonfocuslost, defaulttext = "", placeholdertext = ""}, callback)
		end
		
		function TAB:AddSeperator(name)
			local self = setmetatable({}, TAB)
			return newTab:AddSeperator(name)
        end

		function TAB:AddLine()
			local self = setmetatable({}, TAB)
			return newTab:AddLine()
		end

        

		
		-- TEMPORARY FOR NEW NOTIFICATION LIB
		function TAB:AddNotification(textdesc)
			game.StarterGui:SetCore("SendNotification", {
				Title = "Notification", 
				Text = textdesc;
			})
		end
		
		function TAB:AddDropdown(name, options, callback)
			local self = setmetatable({}, TAB)
			return newTab:AddDropdown(name, "", {default = "None", list = options}, callback)
		end
		
		function TAB:AddToggle(name, default, callback)
			local self = setmetatable({}, TAB)
			return newTab: AddToggle(name, "", (default or false), callback)
		end
		
		function TAB:AddKeybind(name, default, callback)
			local self = setmetatable({}, TAB)
			return newTab:AddKeybind(name, "", {triggerwhilebinding = false, defaultkey = default}, callback)
		end
		
        function TAB:AddMultiDropdown(name, options, callback)
			local self = setmetatable({}, TAB)
			return newTab:AddMultiDropdown(name, "", {default = {}, list = options}, callback)
		end
		
		return TAB
	end
	
	return LIBRARY
end
end

-- 9224601490 Dressrosa
-- 16190471004 whole cake       
-- 16190471004 kaido

if game.PlaceId == 9224601490 then
	World1 = true
elseif game.PlaceId == 16190471004 then
	World2 = true
elseif game.PlaceId == 12413901502 then
	World3 = true
end

function HopServer()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(4)
				end
			end
		end
	end
	function Teleport() 
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end
	Teleport()
end       

function TP1(Pos)
	Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 25 then
		Speed = 5000
	elseif Distance < 50 then
		Speed = 2000
	elseif Distance < 150 then
		Speed = 800
	elseif Distance < 250 then
		Speed = 600
	elseif Distance < 500 then
		Speed = 300
	elseif Distance < 750 then
		Speed = 250
	elseif Distance >= 1000 then
		Speed = 200
	end
	game:GetService("TweenService"):Create(
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
		TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		{CFrame = Pos}
	):Play()
end

local function round(n)
	return math.floor(tonumber(n) + 0.5)
end

Number = math.random(1, 1000000)
function UpdatePlayerChams1()
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
                    local dPs = game:GetService("Players")[v.Name]['MAIN_DATA']
                    function GFs()
                        return tostring(dPs.Slots[tostring(dPs.Slot.Value)].Value)
                    end
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('#'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = '#'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' 1.1\n [' .. v.Character.Humanoid.Health .. ' / ' .. v.Character.Humanoid.MaxHealth .. ']\n['.. GFs() ..']')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0,255,0)
						else
							name.TextColor3 = Color3.new(255,0,0)
						end
					else
						v.Character.Head['#'..Number].TextLabel.Text = (v.Name ..' 1.2\n [' .. v.Character.Humanoid.Health .. ' / ' .. v.Character.Humanoid.MaxHealth .. ']\n['.. GFs() ..']')
					end
				else
					if v.Character.Head:FindFirstChild('#'..Number) then
						v.Character.Head:FindFirstChild('#'..Number):Destroy()
					end
				end
			end
		end)
	end
end

function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams2()
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
                    local dP = game:GetService("Players")[v.Name]['MAIN_DATA']
                    function GF()
                        return tostring(dP.Slots[tostring(dP.Slot.Value)].Value)
                    end
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('#'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = '#'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' 2.1\n [' .. v.Character.Humanoid.Health .. ' / ' .. v.Character.Humanoid.MaxHealth .. ']\n['.. GF() ..']')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0,255,0)
						else
							name.TextColor3 = Color3.new(255,0,0)
						end
					else
						v.Character.Head['#'..Number].TextLabel.Text = (v.Name ..' | '.. GF() ..' \n [' .. v.Character.Humanoid.Health .. ' / ' .. v.Character.Humanoid.MaxHealth .. ']')
					end
				else
					if v.Character.Head:FindFirstChild('#'..Number) then
						v.Character.Head:FindFirstChild('#'..Number):Destroy()
					end
				end
			end
		end)
	end
end

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

local Library = Update:Window("Ganteng Hub","",Enum.KeyCode.RightControl);
SAT = Library
Library:AddChangelog({
    ["1.0.0"] = "New Game Fruit Bettle",
})

-- LOADING HERE
Library:SetProgress(10) 
Library:SetFunctionSAT(function()
    TP1(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    _G.Clip = false
    task.wait(.1)
    SAT:SetSAT(false)
end)
Library:Finish()


local H = Library:AddTab("Info","14602166612")
local Main = Library:AddTab("Main","14614308263")
local Sett = Library:AddTab("Setting","15759774881") 
local T = Library:AddTab("Teleport","14614380750")
local D = Library:AddTab("Devil Fruit","14614447717")
local mic = Library:AddTab("Misc","11156061121")

local Time = H:AddLabel("Executor Time");spawn(function() getgenv().Time = true;while wait() do wait(.1) UpdateTime() end end);function UpdateTime() local date = os.date("*t");local hour = (date.hour) % 24;local ampm = hour < 12 and "AM" or "PM";local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm);local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year);local LocalizationService = game:GetService("LocalizationService");local Players = game:GetService("Players");local player = Players.LocalPlayer;local name = player.Name;local result, code = pcall(function()   return LocalizationService:GetCountryRegionForPlayerAsync(player)  end);Time:Set(" : " .. timezone);Time:Set("Executor Time: " .. datetime .. " [ " .. code .. " ]");spawn(function() if getgenv().Time then pcall(function()  while wait() do  Time()  end end) end end) end

H:AddLabel("[🌐] Website : isnahamzah.tech ")
H:AddLabel("[💬] Discord : discord.gg/isnahamzah ")
H:AddLabel("[🎥] Youtube : @isnahamzah ") 
H:AddLabel("[📀] Executor : ".. identifyexecutor())
H:AddLabel("[💎] Rank : Free ")
H:AddLabel("#StayGanteng") 
H:AddLabel("#GantengHubOnTop")
H:AddLine()

if _G.Bahasa == "indo" then
	Main:AddToggle("Mulai Auto Farm",_G.Start,function(value)
		_G.Start = value
	end)
	
	Stamina = 0
	Sett:AddSlider("Stamina Untuk PLayer Reset : ",6,100,0,function(value)
		Stamina = value
	end)
	
	Sett:AddLabel("Stamina Bawan Developer : 0")
	Sett:AddLabel("Jangan Di Rubah Jika Tidak Paham")
	
	Speed = 20
	Sett:AddSlider("Kecepatan Berlari PLayer : ",0,200,20,function(value)
		Speed = value
	end)
	
	Jump = 60
	Sett:AddSlider("Tinggi Loncatan Player : ",0,200,60,function(value)
		Jump = value
	end)

	Sett:AddToggle("Esp Player",false,function(a)
		ESPPlayer = a
		UpdatePlayerChams1()
		UpdatePlayerChams2()
	end)
else
	Main:AddToggle("Mulai Auto Farm",_G.Start,function(value)
		_G.Start = value
	end)
	
	Stamina = 0
	Sett:AddSlider("Min Stamina Reset : ",0,100,0,function(value)
		Stamina = value
	end)  
	
	Sett:AddLabel("Stamina Set By Developer : 0")
	Sett:AddLabel("Don't change it if you don't know")
	
	Speed = 20
	Sett:AddSlider("Speed Player : ",0,200,20,function(value)
		Speed = value
	end)
	
	Jump = 60
	Sett:AddSlider("Height Jump Player : ",0,200,60,function(value)
		Jump = value
	end)

	Sett:AddToggle("Esp Player",false,function(a)
		ESPPlayer = a
		UpdatePlayerChams1()
		UpdatePlayerChams2()
	end)
end

spawn(function()
	while task.wait() do
		if ESPPlayer then
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v ~= plr then
					esp(v, Color3.fromRGB(255, 255, 255))
				end
			end
		end
	end
end)
	
spawn(function()
	while task.wait() do
		if ESPPlayer then
			UpdatePlayerChams1()
			UpdatePlayerChams2()
		end
	end
end)

spawn(function()
    while task.wait() do 
		local plyra = game.Players
		if plyra.LocalPlayer.Character and plyra.LocalPlayer.Character.Humanoid then
			plyra.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
			plyra.LocalPlayer.Character.Humanoid.JumpPower = Jump
		else
			wait()
		end
	end
end)

-- Important Variables
local Players            =  game:GetService('Players')
local LocalPlayer        =  Players.LocalPlayer                   
local Backpack           =  LocalPlayer.Backpack
local PlayerGui          =  LocalPlayer.PlayerGui
local ReplicatedStorage  =  game:GetService("ReplicatedStorage")
-- Variables
local VirtualInputManager  =  game:GetService('VirtualInputManager')
local Data                 =  LocalPlayer['MAIN_DATA']
local UI                   =  PlayerGui.UI
-- GetFruit
function GetFruit()
    return tostring(tostring(Data.Slots[tostring(Data.Slot.Value)].Value))
end
-- GetLevel
function GetLevel()
    return tostring(Data.Fruits[GetFruit()].Level.Value)
end
-- GetStamina
function GetStamina()
    return (tonumber(GetLevel()) * 4) + 200
end
-- Percent
function Percent(Part, Whole)
    return (Part / Whole) * 100
end
-- Respawn
function RespawnS()
	local A = game:GetService("ReplicatedStorage").ReplicatorNoYield
	A:FireServer("Core", "LoadCharacter", {})
	A:FireServer("Main", "LoadCharacter")
    if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('Humanoid',2) then
        Workspace.CurrentCamera.CameraSubject =  LocalPlayer.Character.Humanoid
        game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack',false)
        game:GetService('StarterGui'):SetCoreGuiEnabled('PlayerList',true)
        game:GetService('StarterGui'):SetCoreGuiEnabled('Chat',true)
        UI.MainMenu.Visible  =  false
        UI.HUD.Visible       =  true
    end
end

spawn(function()
    while task.wait() do
        if _G.Start and not Workspace:FindFirstChild('SafeZoneBuatan') then
            local baseplate    = Instance.new("Part")
            baseplate.Parent   = workspace
            baseplate.Name = "SafeZoneBuatan"
            baseplate.Transparency = 0.5
            baseplate.Size     = Vector3.new(60,2,60)
            baseplate.Anchored = true
            baseplate.Position = Vector3.new(1062.5361328125, 975.6680297851562, -9737.7900390625)
        end
    end
end)



-- _G.Start : Attack
spawn(function()
    while task.wait() do 
        if _G.Start then
            if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('HumanoidRootPart',2) then
                for i,v in pairs(LocalPlayer:GetDescendants()) do
                    if v.ClassName == 'Tool' then
                        if v:GetAttribute('Name') then 
                            local Attack = v:GetAttribute('Name')
                            ReplicatedStorage.Replicator:InvokeServer(GetFruit(),Attack)
                        else
                            local Attack = v.Name:gsub(" ","")
                            ReplicatedStorage.Replicator:InvokeServer(GetFruit(),Attack)
                        end
                    end
                end
            end
        end
    end
end)

-- _G.Start : Position
spawn(function()
    while task.wait() do
        if _G.Start then
            local inCombat = game:GetService("Players"):WaitForChild("nmh7h"):WaitForChild("PlayerGui"):WaitForChild("UI"):WaitForChild("InCombat")
            if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('HumanoidRootPart',2) then
                if inCombat.Visible then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1059.395751953125, 979.66796875, -9738.90234375)
				elseif World1 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-456.7948303222656, 696.1821899414062, 1585.7791748046875)
				elseif World2 then 
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(669.364013671875, 332.23297119140625, -724.8306274414062)
				elseif World3 then 
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5227.59912109375, 1125.5362548828125, 312.9653625488281)
                end
            end
        end
    end
end)
-- _G.Start : Respawn : 1/3
spawn(function()
    while task.wait() do
        if _G.Start then
            if PlayerGui:FindFirstChild('DeathScreen') then
                UI.HUD.Visible       =  false
                UI.Safezone.Visible  =  false
            end
            -- Hide Gui On Spawn
            if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('Humanoid',2) then
                game:GetService('StarterGui'):SetCoreGuiEnabled('Backpack',false)
                game:GetService('StarterGui'):SetCoreGuiEnabled('PlayerList',true)
                game:GetService('StarterGui'):SetCoreGuiEnabled('Chat',false)
                UI.MainMenu.Visible  =  false
                UI.HUD.Visible       =  true
            end
            -- Fix Camera On Spawn
            if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) and LocalPlayer.Character:WaitForChild('Humanoid',2) then
                Workspace.CurrentCamera.CameraSubject =  LocalPlayer.Character.Humanoid
                Workspace.CurrentCamera.CameraType    =  Enum.CameraType.Custom
            end
        end
    end
end)
-- _G.Start : Respawn : 2/3
spawn(function()
    while task.wait() do
        if _G.Start then
            if (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()) then
                if Percent(LocalPlayer.Character:WaitForChild('Stats',2):GetAttribute("Stamina"),GetStamina()) <= Stamina then
                    local inCombatSS = game:GetService("Players"):WaitForChild("nmh7h"):WaitForChild("PlayerGui"):WaitForChild("UI"):WaitForChild("InCombat")
                    if inCombatSS.Visible then
                        wait()
                    else
                        LocalPlayer.Character.Humanoid.Health = 0
                    end
                end
            end
        end
    end
end)
-- _G.Start : Respawn : 3/3
spawn(function()
    while task.wait() do 
        if _G.Start then
            local inCombatS = game:GetService("Players"):WaitForChild("nmh7h"):WaitForChild("PlayerGui"):WaitForChild("UI"):WaitForChild("InCombat")
            if LocalPlayer.Character == nil and UI.HUD.Visible == false then
                if inCombatS.Visible then
                    wait()
                else
                    RespawnS()
                end
            end
        end
    end
end)

local safe
local zone
local npcUS
if World1 then
	npcUS = {"Kuma","MysteryGuy","SoruBook","TitleNpc", "Scientist", "TournamentRegister"}
	zone = {"Forest","Colloseum","Dressrosa", "Castle"}
	safe = {"sf1","sf2","sf3","sf4","sf5"}
elseif World2 then
	npcUS = {"Kuma"}
	zone = {"BossRoom","Arena","WholeCake1","WholeCake2"}
	safe = {"sf1","sf2","sf3","sf4","sf5","sf6","sf7"}
elseif World3 then
	npcUS = {"Kuma", "Momonosuke"}
	zone = {"KaidoDomain","TheLiveFloor","Onigashima"}
	safe = {"sf1","sf2","sf3","sf4","sf5","sf6","sf7","sf8"}
end

if _G.Bahasa == "indo" then
	T:AddDropdown("Pilih Npc",npcUS,function(value)
		_G.tpnp = value
	end)

	T:AddDropdown("Pilih Teleport Area",zone,function(value)
		_G.tpz = value
	end)

	T:AddDropdown("Pilih SafeZone",safe,function(value)
		_G.tpsf = value
	end)

	T:AddToggle("Teleport Ke Npc",_G.Tp1,function(value)
		_G.Tp1 = value
	end)

	T:AddToggle("Teleport Ke Area",_G.Tp2,function(value)
		_G.Tp2 = value
	end)

	T:AddToggle("Teleport Ke SafeZone",_G.Tp3,function(value)
		_G.Tp3 = value
	end)

else
	T:AddDropdown("Select Npc",npcUS,function(value)
		_G.tpnp = value
	end)

	T:AddDropdown("Select Teleport",zone,function(value)
		_G.tpz = value
	end)

	T:AddDropdown("Select SafeZone",safe,function(value)
		_G.tpsf = value
	end)

	T:AddToggle("Teleport to Npc",_G.Tp1,function(value)
		_G.Tp1 = value
	end)

	T:AddToggle("Teleport to Area",_G.Tp2,function(value)
		_G.Tp2 = value
	end)

	T:AddToggle("Teleport to SafeZone",_G.Tp3,function(value)
		_G.Tp3 = value
	end)

end

local npcs = {
    World1 = {
        Kuma = CFrame.new(1128.31091, 738.014221, 1007.83997, -0.906296611, 0, 0.422642082, 0, 1, 0, -0.422642082, 0, -0.906296611),
        MysteryGuy = CFrame.new(-773.756714, 835.940857, 698.303589, -1, 0, 0, 0, 1, 0, 0, 0, -1),
        SoruBook = CFrame.new(1512.69812, 709.382996, 664.949463, 0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, 0.374604106),
        TitleNpc = CFrame.new(-949.908081, 772.940735, -862.547791, 0, 0, -1, 0, 1, 0, 1, 0, 0),
		Scientist = CFrame.new(516.7607421875, 733.2589111328125, -727.4920654296875),
		TournamentRegister = CFrame.new(807.1329956054688, 734.8408813476562, 736.6929931640625)
    },
    World2 = {
        Kuma = CFrame.new(363.7018737792969, 152.88661193847656, -2498.49853515625)
    },
    World3 = {
        Kuma = CFrame.new(-2710.335693359375, 168.8878173828125, 414.290283203125),
        Momonosuke = CFrame.new(-5182.05419921875, 701.0331420898438, 373.887451171875)
    }
}

local zones = {
    World1 = {
        Forest = CFrame.new(-798.644531, 945.932129, 26.0674744, 1, 0, 0, 0, 1, 0, 0, 0, 1),
        Colloseum = CFrame.new(511.540741, 1146.17554, 800.123657, 1, 0, 0, 0, 1, 0, 0, 0, 1),
        Dressrosa = CFrame.new(716.355469, 777.182129, -266.432495, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Castle = CFrame.new(-30.124906539916992, 1028.2244873046875, 25.253894805908203)
    },
    World2 = {
        BossRoom = CFrame.new(564.656494140625, 351.47747802734375, -1627.300048828125),
        Arena = CFrame.new(1856.25927734375, 337.4670715332031, -2621.94189453125),
        WholeCake1 = CFrame.new(575.8052978515625, 305.7158508300781, -2445.91162109375),
        WholeCake2 = CFrame.new(-476.1396484375, 213.69467163085938, -3107.52392578125)
    },
    World3 = {
        KaidoDomain = CFrame.new(-4204.42431640625, 1728.29833984375, 296.87353515625),
        TheLiveFloor = CFrame.new(-4445.42431640625, 618.29833984375, 296.87353515625),
        Onigashima = CFrame.new(-2734.25, 417.4410400390625, 383.7380065917969)
    }
}

local safeZones = {
    World1 = {
        sf1 = CFrame.new(626.3836059570312, 737.724609375, 361.9540100097656),
        sf2 = CFrame.new(919.93017578125, 737.724609375, 1179.48388671875),
        sf3 = CFrame.new(405.55999755859375, 737.718994140625, -677.614990234375),
        sf4 = CFrame.new(-417.51910400390625, 744.8784790039062, 379.6806335449219),
        sf5 = CFrame.new(-923.1443481445312, 783.8786010742188, -825.6710205078125)
    },
    World2 = {
        sf1 = CFrame.new(1084.513671875, 208.6140899658203, -2327.12841796875),
        sf2 = CFrame.new(-163.589599609375, 166.6140899658203, -2395.1396484375),
        sf3 = CFrame.new(575.586669921875, 201.6140899658203, -3433.8359375),
        sf4 = CFrame.new(-876.2908325195312, 165.11412048339844, -3128.833740234375),
        sf5 = CFrame.new(-175.64854431152344, 156.6140899658203, -2660.77490234375),
        sf6 = CFrame.new(13.910394668579102, 158.1140899658203, -3272.13916015625),
        sf7 = CFrame.new(1334.510498046875, 208.6140899658203, -3201.839599609375)
    },
    World3 = {
        sf1 = CFrame.new(-2626.499755859375, 159.96958923339844, 1146.98828125),
        sf2 = CFrame.new(-2621, 170.46958923339844, -268.0115051269531),
        sf3 = CFrame.new(-3261.5, 299.86968994140625, 589.4901733398438),
        sf4 = CFrame.new(-3348.5, 373.36968994140625, 208.99000549316406),
        sf5 = CFrame.new(-3333.9912109375, 170.86959838867188, -404.9246826171875),
        sf6 = CFrame.new(-4784, 562.8696899414062, 643.2402954101562),
        sf7 = CFrame.new(-4342, 567.869873046875, 152.49024963378906),
        sf8 = CFrame.new(-4569.5, 463.4696960449219, 511.990234375)
    }
}


local np = nil
local zne = nil
local sfe = nil
spawn(function()
    while task.wait() do 
        if World1 then
            np = npcs.World1[_G.tpnp]
			zne = zones.World1[_G.tpz]
			sfe = safeZones.World1[_G.tpsf]
        elseif World2 then
            np = npcs.World2[_G.tpnp]
			zne = zones.World2[_G.tpz]
			sfe = safeZones.World2[_G.tpsf]
        elseif World3 then
            np = npcs.World3[_G.tpnp]
			zne = zones.World3[_G.tpz]
			sfe = safeZones.World3[_G.tpsf]
        end

        if np and _G.Tp1 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = np
        elseif zne and _G.Tp2 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = zne
        elseif sfe and _G.Tp3 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = sfe
        end
    end
end)



if _G.Bahasa == "indo" then

	D:AddToggle("spin Sampai Dapet Epic",_G.Epic,function(value)
		_G.Epic = value
	end)

	D:AddToggle("spin Sampai Dapet Legendary",_G.Legend,function(value)
		_G.Legend = value
	end)

	D:AddToggle("spin Sampai Dapet Mythical",_G.Mythic,function(value)
		_G.Mythic = value
	end)

else

	D:AddToggle("Spin Until Get Epic",_G.Epic,function(value)
		_G.Epic = value
	end)

	D:AddToggle("Spin Until Get Legendary",_G.Legend,function(value)
		_G.Legend = value
	end)

	D:AddToggle("Spin Until Get Mythical",_G.Mythic,function(value)
		_G.Mythic = value
	end)

end

local currfruit = GetFruit()
local wantedfruits1 = {}
local wantedfruits2 = {}
local wantedfruits3 = {}
local p = game:GetService("Players").LocalPlayer.PlayerGui.UI.Spin
for i,v in pairs(p.FruitList["4"].Inner:GetDescendants()) do
	if v:IsA("TextButton") then
		table.insert(wantedfruits1, v.Name)
	end
end
for i,v in pairs(p.FruitList["5"].Inner:GetDescendants()) do
	if v:IsA("TextButton") then
		table.insert(wantedfruits2, v.Name)
	end
end
for i,v in pairs(p.FruitList["6"].Inner:GetDescendants()) do
	if v:IsA("TextButton") then
		table.insert(wantedfruits3, v.Name)
	end
end

spawn(function()
    while task.wait() do 
        if _G.Epic then
			repeat
				wait(0.5)
				local string_1 = "FruitsHandler";
				local string_2 = "Spin";
				local table_1 = {
				
				};
				local Target = game:GetService("ReplicatedStorage").Replicator;
			
				if not table.find(wantedfruits1,GetFruit()) then
				   Target:InvokeServer(string_1, string_2, table_1);
				end
			
				currfruit = GetFruit()
			until not _G.Epic or table.find(wantedfruits1,currfruit)
		elseif _G.Legend then
			repeat
				wait(0.5)
				local string_1 = "FruitsHandler";
				local string_2 = "Spin";
				local table_1 = {
				
				};
				local Target = game:GetService("ReplicatedStorage").Replicator;
			
				if not table.find(wantedfruits2,GetFruit()) then
				   Target:InvokeServer(string_1, string_2, table_1);
				end
			
				currfruit = GetFruit()
			until not _G.Legend or table.find(wantedfruits2,currfruit)
		elseif _G.Mythic then
			repeat
				wait(0.5)
				local string_1 = "FruitsHandler";
				local string_2 = "Spin";
				local table_1 = {
				
				};
				local Target = game:GetService("ReplicatedStorage").Replicator;
			
				if not table.find(wantedfruits3,GetFruit()) then
				   Target:InvokeServer(string_1, string_2, table_1);
				end
			
				currfruit = GetFruit()
			until not _G.Mythic or table.find(wantedfruits3,currfruit)
		end
	end
end)

D:AddLine()

local MobKilled = D:AddLabel("Your Gems : ")
spawn(function()
	pcall(function()
		while task.wait() do
			MobKilled:Set("Your Gems : ".. game:GetService("Players").LocalPlayer["MAIN_DATA"].Gems.Value)
		end
	end)
end)
local MobKilledS = D:AddLabel("Legendary Pity : ")
spawn(function()
	pcall(function()
		while task.wait() do
			MobKilledS:Set("Legendary Pity : ".. game:GetService("Players").LocalPlayer["MAIN_DATA"].LegendaryPity.Value.. " / 320")
		end
	end)
end)
local MobKilledSS = D:AddLabel("Epic Pity : ")
spawn(function()
	pcall(function()
		while task.wait() do
			MobKilledSS:Set("Epic Pity : ".. game:GetService("Players").LocalPlayer["MAIN_DATA"].LegendaryPity.Value.. " / 160")
		end
	end)
end)
local MobKilledSSX = D:AddLabel("Rare Pity : ")
spawn(function()
	pcall(function()
		while task.wait() do
			MobKilledSSX:Set("Rare Pity : ".. game:GetService("Players").LocalPlayer["MAIN_DATA"].RarePity.Value.. " / 160")
		end
	end)
end)
local MobKilledSSD = D:AddLabel(" ")
spawn(function()
	pcall(function()
		while task.wait() do
			MobKilledSSD:Set("".. game:GetService("Players").LocalPlayer.PlayerGui.UI.Spin.PityTimer.Text)
		end
	end)
end)


if _G.Bahasa == "indo" then

	mic:AddButton("Redem Code Di Game Ini",function(value)
		local codes = {"BUGFIXOP","250QUARTER!","240GASSED","230GANGG","BRO220K","GETKRAZYY!","260BELIEVE","KRAZYGASSED","LIGHTNINGHYPE", "660ALMOST", "GIFTEDFROMABOVE", "FLYH1GH!", "ITSTIMEEE"}
		for i,v in pairs(codes) do
		local string_1 = "Codes";
		local string_2 = "Redeem";
		local table_1 = {
		["Code"] = v
		};
		game:GetService("ReplicatedStorage").Replicator:InvokeServer(string_1, string_2, table_1);
		end
	end)

	mic:AddLine()

	mic:AddButton("Pindah Server ( Hop )",function(value)
		HopServer()
	end)

	mic:AddButton("Masuk Ulang Server ( Re-Join )",function(value)
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)

else

	mic:AddButton("Reedem Code In This Game",function(value)
		local codes = {"670AHH", "POW680K!", "BUGFIXOP","250QUARTER!","240GASSED","230GANGG","BRO220K","GETKRAZYY!","260BELIEVE","KRAZYGASSED","LIGHTNINGHYPE", "660ALMOST", "GIFTEDFROMABOVE", "FLYH1GH!", "ITSTIMEEE"}
		for i,v in pairs(codes) do
		local string_1 = "Codes";
		local string_2 = "Redeem";
		local table_1 = {
		["Code"] = v
		};
		game:GetService("ReplicatedStorage").Replicator:InvokeServer(string_1, string_2, table_1);
		end
	end)

	mic:AddLine()

	mic:AddButton("Hop Server",function(value)
		HopServer()
	end)

	mic:AddButton("Re-Join Server",function(value)
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)

end
