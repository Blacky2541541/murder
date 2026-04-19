-- Murder Mystery Script mit allen gewünschten Funktionen
-- Ersteller: Venice

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- UI Erstellung
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MurderMysteryHack"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(0, 500, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Murder Mystery Hack by Venice"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0, 460, 0, 10)
CloseButton.Size = UDim2.new(0, 30, 0, 20)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

local Tabs = Instance.new("Frame")
Tabs.Name = "Tabs"
Tabs.Parent = MainFrame
Tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0, 0, 0, 40)
Tabs.Size = UDim2.new(0, 500, 0, 40)

local MainTab = Instance.new("TextButton")
MainTab.Name = "MainTab"
MainTab.Parent = Tabs
MainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainTab.BorderSizePixel = 0
MainTab.Position = UDim2.new(0, 10, 0, 5)
MainTab.Size = UDim2.new(0, 90, 0, 30)
MainTab.Font = Enum.Font.Gotham
MainTab.Text = "Main"
MainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTab.TextSize = 14

local VisualsTab = Instance.new("TextButton")
VisualsTab.Name = "VisualsTab"
VisualsTab.Parent = Tabs
VisualsTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
VisualsTab.BorderSizePixel = 0
VisualsTab.Position = UDim2.new(0, 110, 0, 5)
VisualsTab.Size = UDim2.new(0, 90, 0, 30)
VisualsTab.Font = Enum.Font.Gotham
VisualsTab.Text = "Visuals"
VisualsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualsTab.TextSize = 14

local CombatTab = Instance.new("TextButton")
CombatTab.Name = "CombatTab"
CombatTab.Parent = Tabs
CombatTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CombatTab.BorderSizePixel = 0
CombatTab.Position = UDim2.new(0, 210, 0, 5)
CombatTab.Size = UDim2.new(0, 90, 0, 30)
CombatTab.Font = Enum.Font.Gotham
CombatTab.Text = "Combat"
CombatTab.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatTab.TextSize = 14

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 0, 0, 80)
ContentFrame.Size = UDim2.new(0, 500, 0, 320)

-- Main Tab Content
local MainContent = Instance.new("ScrollingFrame")
MainContent.Name = "MainContent"
MainContent.Parent = ContentFrame
MainContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainContent.BorderSizePixel = 0
MainContent.Position = UDim2.new(0, 0, 0, 0)
MainContent.Size = UDim2.new(0, 500, 0, 320)
MainContent.ScrollBarThickness = 5
MainContent.Visible = true

local FlyToggle = Instance.new("TextButton")
FlyToggle.Name = "FlyToggle"
FlyToggle.Parent = MainContent
FlyToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyToggle.BorderSizePixel = 0
FlyToggle.Position = UDim2.new(0, 20, 0, 20)
FlyToggle.Size = UDim2.new(0, 100, 0, 30)
FlyToggle.Font = Enum.Font.Gotham
FlyToggle.Text = "Fly: OFF"
FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggle.TextSize = 14

local FlySpeedLabel = Instance.new("TextLabel")
FlySpeedLabel.Name = "FlySpeedLabel"
FlySpeedLabel.Parent = MainContent
FlySpeedLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FlySpeedLabel.BorderSizePixel = 0
FlySpeedLabel.Position = UDim2.new(0, 140, 0, 20)
FlySpeedLabel.Size = UDim2.new(0, 80, 0, 30)
FlySpeedLabel.Font = Enum.Font.Gotham
FlySpeedLabel.Text = "Speed: 1.0"
FlySpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedLabel.TextSize = 14

local FlySpeedSlider = Instance.new("TextButton")
FlySpeedSlider.Name = "FlySpeedSlider"
FlySpeedSlider.Parent = MainContent
FlySpeedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlySpeedSlider.BorderSizePixel = 0
FlySpeedSlider.Position = UDim2.new(0, 240, 0, 20)
FlySpeedSlider.Size = UDim2.new(0, 200, 0, 30)
FlySpeedSlider.Font = Enum.Font.Gotham
FlySpeedSlider.Text = ""
FlySpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedSlider.TextSize = 14

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Name = "SpeedToggle"
SpeedToggle.Parent = MainContent
SpeedToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedToggle.BorderSizePixel = 0
SpeedToggle.Position = UDim2.new(0, 20, 0, 70)
SpeedToggle.Size = UDim2.new(0, 100, 0, 30)
SpeedToggle.Font = Enum.Font.Gotham
SpeedToggle.Text = "Speed: OFF"
SpeedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedToggle.TextSize = 14

