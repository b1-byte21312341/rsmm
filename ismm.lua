--бл хуйня какая то но вроде бы норм кнопку "close" не жмите сурсик


local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local items = {
    {original = "Harvester", custom = "Harvester"},
    {original = "Gingerscope", custom = "Gingerscope"},
    {original = "Bauble", custom = "Bauble"},
    {original = "Icepiercer", custom = "Icepiercer"},
    {original = "TreeGun2023", custom = "Evergun"},
    {original = "TreeKnife2023", custom = "Evergreen"},
    {original = "TreeGun2023Chroma", custom = "Chroma Evergun"},
    {original = "TreeKnife2023Chroma", custom = "Chroma Evergreen"},
    {original = "Bloom", custom = "Bloom"},
    {original = "Flora", custom = "Flora"},
    {original = "TravelerAxe", custom = "Traveler Axe"},
    {original = "TravelerGun", custom = "Traveler Gun"},
    {original = "TravelerAxeChroma", custom = "Chroma Traveler Axe"},
    {original = "TravelerGunChroma", custom = "Chroma Traveler Gun"},
    {original = "Celestial", custom = "Celestial"},
    {original = "Constellation", custom = "Constellation"},
    {original = "ConstellationChroma", custom = "Chroma Constellation"},
    {original = "BaubleChroma", custom = "Chroma Bauble"},
    {original = "Candy", custom = "Candy"},
    {original = "Sugar", custom = "Sugar"},
    {original = "Darksword", custom = "Darksword"},
    {original = "Darkshot", custom = "Darkshot"},
    {original = "VampireAxe", custom = "Vampire Axe"},
    {original = "VampireGun", custom = "Vampire Gun"},
    {original = "SwirlyAxe", custom = "Swirly Axe"},
    {original = "SwirlyGun", custom = "Swirly Gun"},
    {original = "Flowerwood", custom = "Flowerwood"},
    {original = "FlowerwoodGun", custom = "Flowerwood Gun"},
    {original = "VampireGunChroma", custom = "Chroma Vampire Gun"},
    {original = "WatergunChroma", custom = "Chroma Watergun"},
    {original = "Turkey2023", custom = "Turkey"},
    {original = "Sakura_K", custom = "Sakura"},
    {original = "Blossom_G", custom = "Blossom"},
    {original = "ZombieBat", custom = "Bat"},
    {original = "Makeshift", custom = "Makeshift"},
    {original = "Sorry", custom = "Corrupt"}
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ChristmasItemSpawnerGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 1000

local snowContainer = Instance.new("Frame")
snowContainer.Size = UDim2.new(1, 0, 1, 0)
snowContainer.BackgroundTransparency = 1
snowContainer.Parent = screenGui

for i = 1, 50 do
    local snowflake = Instance.new("Frame")
    snowflake.Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6))
    snowflake.Position = UDim2.new(math.random(), 0, -0.1, 0)
    snowflake.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    snowflake.BorderSizePixel = 0
    snowflake.BackgroundTransparency = 0.7
    snowflake.Parent = snowContainer
    
    local corner = Instance.new("UICorner", snowflake)
    corner.CornerRadius = UDim.new(1, 0)
    
    spawn(function()
        while snowflake.Parent do
            local speed = math.random(5, 15)
            local sway = math.random(-20, 20)
            local duration = math.random(3, 8)
            
            snowflake:TweenPosition(
                UDim2.new(
                    snowflake.Position.X.Scale + (sway/1000),
                    0,
                    1.1,
                    0
                ),
                "Linear",
                "Linear",
                duration,
                true
            )
            
            wait(duration)
            if snowflake.Parent then
                snowflake.Position = UDim2.new(math.random(), 0, -0.1, 0)
            end
        end
    end)
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 180)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 30, 50)
mainFrame.BackgroundTransparency = 0
mainFrame.ZIndex = 10
mainFrame.Parent = screenGui

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 30, 60)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 50, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 30, 60))
})
gradient.Rotation = 90
gradient.Parent = mainFrame

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local frameStroke = Instance.new("UIStroke", mainFrame)
frameStroke.Color = Color3.fromRGB(255, 215, 0)
frameStroke.Thickness = 2
frameStroke.Transparency = 0.3

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "🎁 NEW YEAR SPAWNER 🎁"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 14
titleLabel.TextTransparency = 0
titleLabel.ZIndex = 11
titleLabel.Parent = mainFrame

