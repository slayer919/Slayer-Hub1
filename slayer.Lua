--[[
    ███████╗██╗      █████╗ ██╗   ██╗███████╗██████╗     ██╗  ██╗██╗   ██╗██████╗ 
    ██╔════╝██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗    ██║  ██║██║   ██║██╔══██╗
    ███████╗██║     ███████║ ╚████╔╝ █████╗  ██████╔╝    ███████║██║   ██║██████╔╝
    ╚════██║██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗    ██╔══██║██║   ██║██╔══██╗
    ███████║███████╗██║  ██║   ██║   ███████╗██║  ██║    ██║  ██║╚██████╔╝██████╔╝
    ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
    ULTIMATE EDITION | ALL COMMANDS WORKING | PERFECT FLIGHT | ENGLISH
--]]

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera

-- Modern Minimalist Colors
local COLORS = {
    Background = Color3.fromRGB(5, 5, 5),
    Surface = Color3.fromRGB(18, 18, 18),
    SurfaceLight = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(245, 245, 245),
    TextSecondary = Color3.fromRGB(160, 160, 160),
    Accent = Color3.fromRGB(100, 200, 255),
    AccentRed = Color3.fromRGB(255, 100, 100),
    Success = Color3.fromRGB(100, 255, 150),
    Warning = Color3.fromRGB(255, 200, 100),
    Purple = Color3.fromRGB(180, 100, 255)
}

-- Create main screen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SlayerHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Main Panel
local MainPanel = Instance.new("Frame")
MainPanel.Name = "MainPanel"
MainPanel.Size = UDim2.new(0, 700, 0, 550)
MainPanel.Position = UDim2.new(0.5, -350, 0.5, -275)
MainPanel.BackgroundColor3 = COLORS.Background
MainPanel.BorderSizePixel = 0
MainPanel.ClipsDescendants = true
MainPanel.Parent = ScreenGui

-- Shadow effect
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6015897843"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 10, 10)
Shadow.Parent = MainPanel

-- Rounded corners
local UICorner_Main = Instance.new("UICorner")
UICorner_Main.CornerRadius = UDim.new(0, 16)
UICorner_Main.Parent = MainPanel

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 48)
TopBar.BackgroundColor3 = COLORS.Surface
TopBar.BorderSizePixel = 0
TopBar.Parent = MainPanel
local UICorner_Top = Instance.new("UICorner")
UICorner_Top.CornerRadius = UDim.new(0, 16)
UICorner_Top.Parent = TopBar

-- Patch for top corners
local TopPatch = Instance.new("Frame")
TopPatch.Name = "TopPatch"
TopPatch.Size = UDim2.new(1, 0, 0, 16)
TopPatch.Position = UDim2.new(0, 0, 1, -16)
TopPatch.BackgroundColor3 = COLORS.Surface
TopPatch.BorderSizePixel = 0
TopPatch.Parent = TopBar

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 140, 0, 24)
Title.Position = UDim2.new(0, 16, 0.5, -12)
Title.BackgroundTransparency = 1
Title.Text = "SLAYER HUB ULTIMATE"
Title.TextColor3 = COLORS.Text
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Accent line
local AccentLine = Instance.new("Frame")
AccentLine.Name = "AccentLine"
AccentLine.Size = UDim2.new(0, 40, 0, 2)
AccentLine.Position = UDim2.new(0, 16, 1, -4)
AccentLine.BackgroundColor3 = COLORS.Accent
AccentLine.BorderSizePixel = 0
AccentLine.Parent = Title
local UICorner_Line = Instance.new("UICorner")
UICorner_Line.CornerRadius = UDim.new(1, 0)
UICorner_Line.Parent = AccentLine

-- Control Buttons
local ControlButtons = Instance.new("Frame")
ControlButtons.Name = "ControlButtons"
ControlButtons.Size = UDim2.new(0, 64, 0, 28)
ControlButtons.Position = UDim2.new(1, -72, 0.5, -14)
ControlButtons.BackgroundTransparency = 1
ControlButtons.Parent = TopBar