local FindMurderToggle = Instance.new("TextButton")
FindMurderToggle.Name = "FindMurderToggle"
FindMurderToggle.Parent = MainContent
FindMurderToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FindMurderToggle.BorderSizePixel = 0
FindMurderToggle.Position = UDim2.new(0, 20, 0, 120)
FindMurderToggle.Size = UDim2.new(0, 150, 0, 30)
FindMurderToggle.Font = Enum.Font.Gotham
FindMurderToggle.Text = "Find Murder: OFF"
FindMurderToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FindMurderToggle.TextSize = 14

-- Visuals Tab Content
local VisualsContent = Instance.new("ScrollingFrame")
VisualsContent.Name = "VisualsContent"
VisualsContent.Parent = ContentFrame
VisualsContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
VisualsContent.BorderSizePixel = 0
VisualsContent.Position = UDim2.new(0, 0, 0, 0)
VisualsContent.Size = UDim2.new(0, 500, 0, 320)
VisualsContent.ScrollBarThickness = 5
VisualsContent.Visible = false

local ItemEspToggle = Instance.new("TextButton")
ItemEspToggle.Name = "ItemEspToggle"
ItemEspToggle.Parent = VisualsContent
ItemEspToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ItemEspToggle.BorderSizePixel = 0
ItemEspToggle.Position = UDim2.new(0, 20, 0, 20)
ItemEspToggle.Size = UDim2.new(0, 150, 0, 30)
ItemEspToggle.Font = Enum.Font.Gotham
ItemEspToggle.Text = "Item ESP: OFF"
ItemEspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemEspToggle.TextSize = 14

local PlayerEspToggle = Instance.new("TextButton")
PlayerEspToggle.Name = "PlayerEspToggle"
PlayerEspToggle.Parent = VisualsContent
PlayerEspToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerEspToggle.BorderSizePixel = 0
PlayerEspToggle.Position = UDim2.new(0, 20, 0, 70)
PlayerEspToggle.Size = UDim2.new(0, 150, 0, 30)
PlayerEspToggle.Font = Enum.Font.Gotham
PlayerEspToggle.Text = "Player ESP: OFF"
PlayerEspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerEspToggle.TextSize = 14

-- Combat Tab Content
local CombatContent = Instance.new("ScrollingFrame")
CombatContent.Name = "CombatContent"
CombatContent.Parent = ContentFrame
CombatContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CombatContent.BorderSizePixel = 0
CombatContent.Position = UDim2.new(0, 0, 0, 0)
CombatContent.Size = UDim2.new(0, 500, 0, 320)
CombatContent.ScrollBarThickness = 5
CombatContent.Visible = false

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Parent = CombatContent
AimbotToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AimbotToggle.BorderSizePixel = 0
AimbotToggle.Position = UDim2.new(0, 20, 0, 20)
AimbotToggle.Size = UDim2.new(0, 150, 0, 30)
AimbotToggle.Font = Enum.Font.Gotham
AimbotToggle.Text = "Aimbot: OFF"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.TextSize = 14

-- Variablen
local flyEnabled = false
local speedEnabled = false
local itemEspEnabled = false
local playerEspEnabled = false
local aimbotEnabled = false
local findMurderEnabled = false
local flySpeed = 1.0
local murder = nil
local espObjects = {}