local topDecoration = Instance.new("Frame")
topDecoration.Size = UDim2.new(1, 0, 0, 3)
topDecoration.Position = UDim2.new(0, 0, 0, 30)
topDecoration.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
topDecoration.BackgroundTransparency = 0
topDecoration.ZIndex = 11
topDecoration.Parent = mainFrame

local inputBox = Instance.new("TextBox")
inputBox.PlaceholderText = "🎄 Enter item name..."
inputBox.Size = UDim2.new(0.9, 0, 0, 28)
inputBox.Position = UDim2.new(0.05, 0, 0, 40)
inputBox.BackgroundColor3 = Color3.fromRGB(20, 40, 70)
inputBox.TextColor3 = Color3.fromRGB(200, 230, 255)
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 12
inputBox.TextTransparency = 0
inputBox.ZIndex = 11
inputBox.Text = ""
inputBox.Parent = mainFrame

local inputCorner = Instance.new("UICorner", inputBox)
inputCorner.CornerRadius = UDim.new(0, 8)

local inputStroke = Instance.new("UIStroke", inputBox)
inputStroke.Color = Color3.fromRGB(0, 200, 255)
inputStroke.Thickness = 1.5

local spawnButton = Instance.new("TextButton")
spawnButton.Text = "✨ SPAWN ✨"
spawnButton.Size = UDim2.new(0.45, 0, 0, 28)
spawnButton.Position = UDim2.new(0.5, 0, 0, 73)
spawnButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
spawnButton.TextColor3 = Color3.new(1, 1, 1)
spawnButton.Font = Enum.Font.GothamBlack
spawnButton.TextSize = 12
spawnButton.TextTransparency = 0
spawnButton.ZIndex = 11
spawnButton.Parent = mainFrame

local spawnCorner = Instance.new("UICorner", spawnButton)
spawnCorner.CornerRadius = UDim.new(0, 8)

local spawnStroke = Instance.new("UIStroke", spawnButton)
spawnStroke.Color = Color3.fromRGB(255, 215, 0)
spawnStroke.Thickness = 1.5

local openButton = Instance.new("TextButton")
openButton.Text = "🎄 OPEN 🎄"
openButton.Size = UDim2.new(0.35, 0, 0, 22)
openButton.Position = UDim2.new(0.05, 0, 0, 73)
openButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.Font = Enum.Font.GothamBlack
openButton.TextSize = 10
openButton.TextTransparency = 0
openButton.ZIndex = 11
openButton.Parent = mainFrame
Instance.new("UICorner", openButton).CornerRadius = UDim.new(0, 8)
local openStroke = Instance.new("UIStroke", openButton)
openStroke.Color = Color3.fromRGB(0, 255, 200)
openStroke.Thickness = 1