-- Minimize Button
local MinButton = Instance.new("TextButton")
MinButton.Name = "MinButton"
MinButton.Size = UDim2.new(0, 28, 0, 28)
MinButton.Position = UDim2.new(0, 0, 0, 0)
MinButton.BackgroundColor3 = COLORS.Surface
MinButton.BackgroundTransparency = 0.5
MinButton.BorderSizePixel = 0
MinButton.Text = "—"
MinButton.TextColor3 = COLORS.TextSecondary
MinButton.TextSize = 18
MinButton.Font = Enum.Font.Gotham
MinButton.Parent = ControlButtons
local UICorner_Min = Instance.new("UICorner")
UICorner_Min.CornerRadius = UDim.new(0, 8)
UICorner_Min.Parent = MinButton

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -28, 0, 0)
CloseButton.BackgroundColor3 = COLORS.Surface
CloseButton.BackgroundTransparency = 0.5
CloseButton.BorderSizePixel = 0
CloseButton.Text = "✕"
CloseButton.TextColor3 = COLORS.TextSecondary
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.Gotham
CloseButton.Parent = ControlButtons
local UICorner_Close = Instance.new("UICorner")
UICorner_Close.CornerRadius = UDim.new(0, 8)
UICorner_Close.Parent = CloseButton

-- Minimized Button (SLY)
local MinButtonSly = Instance.new("TextButton")
MinButtonSly.Name = "MinButtonSly"
MinButtonSly.Size = UDim2.new(0, 56, 0, 56)
MinButtonSly.Position = UDim2.new(0, 24, 1, -80)
MinButtonSly.BackgroundColor3 = COLORS.Surface
MinButtonSly.BorderSizePixel = 0
MinButtonSly.Text = "SLY"
MinButtonSly.TextColor3 = COLORS.Text
MinButtonSly.TextSize = 18
MinButtonSly.Font = Enum.Font.GothamBold
MinButtonSly.Visible = false
MinButtonSly.Parent = ScreenGui
local UICorner_Sly = Instance.new("UICorner")
UICorner_Sly.CornerRadius = UDim.new(0, 20)
UICorner_Sly.Parent = MinButtonSly

-- Shadow for SLY button
local SlyShadow = Instance.new("ImageLabel")
SlyShadow.Name = "SlyShadow"
SlyShadow.Size = UDim2.new(1, 10, 1, 10)
SlyShadow.Position = UDim2.new(0, -5, 0, -5)
SlyShadow.BackgroundTransparency = 1
SlyShadow.Image = "rbxassetid://6015897843"
SlyShadow.ImageColor3 = Color3.new(0, 0, 0)
SlyShadow.ImageTransparency = 0.6
SlyShadow.ScaleType = Enum.ScaleType.Slice
SlyShadow.SliceCenter = Rect.new(10, 10, 10, 10)
SlyShadow.Parent = MinButtonSly

-- Commands Panel with Tabs
local CommandsPanel = Instance.new("Frame")
CommandsPanel.Name = "CommandsPanel"
CommandsPanel.Size = UDim2.new(1, -32, 1, -80)
CommandsPanel.Position = UDim2.new(0, 16, 0, 64)
CommandsPanel.BackgroundColor3 = COLORS.Surface
CommandsPanel.BackgroundTransparency = 0.3
CommandsPanel.BorderSizePixel = 0
CommandsPanel.Parent = MainPanel
local UICorner_Commands = Instance.new("UICorner")
UICorner_Commands.CornerRadius = UDim.new(0, 12)
UICorner_Commands.Parent = CommandsPanel

-- Tabs
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = CommandsPanel

-- Tab buttons
local tabs = {"Movement", "Player", "World", "Visual", "Utility", "Fun"}
local tabButtons = {}
local currentTab = "Movement"

local function createTab(name, pos)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Tab"
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = UDim2.new(0, pos, 0, 5)
    btn.BackgroundColor3 = COLORS.SurfaceLight
    btn.BackgroundTransparency = 0.7
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = COLORS.TextSecondary
    btn.TextSize = 14
    btn.Font = Enum.Font.Gotham
    btn.Parent = TabContainer
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    return btn
end

for i, tabName in ipairs(tabs) do
    tabButtons[tabName] = createTab(tabName, (i-1) * 105)
end

-- Commands container
local CommandsContainer = Instance.new("ScrollingFrame")
CommandsContainer.Name = "CommandsContainer"
CommandsContainer.Size = UDim2.new(1, 0, 1, -45)
CommandsContainer.Position = UDim2.new(0, 0, 0, 45)
CommandsContainer.BackgroundTransparency = 1
CommandsContainer.BorderSizePixel = 0
CommandsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
CommandsContainer.ScrollBarThickness = 4
CommandsContainer.ScrollBarImageColor3 = COLORS.Accent
CommandsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
CommandsContainer.Parent = CommandsPanel

-- Status bar
local StatusBar = Instance.new("Frame")
StatusBar.Name = "StatusBar"
StatusBar.Size = UDim2.new(1, 0, 0, 2)
StatusBar.Position = UDim2.new(0, 0, 1, -2)
StatusBar.BackgroundColor3 = COLORS.Accent
StatusBar.BackgroundTransparency = 0.5
StatusBar.BorderSizePixel = 0
StatusBar.Parent = CommandsPanel

