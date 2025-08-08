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
    HyperCahaya(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    _G.Clip = false
    task.wait(.1)
    SAT:SetSAT(false)
end)
Library:Finish()


local H = Library:AddTab("Info","14602166612")
local Main = Library:AddTab("Main","14614308263")
local Sett = Library:AddTab("Setting","15759774881") 
local T = Library:AddTab("Teleport","14614380750")

local Time = H:AddLabel("Executor Time");spawn(function() getgenv().Time = true;while wait() do wait(.1) UpdateTime() end end);function UpdateTime() local date = os.date("*t");local hour = (date.hour) % 24;local ampm = hour < 12 and "AM" or "PM";local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm);local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year);local LocalizationService = game:GetService("LocalizationService");local Players = game:GetService("Players");local player = Players.LocalPlayer;local name = player.Name;local result, code = pcall(function()   return LocalizationService:GetCountryRegionForPlayerAsync(player)  end);Time:Set(" : " .. timezone);Time:Set("Executor Time: " .. datetime .. " [ " .. code .. " ]");spawn(function() if getgenv().Time then pcall(function()  while wait() do  Time()  end end) end end) end

H:AddLabel("[🌐] Website : isnahamzah.tech ")
H:AddLabel("[💬] Discord : discord.gg/isnahamzah ")
H:AddLabel("[🎥] Youtube : @isnahamzah ") 
H:AddLabel("[📀] Executor : ".. identifyexecutor())
H:AddLabel("[💎] Rank : Free ")
H:AddLabel("#StayGanteng") 
H:AddLabel("#GantengHubOnTop")
H:AddLine()

Main:AddToggle("Stop Jika Dapat Epic",_G.Epic,function(value)
    _G.Epic = value
end)

Main:AddToggle("Stop Jika Dapat Legendary",_G.Legend,function(value)
    _G.Legend = value
end)

Main:AddToggle("Stop Jika Dapat Mythical",_G.Mythic,function(value)
    _G.Mythic = value
end)



local wantedfruits = {}

function gatherFruits(path)
    local fruits = {}
    for i, v in pairs(path:GetDescendants()) do
        if v:IsA("TextButton") then
            table.insert(fruits, v.Name)
        end
    end
    return fruits
end

spawn(function()
    while task.wait(0.5) do
        if _G.Epic then
            gatherFruits(game:GetService("Players").LocalPlayer.PlayerGui.UI.Spin.FruitList["4"].Inner)
        end
        if _G.Legendary then
            gatherFruits(game:GetService("Players").LocalPlayer.PlayerGui.UI.Spin.FruitList["5"].Inner)
        end
        if _G.Mythic then
            gatherFruits(game:GetService("Players").LocalPlayer.PlayerGui.UI.Spin.FruitList["6"].Inner)
        end
    end
end)

Main:AddButton("Pencet", function()
	for i, fruitName in ipairs(wantedfruits) do
		print(i, fruitName)
	end
end)