local tableFrame = Instance.new("ScrollingFrame")
tableFrame.Size = UDim2.new(0.9, 0, 0, 100)
tableFrame.Position = UDim2.new(0.05, 0, 0, 110)
tableFrame.BackgroundColor3 = Color3.fromRGB(15, 35, 65)
tableFrame.BackgroundTransparency = 0
tableFrame.BorderSizePixel = 0
tableFrame.CanvasSize = UDim2.new(0, 0, 0, #items * 26)
tableFrame.ScrollBarThickness = 4
tableFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
tableFrame.Visible = false
tableFrame.ZIndex = 12
tableFrame.Parent = mainFrame

local tableCorner = Instance.new("UICorner", tableFrame)
tableCorner.CornerRadius = UDim.new(0, 8)

local tableStroke = Instance.new("UIStroke", tableFrame)
tableStroke.Color = Color3.fromRGB(0, 200, 255)
tableStroke.Thickness = 1.5

local tableList = Instance.new("UIListLayout")
tableList.FillDirection = Enum.FillDirection.Vertical
tableList.Padding = UDim.new(0, 4)
tableList.SortOrder = Enum.SortOrder.LayoutOrder
tableList.Parent = tableFrame

local tablePadding = Instance.new("UIPadding")
tablePadding.PaddingTop = UDim.new(0, 4)
tablePadding.PaddingLeft = UDim.new(0, 4)
tablePadding.PaddingRight = UDim.new(0, 4)
tablePadding.Parent = tableFrame

for index, item in ipairs(items) do
    local itemButton = Instance.new("TextButton")
    itemButton.Size = UDim2.new(1, -8, 0, 22)
    itemButton.Position = UDim2.new(0, 4, 0, (index-1)*26)
    itemButton.BackgroundColor3 = Color3.fromRGB(25, 45, 75)
    itemButton.Text = "🎁 " .. item.custom .. " 🎁"
    itemButton.TextColor3 = Color3.fromRGB(200, 230, 255)
    itemButton.Font = Enum.Font.Gotham
    itemButton.TextSize = 10
    itemButton.TextTransparency = 0
    itemButton.TextXAlignment = Enum.TextXAlignment.Left
    itemButton.ZIndex = 13
    itemButton.Parent = tableFrame
    itemButton.LayoutOrder = index
    
    local buttonCorner = Instance.new("UICorner", itemButton)
    buttonCorner.CornerRadius = UDim.new(0, 6)
    
    local buttonStroke = Instance.new("UIStroke", itemButton)
    buttonStroke.Color = Color3.fromRGB(0, 150, 255)
    buttonStroke.Thickness = 1

    local textPadding = Instance.new("UIPadding", itemButton)
    textPadding.PaddingLeft = UDim.new(0, 8)

    itemButton.MouseEnter:Connect(function()
        itemButton.BackgroundColor3 = Color3.fromRGB(35, 55, 85)
    end)
    
    itemButton.MouseLeave:Connect(function()
        itemButton.BackgroundColor3 = Color3.fromRGB(25, 45, 75)
    end)

    itemButton.MouseButton1Click:Connect(function()
        inputBox.Text = item.custom
        local grow = TweenService:Create(itemButton, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, -8, 0, 24),
            BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        })
        grow:Play()
        grow.Completed:Connect(function()
            itemButton:TweenSize(UDim2.new(1, -8, 0, 22), "Out", "Quad", 0.1, true)
            itemButton:TweenBackgroundColor3(Color3.fromRGB(25, 45, 75), "Out", "Quad", 0.1, true)
        end)
    end)
end

tableFrame.CanvasSize = UDim2.new(0, 0, 0, #items * 26)

local closeButton = Instance.new("TextButton")
closeButton.Text = "❌ CLOSE ❌"
closeButton.Size = UDim2.new(0.35, 0, 0, 22)
closeButton.Position = UDim2.new(0.6, 0, 0, 145)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBlack
closeButton.TextSize = 10
closeButton.TextTransparency = 0
closeButton.ZIndex = 11
closeButton.Parent = mainFrame
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)
local closeStroke = Instance.new("UIStroke", closeButton)
closeStroke.Color = Color3.fromRGB(255, 100, 100)
closeStroke.Thickness = 1

local progressFrame = Instance.new("Frame")
progressFrame.Size = UDim2.new(0, 240, 0, 40)
progressFrame.Position = UDim2.new(1, -250, 0, 100)
progressFrame.BackgroundColor3 = Color3.fromRGB(15, 35, 65)
progressFrame.BackgroundTransparency = 0
progressFrame.ZIndex = 11
progressFrame.Parent = screenGui
Instance.new("UICorner", progressFrame).CornerRadius = UDim.new(0, 8)

local progressLabel = Instance.new("TextLabel")
progressLabel.Size = UDim2.new(1, 0, 0, 16)
progressLabel.BackgroundTransparency = 1
progressLabel.Text = "🎅 Progress: Waiting..."
progressLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
progressLabel.Font = Enum.Font.Gotham
progressLabel.TextSize = 10
progressLabel.TextTransparency = 0
progressLabel.ZIndex = 12
progressLabel.Parent = progressFrame

local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.95, 0, 0, 8)
barBG.Position = UDim2.new(0.025, 0, 0, 20)
barBG.BackgroundColor3 = Color3.fromRGB(30, 50, 80)
barBG.BackgroundTransparency = 0
barBG.ZIndex = 12
barBG.Parent = progressFrame
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
barFill.BackgroundTransparency = 0
barFill.ZIndex = 12
barFill.Parent = barBG
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