-- Fly Funktion (korrigiert)
local function fly()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") or not Character:FindFirstChild("HumanoidRootPart") then return end
    
    local Humanoid = Character.Humanoid
    local HumanoidRootPart = Character.HumanoidRootPart
    
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = HumanoidRootPart
    
    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.Parent = HumanoidRootPart
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not flyEnabled then
            bv:Destroy()
            bg:Destroy()
            Humanoid.PlatformStand = false  -- Wichtig: PlatformStand zurücksetzen
            connection:Disconnect()
            return
        end
        
        Humanoid.PlatformStand = true
        -- Korrigierte Steuerung (vorwärts ist jetzt wirklich vorwärts)
        local moveDir = Vector3.new(
            (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
            (UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and 1 or 0),
            (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
        )
        
        if moveDir ~= Vector3.new() then
            moveDir = moveDir.Unit
        end
        
        -- Bewegung relativ zur Kamerarichtung
        local cameraDirection = workspace.CurrentCamera.CFrame.LookVector
        local rightDirection = workspace.CurrentCamera.CFrame.RightVector
        
        local relativeMove = (rightDirection * moveDir.X + cameraDirection * (-moveDir.Z) + Vector3.new(0, moveDir.Y, 0))
        bv.Velocity = relativeMove * flySpeed * 20
        bg.CFrame = CFrame.new(HumanoidRootPart.Position, HumanoidRootPart.Position + cameraDirection)
    end)
end

-- Speed Funktion
local function speed()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") then return end
    
    local Humanoid = Character.Humanoid
    local originalWalkSpeed = Humanoid.WalkSpeed
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not speedEnabled then
            Humanoid.WalkSpeed = originalWalkSpeed
            connection:Disconnect()
            return
        end
        
        Humanoid.WalkSpeed = flySpeed * 10
    end)
end

-- Item ESP Funktion
local function createItemESP(item)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "ItemESP"
    BillboardGui.Parent = item
    BillboardGui.Adornee = item
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = item.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, BillboardGui)
end

-- Player ESP Funktion
local function createPlayerESP(player)
    local Character = player.Character
    if not Character then return end
    
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "PlayerESP"
    Highlight.Parent = Character
    Highlight.FillColor = Color3.fromRGB(255, 0, 0)
    Highlight.FillTransparency = 0.5
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "NameESP"
    BillboardGui.Parent = Character:FindFirstChild("Head")
    BillboardGui.Adornee = Character:FindFirstChild("Head")
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = player.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, Highlight)
    table.insert(espObjects, BillboardGui)
end

-- Murder ESP Funktion
local function createMurderESP(player)
    local Character = player.Character
    if not Character then return end
    
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "MurderESP"
    Highlight.Parent = Character
    Highlight.FillColor = Color3.fromRGB(0, 0, 255)
    Highlight.FillTransparency = 0.5
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "MurderNameESP"
    BillboardGui.Parent = Character:FindFirstChild("Head")
    BillboardGui.Adornee = Character:FindFirstChild("Head")
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = "MURDERER: " .. player.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, Highlight)
    table.insert(espObjects, BillboardGui)
end

-- Find Murder Funktion
local function findMurder()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local Character = player.Character
            if Character and Character:FindFirstChild("Tool") then
                local Tool = Character:FindFirstChild("Tool")
                if Tool and Tool.Name == "Knife" then
                    murder = player
                    createMurderESP(player)
                    return player
                end
            end
        end
    end
    return nil
end

-- Aimbot Funktion
local function aimbot()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") then return end
    
    local closestPlayer = nil
    local closestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
            
            -- Ignoriere Teamkollegen
            if player.Team ~= LocalPlayer.Team then
                -- Zielt auf den Mörder, wenn Find Murder aktiviert ist
                if findMurderEnabled and murder and player == murder then
                    closestPlayer = player
                    closestDistance = distance
                -- Ansonsten auf den nächsten Gegner
                elseif not findMurderEnabled and distance < closestDistance then
                    closestPlayer = player
                    closestDistance = distance
                end
            end
        end
    end
    
    if closestPlayer and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
        local lookVector = (targetPosition - Character.HumanoidRootPart.Position).Unit
        local targetCFrame = CFrame.new(Character.HumanoidRootPart.Position, targetPosition)
        
        Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame:Lerp(targetCFrame, 0.1)
    end
end

-- Event Handler
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MainTab.MouseButton1Click:Connect(function()
    MainContent.Visible = true
    VisualsContent.Visible = false
    CombatContent.Visible = false
    
    MainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CombatTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
end)

VisualsTab.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    VisualsContent.Visible = true
    CombatContent.Visible = false
    
    MainTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    CombatTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
end)

CombatTab.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    VisualsContent.Visible = false
    CombatContent.Visible = true
    
    MainTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CombatTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

FlyToggle.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    FlyToggle.Text = "Fly: " .. (flyEnabled and "ON" or "OFF")
    
    if flyEnabled then
        fly()
    end
end)

SpeedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedToggle.Text = "Speed: " .. (speedEnabled and "ON" or "OFF")
    
    if speedEnabled then
        speed()
    end
end)