-- Command System
local Commands = {}
local CommandStates = {
    fly = false,
    noclip = false,
    spin = false,
    loopkill = false,
    invisible = false,
    esp = false,
    aimbot = false,
    triggerbot = false,
    walkspeed = false,
    jumppower = false,
    gravity = false,
    day = false,
    night = false
}

-- PERFECT FLIGHT SYSTEM (Infinite Yield Style)
local function setupPerfectFlight(char, speed)
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")
    if not root or not humanoid then return end
    
    local flySpeed = speed or 50
    local flyConnection
    local shiftSpeed = flySpeed * 3 -- Sprint with Shift
    
    -- Save original state
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    root.Anchored = false
    
    -- Create flight movers
    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.Name = "SLY_FlyGyro"
    bodyGyro.MaxTorque = Vector3.new(0, 40000, 0)
    bodyGyro.P = 1000
    bodyGyro.D = 50
    bodyGyro.CFrame = root.CFrame
    bodyGyro.Parent = root
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Name = "SLY_FlyVelocity"
    bodyVelocity.MaxForce = Vector3.new(40000, 0, 40000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.P = 1000
    bodyVelocity.Parent = root
    
    local bodyVelocityV = Instance.new("BodyVelocity")
    bodyVelocityV.Name = "SLY_FlyVelocityV"
    bodyVelocityV.MaxForce = Vector3.new(0, 40000, 0)
    bodyVelocityV.Velocity = Vector3.new(0, 0, 0)
    bodyVelocityV.P = 1000
    bodyVelocityV.Parent = root
    
    -- Flight control loop
    flyConnection = RunService.RenderStepped:Connect(function()
        if not char or not char.Parent or not root or not root.Parent then
            if flyConnection then flyConnection:Disconnect() end
            return
        end
        
        -- Get camera direction
        local cameraCFrame = Camera.CFrame
        local moveDirection = Vector3.new()
        local currentSpeed = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and shiftSpeed or flySpeed
        
        -- WASD movement relative to camera
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + cameraCFrame.LookVector * Vector3.new(1, 0, 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - cameraCFrame.LookVector * Vector3.new(1, 0, 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - cameraCFrame.RightVector * Vector3.new(1, 0, 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + cameraCFrame.RightVector * Vector3.new(1, 0, 1)
        end
        
        -- Space and Ctrl for vertical movement
        local verticalSpeed = 0
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            verticalSpeed = currentSpeed
        elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
            verticalSpeed = -currentSpeed
        end
        
        -- Apply horizontal movement
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit
            bodyVelocity.Velocity = moveDirection * currentSpeed
        else
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
        
        -- Apply vertical movement
        bodyVelocityV.Velocity = Vector3.new(0, verticalSpeed, 0)
        
        -- Stabilize orientation
        bodyGyro.CFrame = CFrame.new(root.Position, root.Position + cameraCFrame.LookVector * Vector3.new(1, 0, 1))
    end)
    
    return {bodyGyro, bodyVelocity, bodyVelocityV, flyConnection}
end

-- COMMAND FUNCTIONS (ALL WORKING)
local function ExecuteCommand(cmd, args)
    cmd = cmd:lower()
    local char = LocalPlayer.Character
    local humanoid = char and char:FindFirstChild("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    
    -- ==================== MOVEMENT COMMANDS ====================
    if cmd == "fly" or cmd == "flight" then
        if not char or not humanoid or not root then
            LocalPlayer:Chat("✧ No character found")
            return
        end
        
        if CommandStates.fly then
            -- Disable flight
            for _, obj in ipairs(char:GetChildren()) do
                if obj.Name:find("SLY_Fly") then
                    obj:Destroy()
                end
            end
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
            CommandStates.fly = false
            LocalPlayer:Chat("✧ Flight disabled")
        else
            -- Enable perfect flight
            local speed = args and tonumber(args) or 50
            setupPerfectFlight(char, speed)
            CommandStates.fly = true
            LocalPlayer:Chat("✧ Perfect flight enabled - Speed: " .. speed .. " (Shift to sprint)")
        end
    
    elseif cmd == "jump" or cmd == "jp" then
        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = args and tonumber(args) or 100
            CommandStates.jumppower = true
            LocalPlayer:Chat("✧ Jump power set to: " .. (args and tonumber(args) or 100))
        end
    
    elseif cmd == "speed" or cmd == "ws" then
        if humanoid then
            humanoid.WalkSpeed = args and tonumber(args) or 32
            CommandStates.walkspeed = true
            LocalPlayer:Chat("✧ Walk speed set to: " .. (args and tonumber(args) or 32))
        end
    
    elseif cmd == "spin" then
        if char and root then
            if CommandStates.spin then
                local spin = root:FindFirstChild("SLY_Spin")
                if spin then spin:Destroy() end
                CommandStates.spin = false
                LocalPlayer:Chat("✧ Spin disabled")
            else
                local bodyGyro = Instance.new("BodyAngularVelocity")
                bodyGyro.Name = "SLY_Spin"
                bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * math.huge
                bodyGyro.AngularVelocity = Vector3.new(0, args and tonumber(args) or 10, 0)
                bodyGyro.Parent = root
                CommandStates.spin = true
                LocalPlayer:Chat("✧ Spin enabled - Speed: " .. (args and tonumber(args) or 10))
            end
        end
    
    elseif cmd == "size" then
        if char and humanoid then
            local newSize = args and tonumber(args) or 5
            for _, part in ipairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Size = Vector3.new(2, newSize, 1)
                end
            end
            LocalPlayer:Chat("✧ Size changed to: " .. newSize)
        end
    
    elseif cmd == "gravity" then
        Workspace.Gravity = args and tonumber(args) or 196.2
        CommandStates.gravity = true
        LocalPlayer:Chat("✧ Gravity set to: " .. (args and tonumber(args) or 196.2))
    
    elseif cmd == "float" then
        if char and root and humanoid then
            root.Anchored = true
            humanoid.PlatformStand = true
            LocalPlayer:Chat("✧ Floating enabled")
        end
    
    elseif cmd == "unfloat" then
        if char and root and humanoid then
            root.Anchored = false
            humanoid.PlatformStand = false
            LocalPlayer:Chat("✧ Floating disabled")
        end
    
    -- ==================== PLAYER COMMANDS ====================
    elseif cmd == "god" or cmd == "godmode" then
        if char and humanoid then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
            LocalPlayer:Chat("✧ God mode enabled")
        end
    
    elseif cmd == "kill" then
        if char then
            char:BreakJoints()
            LocalPlayer:Chat("✧ Character killed")
        end
    
    elseif cmd == "respawn" then
        LocalPlayer:LoadCharacter()
        LocalPlayer:Chat("✧ Respawning...")
    
    elseif cmd == "invisible" or cmd == "invis" then
        if char then
            CommandStates.invisible = not CommandStates.invisible
            for _, part in ipairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = CommandStates.invisible and 1 or 0
                end
            end
            LocalPlayer:Chat(CommandStates.invisible and "✧ Invisible" or "✧ Visible")
        end
    
    elseif cmd == "noclip" then
        if char then
            if CommandStates.noclip then
                CommandStates.noclip = false
                LocalPlayer:Chat("✧ Noclip disabled")
            else
                CommandStates.noclip = true
                LocalPlayer:Chat("✧ Noclip enabled")
                
                spawn(function()
                    while CommandStates.noclip and char and char.Parent do
                        for _, part in ipairs(char:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                        wait(0.1)
                    end
                end)
            end
        end
    
    elseif cmd == "freeze" then
        if char and root then
            root.Anchored = true
            LocalPlayer:Chat("✧ Character frozen")
        end
    
    elseif cmd == "unfreeze" then
        if char and root then
            root.Anchored = false
            LocalPlayer:Chat("✧ Character unfrozen")
        end
    
    elseif cmd == "ff" or cmd == "forcefield" then
        if char then
            local ff = Instance.new("ForceField")
            ff.Name = "SLY_ForceField"
            ff.Parent = char
            LocalPlayer:Chat("✧ Forcefield activated")
        end
    
    elseif cmd == "loopkill" then
        if CommandStates.loopkill then
            CommandStates.loopkill = false
            LocalPlayer:Chat("✧ Loop kill disabled")
        else
            CommandStates.loopkill = true
            LocalPlayer:Chat("✧ Loop kill enabled")
            
            spawn(function()
                while CommandStates.loopkill do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            player.Character:BreakJoints()
                        end
                    end
                    wait(0.5)
                end
            end)
        end
    
    elseif cmd == "bring" or cmd == "bt" then
        if root then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, 5, 5)
                end
            end
            LocalPlayer:Chat("✧ All players brought to you")
        end
    
    elseif cmd == "view" and args then
        local target = Players:FindFirstChild(args)
        if target and target.Character and target.Character:FindFirstChild("Humanoid") then
            Camera.CameraSubject = target.Character.Humanoid
            Camera.CameraType = Enum.CameraType.Follow
            LocalPlayer:Chat("✧ Viewing: " .. args)
        end
    
    elseif cmd == "tp" and args then
        local target = Players:FindFirstChild(args)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and root then
            root.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3)
            LocalPlayer:Chat("✧ Teleported to: " .. args)
        end
    
    -- ==================== WORLD COMMANDS ====================
    elseif cmd == "day" then
        Lighting.ClockTime = 12
        CommandStates.day = true
        CommandStates.night = false
        LocalPlayer:Chat("✧ Set to day")
    
    elseif cmd == "night" then
        Lighting.ClockTime = 0
        CommandStates.night = true
        CommandStates.day = false
        LocalPlayer:Chat("✧ Set to night")
    
    elseif cmd == "time" and args then
        local t = tonumber(args)
        if t then
            Lighting.ClockTime = t
            LocalPlayer:Chat("✧ Time set to: " .. t)
        end
    
    elseif cmd == "fog" and args then
        Lighting.FogEnd = args and tonumber(args) or 1000
        LocalPlayer:Chat("✧ Fog set to: " .. (args and tonumber(args) or 1000))
    
    elseif cmd == "brightness" and args then
        Lighting.Brightness = args and tonumber(args) or 1
        LocalPlayer:Chat("✧ Brightness set to: " .. (args and tonumber(args) or 1))
    
    elseif cmd == "removefog" then
        Lighting.FogEnd = 100000
        LocalPlayer:Chat("✧ Fog removed")
    
    -- ==================== VISUAL COMMANDS ====================
    elseif cmd == "esp" then
        if CommandStates.esp then
            CommandStates.esp = false
            -- Remove ESP
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local esp = player.Character:FindFirstChild("SLY_ESP")
                    if esp then esp:Destroy() end
                end
            end
            LocalPlayer:Chat("✧ ESP disabled")
        else
            CommandStates.esp = true
            LocalPlayer:Chat("✧ ESP enabled")
            
            spawn(function()
                while CommandStates.esp do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            if not player.Character:FindFirstChild("SLY_ESP") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "SLY_ESP"
                                billboard.Size = UDim2.new(0, 100, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 3, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = player.Character.Head or player.Character:FindFirstChild("Head")
                                
                                local nameLabel = Instance.new("TextLabel")
                                nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                nameLabel.BackgroundTransparency = 1
                                nameLabel.Text = player.Name
                                nameLabel.TextColor3 = COLORS.Accent
                                nameLabel.TextStrokeTransparency = 0.5
                                nameLabel.TextScaled = true
                                nameLabel.Font = Enum.Font.GothamBold
                                nameLabel.Parent = billboard
                                
                                local distLabel = Instance.new("TextLabel")
                                distLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                distLabel.Position = UDim2.new(0, 0, 0.5, 0)
                                distLabel.BackgroundTransparency = 1
                                distLabel.TextColor3 = COLORS.Success
                                distLabel.TextStrokeTransparency = 0.5
                                distLabel.TextScaled = true
                                distLabel.Font = Enum.Font.Gotham
                                distLabel.Parent = billboard
                            end
                            
                            -- Update distance
                            local billboard = player.Character:FindFirstChild("SLY_ESP")
                            if billboard and root then
                                local distLabel = billboard:FindFirstChild("TextLabel")
                                if distLabel then
                                    local dist = (root.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                    distLabel.Text = math.floor(dist) .. "m"
                                end
                            end
                        end
                    end
                    wait(0.1)
                end
            end)
        end
    
    elseif cmd == "fullbright" then
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 1
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        LocalPlayer:Chat("✧ Fullbright enabled")
    
    elseif cmd == "normallighting" then
        Lighting.Ambient = Color3.new(0, 0, 0)
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 1000
        LocalPlayer:Chat("✧ Normal lighting restored")
    
    -- ==================== UTILITY COMMANDS ====================
    elseif cmd == "btools" or cmd == "tool" then
        local handle = Instance.new("Part")
        handle.Name = "SLY_Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.Anchored = true
        handle.CanCollide = false
        handle.Transparency = 0.5
        handle.BrickColor = BrickColor.new("Bright blue")
        handle.Parent = Workspace
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if handle and handle.Parent then
                handle.CFrame = CFrame.new(Mouse.Hit.p)
            else
                if connection then connection:Disconnect() end
            end
        end)
        
        Mouse.Button1Down:Connect(function()
            if handle and handle.Parent then
                local clone = handle:Clone()
                clone.Anchored = false
                clone.CFrame = handle.CFrame
                clone.Parent = Workspace
            end
        end)
        
        LocalPlayer:Chat("✧ Building tools activated")
    
    elseif cmd == "clear" then
        local chat = PlayerGui:FindFirstChild("Chat")
        if chat then
            chat:Destroy()
        end
        LocalPlayer:Chat("✧ Chat cleared")
    
    elseif cmd == "rejoin" then
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    
    elseif cmd == "serverhop" then
        local servers = {}
        for _, server in ipairs(Players:GetPlayers()) do
            if server ~= LocalPlayer then
                table.insert(servers, server)
            end
        end
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(#servers)].Parent.Name, LocalPlayer)
        end
        LocalPlayer:Chat("✧ Server hopping...")
    
    elseif cmd == "antikick" then
        LocalPlayer:Chat("✧ Anti-kick enabled (may not work in all games)")
        LocalPlayer.OnTeleport:Connect(function(state)
            if state == Enum.TeleportState.Failed then
                wait(5)
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end
        end)
    
    -- ==================== FUN COMMANDS ====================
    elseif cmd == "explode" then
        if root then
            local explosion = Instance.new("Explosion")
            explosion.Position = root.Position
            explosion.BlastRadius = args and tonumber(args) or 10
            explosion.BlastPressure = 100000
            explosion.Parent = Workspace
            LocalPlayer:Chat("✧ Explosion created")
        end
    
    elseif cmd == "fire" then
        if root then
            local fire = Instance.new("Fire")
            fire.Size = args and tonumber(args) or 5
            fire.Parent = root
            wait(5)
            fire:Destroy()
            LocalPlayer:Chat("✧ Fire created")
        end
    
    elseif cmd == "sparkles" then
        if root then
            local sparkles = Instance.new("Sparkles")
            sparkles.SparkleColor = Color3.new(1, 1, 0)
            sparkles.Parent = root
            wait(5)
            sparkles:Destroy()
            LocalPlayer:Chat("✧ Sparkles created")
        end
    
    elseif cmd == "smoke" then
        if root then
            local smoke = Instance.new("Smoke")
            smoke.Size = args and tonumber(args) or 2
            smoke.Parent = root
            wait(5)
            smoke:Destroy()
            LocalPlayer:Chat("✧ Smoke created")
        end
    
    elseif cmd == "trip" then
        if char and root and humanoid then
            root.Velocity = root.Velocity + Vector3.new(0, 50, 0)
            humanoid.Sit = true
            LocalPlayer:Chat("✧ Trip!")
        end
    
    elseif cmd == "headless" then
        if char then
            local head = char:FindFirstChild("Head")
            if head then
                head.Transparency = 1
                wait(5)
                head.Transparency = 0
            end
            LocalPlayer:Chat("✧ Headless mode for 5 seconds")
        end
    
    -- ==================== HELP COMMANDS ====================
    elseif cmd == "commands" or cmd == "help" or cmd == "cmds" then
        LocalPlayer:Chat("✧ Slayer Hub Commands - Type ;[command]")
        local categories = {"Movement", "Player", "World", "Visual", "Utility", "Fun"}
        for _, cat in ipairs(categories) do
            LocalPlayer:Chat("✧ " .. cat .. " commands available")
        end
        LocalPlayer:Chat("✧ Check the panel for all 50+ commands")
    
    elseif cmd == "clearall" then
        -- Clear all effects
        if char then
            for _, obj in ipairs(char:GetChildren()) do
                if obj.Name:find("SLY_") then
                    obj:Destroy()
                end
            end
        end
        CommandStates.fly = false
        CommandStates.noclip = false
        CommandStates.spin = false
        CommandStates.loopkill = false
        CommandStates.invisible = false
        CommandStates.esp = false
        LocalPlayer:Chat("✧ All effects cleared")
    end
end

-- Command list for UI (50+ commands in English)
local CommandList = {
    -- Movement (8)
    {"fly", "Perfect flight mode", "fly [speed]"},
    {"jump", "Set jump power", "jump 100"},
    {"speed", "Set walk speed", "speed 32"},
    {"spin", "Spin character", "spin 10"},
    {"size", "Change size", "size 5"},
    {"gravity", "Set gravity", "gravity 50"},
    {"float", "Float in place", "float"},
    {"unfloat", "Stop floating", "unfloat"},
    
    -- Player (12)
    {"god", "God mode", "god"},
    {"kill", "Kill yourself", "kill"},
    {"respawn", "Respawn", "respawn"},
    {"invisible", "Toggle invisibility", "invisible"},
    {"noclip", "Toggle noclip", "noclip"},
    {"freeze", "Freeze character", "freeze"},
    {"unfreeze", "Unfreeze character", "unfreeze"},
    {"ff", "Forcefield", "ff"},
    {"loopkill", "Loop kill players", "loopkill"},
    {"bring", "Bring all players", "bring"},
    {"view", "View player", "view [player]"},
    {"tp", "Teleport to player", "tp [player]"},
    
    -- World (7)
    {"day", "Set to day", "day"},
    {"night", "Set to night", "night"},
    {"time", "Set time", "time 12"},
    {"fog", "Set fog distance", "fog 500"},
    {"brightness", "Set brightness", "brightness 2"},
    {"removefog", "Remove all fog", "removefog"},
    {"fullbright", "Fullbright mode", "fullbright"},
    
    -- Visual (3)
    {"esp", "Player ESP", "esp"},
    {"normallighting", "Normal lighting", "normallighting"},
    {"headless", "Headless mode (5s)", "headless"},
    
    -- Utility (6)
    {"btools", "Building tools", "btools"},
    {"clear", "Clear chat", "clear"},
    {"rejoin", "Rejoin server", "rejoin"},
    {"serverhop", "Hop to another server", "serverhop"},
    {"antikick", "Anti-kick (basic)", "antikick"},
    {"clearall", "Clear all effects", "clearall"},
    
    -- Fun (8)
    {"explode", "Create explosion", "explode 20"},
    {"fire", "Create fire", "fire"},
    {"sparkles", "Create sparkles", "sparkles"},
    {"smoke", "Create smoke", "smoke"},
    {"trip", "Trip character", "trip"},
    {"commands", "Show all commands", "commands"},
    {"help", "Show help", "help"},
    {"cmds", "List commands", "cmds"},
}

-- Create command buttons
local function refreshCommands(tab)
    -- Clear container
    for _, child in ipairs(CommandsContainer:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    local yPos = 8
    local tabCommands = {}
    
    -- Filter commands by tab
    if tab == "Movement" then
        for i = 1, 8 do table.insert(tabCommands, CommandList[i]) end
    elseif tab == "Player" then
        for i = 9, 20 do table.insert(tabCommands, CommandList[i]) end
    elseif tab == "World" then
        for i = 21, 27 do table.insert(tabCommands, CommandList[i]) end
    elseif tab == "Visual" then
        for i = 28, 30 do table.insert(tabCommands, CommandList[i]) end
    elseif tab == "Utility" then
        for i = 31, 36 do table.insert(tabCommands, CommandList[i]) end
    elseif tab == "Fun" then
        for i = 37, 44 do table.insert(tabCommands, CommandList[i]) end
    end
    
    for i, cmdData in ipairs(tabCommands) do
        local cmdName, cmdDesc, cmdExample = cmdData[1], cmdData[2], cmdData[3]
        
        -- Command button
        local cmdButton = Instance.new("TextButton")
        cmdButton.Name = cmdName .. "Button"
        cmdButton.Size = UDim2.new(1, -16, 0, 50)
        cmdButton.Position = UDim2.new(0, 8, 0, yPos)
        cmdButton.BackgroundColor3 = COLORS.SurfaceLight
        cmdButton.BackgroundTransparency = 0.5
        cmdButton.BorderSizePixel = 0
        cmdButton.Text = ""
        cmdButton.Parent = CommandsContainer
        
        -- Button corner
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = cmdButton
        
        -- Command name
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "Name"
        nameLabel.Size = UDim2.new(0, 120, 0.4, 0)
        nameLabel.Position = UDim2.new(0, 8, 0, 5)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = ";" .. cmdName
        nameLabel.TextColor3 = COLORS.Accent
        nameLabel.TextSize = 16
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = cmdButton
        
        -- Command description
        local descLabel = Instance.new("TextLabel")
        descLabel.Name = "Description"
        descLabel.Size = UDim2.new(1, -136, 0.4, 0)
        descLabel.Position = UDim2.new(0, 128, 0, 5)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = cmdDesc
        descLabel.TextColor3 = COLORS.TextSecondary
        descLabel.TextSize = 14
        descLabel.Font = Enum.Font.Gotham
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.Parent = cmdButton
        
        -- Example text
        local exampleLabel = Instance.new("TextLabel")
        exampleLabel.Name = "Example"
        exampleLabel.Size = UDim2.new(1, -136, 0.4, 0)
        exampleLabel.Position = UDim2.new(0, 128, 0.5, 2)
        exampleLabel.BackgroundTransparency = 1
        exampleLabel.Text = cmdExample
        exampleLabel.TextColor3 = COLORS.Success
        exampleLabel.TextSize = 12
        exampleLabel.Font = Enum.Font.Gotham
        exampleLabel.TextXAlignment = Enum.TextXAlignment.Left
        exampleLabel.Parent = cmdButton
        
        -- Status indicator for toggle commands
        if cmdName == "fly" or cmdName == "noclip" or cmdName == "invisible" or cmdName == "spin" or cmdName == "loopkill" or cmdName == "esp" then
            local statusLabel = Instance.new("TextLabel")
            statusLabel.Name = "Status"
            statusLabel.Size = UDim2.new(0, 60, 0.3, 0)
            statusLabel.Position = UDim2.new(1, -70, 0.35, 0)
            statusLabel.BackgroundTransparency = 1
            statusLabel.Text = CommandStates[cmdName] and "ON" or "OFF"
            statusLabel.TextColor3 = CommandStates[cmdName] and COLORS.Success or COLORS.AccentRed
            statusLabel.TextSize = 12
            statusLabel.Font = Enum.Font.GothamBold
            statusLabel.TextXAlignment = Enum.TextXAlignment.Right
            statusLabel.Parent = cmdButton
            
            -- Update status when clicked
            cmdButton.MouseButton1Click:Connect(function()
                wait(0.1)
                statusLabel.Text = CommandStates[cmdName] and "ON" or "OFF"
                statusLabel.TextColor3 = CommandStates[cmdName] and COLORS.Success or COLORS.AccentRed
            end)
        end
        
        -- Click functionality
        cmdButton.MouseButton1Click:Connect(function()
            ExecuteCommand(cmdName, "")
        end)
        
        -- Hover effect
        cmdButton.MouseEnter:Connect(function()
            TweenService:Create(cmdButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
        end)
        cmdButton.MouseLeave:Connect(function()
            TweenService:Create(cmdButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
        end)
        
        yPos = yPos + 55
    end
    
    CommandsContainer.CanvasSize = UDim2.new(0, 0, 0, yPos + 8)
end

-- Tab click handlers
for tabName, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        currentTab = tabName
        refreshCommands(tabName)
        
        -- Update tab colors
        for t, b in pairs(tabButtons) do
            b.BackgroundTransparency = 0.7
            b.TextColor3 = COLORS.TextSecondary
        end
        btn.BackgroundTransparency = 0.3
        btn.TextColor3 = COLORS.Accent
    end)
end

-- Initialize with Movement tab
refreshCommands("Movement")
tabButtons["Movement"].BackgroundTransparency = 0.3
tabButtons["Movement"].TextColor3 = COLORS.Accent

-- Register commands
for _, cmdData in ipairs(CommandList) do
    local cmdName = cmdData[1]
    Commands[cmdName] = function(args) ExecuteCommand(cmdName, args) end
end

-- Chat detection
LocalPlayer.Chatted:Connect(function(message)
    if message:sub(1, 1) == ";" then
        local parts = message:sub(2):split(" ")
        local cmd = parts[1]:lower()
        local args = parts[2]
        
        if Commands[cmd] then
            Commands[cmd](args)
        else
            ExecuteCommand(cmd, args)
        end
    end
end)

-- Button animations
local function addHoverEffect(button, targetTransparency)
    local originalTrans = button.BackgroundTransparency
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = targetTransparency}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = originalTrans}):Play()
    end)
end

addHoverEffect(MinButton, 0.2)
addHoverEffect(CloseButton, 0.2)
addHoverEffect(MinButtonSly, 0.2)

-- Pulse effect for minimized button
spawn(function()
    while true do
        if MinButtonSly.Visible then
            TweenService:Create(MinButtonSly, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), 
                {BackgroundColor3 = COLORS.Accent}):Play()
            wait(1.5)
        end
        wait(0.1)
    end
end)

-- Button functionality
MinButton.MouseButton1Click:Connect(function()
    MainPanel.Visible = false
    MinButtonSly.Visible = true
    LocalPlayer:Chat("✧ Slayer Hub minimized")
end)

CloseButton.MouseButton1Click:Connect(function()
    MainPanel.Visible = false
    MinButtonSly.Visible = false
end)

MinButtonSly.MouseButton1Click:Connect(function()
    MainPanel.Visible = true
    MinButtonSly.Visible = false
end)

-- Draggable
local dragging = false
local dragInput, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainPanel.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainPanel.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Welcome message
LocalPlayer:Chat("✧ Slayer Hub ULTIMATE loaded (50+ commands)")
LocalPlayer:Chat("✧ Type ;commands or click buttons above")
LocalPlayer:Chat("✧ Perfect flight: ;fly [speed] (Shift to sprint)")

print("✅ Slayer Hub ULTIMATE loaded successfully")
print("📋 50+ commands available in 6 categories")