local function getOriginalName(customName)
    for _, item in ipairs(items) do
        if item.custom == customName then
            return item.original
        end
    end
    return customName
end

local isTableOpen = false
openButton.MouseButton1Click:Connect(function()
    isTableOpen = not isTableOpen
    openButton.Text = isTableOpen and "🎄 CLOSE 🎄" or "🎄 OPEN 🎄"
    tableFrame.Visible = isTableOpen

    local mainFrameHeight = isTableOpen and 250 or 180
    local closeButtonY = isTableOpen and 215 or 145
    local progressFrameY = isTableOpen and 170 or 100

    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 240, 0, mainFrameHeight)
    }):Play()
    TweenService:Create(closeButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.6, 0, 0, closeButtonY)
    }):Play()
    TweenService:Create(progressFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -250, 0, progressFrameY)
    }):Play()

    local grow = TweenService:Create(openButton, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.37, 0, 0, 24),
        BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    })
    grow:Play()
    grow.Completed:Connect(function()
        openButton:TweenSize(UDim2.new(0.35, 0, 0, 22), "Out", "Quad", 0.1, true)
        openButton:TweenBackgroundColor3(isTableOpen and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(0, 150, 100), "Out", "Quad", 0.1, true)
    end)
end)

local dragToggle, dragStart, startPos
local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(mainFrame, TweenInfo.new(0.25), {Position = position}):Play()
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragToggle then
            updateInput(input)
        end
    end
end)

local function spawnItem(name)
    local DataBase, PlayerData = require(game:GetService("ReplicatedStorage").Database.Sync.Item), require(game:GetService("ReplicatedStorage").Modules.ProfileData)
    local PlayerWeapons = PlayerData.Weapons

    if not PlayerWeapons.Owned[name] then
        PlayerWeapons.Owned[name] = 1
    else
        PlayerWeapons.Owned[name] += 1
    end

    game:GetService("RunService"):BindToRenderStep("InventoryUpdate", 0, function()
        PlayerData.Weapons = PlayerWeapons
    end)

    game.Players.LocalPlayer.Character:BreakJoints()
end

local function showProgress(customName)
    local originalName = getOriginalName(customName)
    
    progressFrame.Visible = true
    progressLabel.Visible = true
    barBG.Visible = true
    barFill.Visible = true

    local percent = 0
    while percent < 100 do
        percent += math.random(5, 15)
        percent = math.clamp(percent, 0, 100)
        progressLabel.Text = "🎅 Spawning: " .. customName .. " (" .. percent .. "%)"
        barFill:TweenSize(UDim2.new(percent / 100, 0, 1, 0), "Out", "Quad", 0.1, true)
        
        if percent < 33 then
            barFill.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
        elseif percent < 66 then
            barFill.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
        else
            barFill.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
        end
        
        task.wait(0.5)
    end

    progressLabel.Text = "🎁 Spawned: " .. customName
    spawnItem(originalName)

    task.delay(2, function()
        progressFrame.Visible = false
        progressLabel.Visible = false
        barBG.Visible = false
        barFill.Visible = false
        barFill.Size = UDim2.new(0, 0, 1, 0)
    end)
end

spawnButton.MouseButton1Click:Connect(function()
    local itemName = inputBox.Text
    if itemName == "" then return end

    local grow = TweenService:Create(spawnButton, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.47, 0, 0, 30),
        BackgroundColor3 = Color3.fromRGB(255, 100, 150)
    })
    grow:Play()
    grow.Completed:Connect(function()
        spawnButton:TweenSize(UDim2.new(0.45, 0, 0, 28), "Out", "Quad", 0.1, true)
        spawnButton:TweenBackgroundColor3(Color3.fromRGB(255, 50, 100), "Out", "Quad", 0.1, true)
    end)

    showProgress(itemName)
    inputBox.Text = ""
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

spawn(function()
    while true do
        for i = 0, 1, 0.1 do
            if topDecoration and topDecoration.Parent then
                topDecoration.BackgroundTransparency = 0.3 + (i * 0.7)
                wait(0.05)
            end
        end
        for i = 0, 1, 0.1 do
            if topDecoration and topDecoration.Parent then
                topDecoration.BackgroundTransparency = 1 - (i * 0.7)
                wait(0.05)
            end
        end
    end
end)