ItemEspToggle.MouseButton1Click:Connect(function()
    itemEspEnabled = not itemEspEnabled
    ItemEspToggle.Text = "Item ESP: " .. (itemEspEnabled and "ON" or "OFF")
    
    if itemEspEnabled then
        for _, item in ipairs(workspace:GetDescendants()) do
            if item:IsA("Tool") and item.Parent ~= LocalPlayer.Character then
                createItemESP(item)
            end
        end
        
        workspace.ChildAdded:Connect(function(child)
            if itemEspEnabled and child:IsA("Tool") and child.Parent ~= LocalPlayer.Character then
                createItemESP(child)
            end
        end)
    else
        for _, obj in ipairs(espObjects) do
            if obj.Name == "ItemESP" then
                obj:Destroy()
            end
        end
    end
end)

PlayerEspToggle.MouseButton1Click:Connect(function()
    playerEspEnabled = not playerEspEnabled
    PlayerEspToggle.Text = "Player ESP: " .. (playerEspEnabled and "ON" or "OFF")
    
    if playerEspEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                createPlayerESP(player)
            end
        end
        
        Players.PlayerAdded:Connect(function(player)
            if playerEspEnabled then
                createPlayerESP(player)
            end
        end)
    else
        for _, obj in ipairs(espObjects) do
            if obj.Name == "PlayerESP" or obj.Name == "NameESP" then
                obj:Destroy()
            end
        end
    end
end)

AimbotToggle.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    AimbotToggle.Text = "Aimbot: " .. (aimbotEnabled and "ON" or "OFF")
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not aimbotEnabled then
            connection:Disconnect()
            return
        end
        
        aimbot()
    end)
end)

FindMurderToggle.MouseButton1Click:Connect(function()
    findMurderEnabled = not findMurderEnabled
    FindMurderToggle.Text = "Find Murder: " .. (findMurderEnabled and "ON" or "OFF")
    
    if findMurderEnabled then
        findMurder()
    else
        murder = nil
        for _, obj in ipairs(espObjects) do
            if obj.Name == "MurderESP" or obj.Name == "MurderNameESP" then
                obj:Destroy()
            end
        end
    end
end)

-- Fly Speed Slider
local isDragging = false

FlySpeedSlider.MouseButton1Down:Connect(function()
    isDragging = true
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local sliderPos = FlySpeedSlider.AbsolutePosition
        local sliderSize = FlySpeedSlider.AbsoluteSize
        
        local relativeX = math.clamp((mousePos.X - sliderPos.X) / sliderSize.X, 0, 1)
        flySpeed = 0.1 + relativeX * 49.9
        FlySpeedLabel.Text = "Speed: " .. string.format("%.1f", flySpeed)
        
        -- Update slider fill
        local fill = FlySpeedSlider:FindFirstChild("Fill")
        if not fill then
            fill = Instance.new("Frame")
            fill.Name = "Fill"
            fill.Parent = FlySpeedSlider
            fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            fill.BorderSizePixel = 0
            fill.Position = UDim2.new(0, 0, 0, 0)
            fill.Size = UDim2.new(relativeX, 0, 1, 0)
        else
            fill.Size = UDim2.new(relativeX, 0, 1, 0)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- Initialisierung
local function initialize()
    -- Setze initialen Slider-Wert
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Parent = FlySpeedSlider
    fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    fill.BorderSizePixel = 0
    fill.Position = UDim2.new(0, 0, 0, 0)
    fill.Size = UDim2.new(0.018, 0, 1, 0)  -- 0.1 / 50.0 = 0.018
    
    -- Überprüfe periodisch nach dem Mörder
    local function checkForMurder()
        if findMurderEnabled then
            local newMurder = findMurder()
            if newMurder and newMurder ~= murder then
                murder = newMurder
                -- Entferne alte Murder ESP
                for _, obj in ipairs(espObjects) do
                    if obj.Name == "MurderESP" or obj.Name == "MurderNameESP" then
                        obj:Destroy()
                    end
                end
                -- Erstelle neue Murder ESP
                createMurderESP(murder)
            end
        end
    end
    
    -- Überprüfe alle 2 Sekunden nach dem Mörder
    spawn(function()
        while true do
            wait(2)
            checkForMurder()
        end
    end)
end

initialize()

print("Murder Mystery Hack by Venice geladen!")
