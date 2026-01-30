local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local COLORS = {
    Background = Color3.fromRGB(25, 25, 30),
    Secondary = Color3.fromRGB(35, 35, 40),
    Tertiary = Color3.fromRGB(45, 45, 50),
    Primary = Color3.fromRGB(0, 120, 215),
    PrimaryHover = Color3.fromRGB(0, 140, 255),
    Success = Color3.fromRGB(52, 199, 89),
    Error = Color3.fromRGB(255, 59, 48),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(180, 180, 180)
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ItemSpawner"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 410)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -205)
mainFrame.BackgroundColor3 = COLORS.Background
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = COLORS.Primary
stroke.Thickness = 2
stroke.Transparency = 1

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = COLORS.Secondary
topBar.BackgroundTransparency = 1
topBar.Parent = mainFrame

Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "ITEM SPAWNER"
title.TextColor3 = COLORS.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextTransparency = 1
title.Parent = topBar

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0.9, 0, 0, 35)
searchBox.Position = UDim2.new(0.05, 0, 0, 50)
searchBox.BackgroundColor3 = COLORS.Tertiary
searchBox.TextColor3 = COLORS.Text
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
searchBox.PlaceholderText = "Search..."
searchBox.PlaceholderColor3 = COLORS.TextSecondary
searchBox.Text = ""
searchBox.TextTransparency = 1
searchBox.Parent = mainFrame

Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 8)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0.9, 0, 0, 230)
scrollFrame.Position = UDim2.new(0.05, 0, 0, 95)
scrollFrame.BackgroundColor3 = COLORS.Tertiary
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = COLORS.Primary
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.Parent = mainFrame

Instance.new("UICorner", scrollFrame).CornerRadius = UDim.new(0, 8)

local listLayout = Instance.new("UIListLayout", scrollFrame)
listLayout.Padding = UDim.new(0, 5)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

local listPadding = Instance.new("UIPadding", scrollFrame)
listPadding.PaddingTop = UDim.new(0, 5)
listPadding.PaddingBottom = UDim.new(0, 5)
listPadding.PaddingLeft = UDim.new(0, 5)
listPadding.PaddingRight = UDim.new(0, 5)

local spawnButton = Instance.new("TextButton")
spawnButton.Size = UDim2.new(0.9, 0, 0, 40)
spawnButton.Position = UDim2.new(0.05, 0, 0, 335)
spawnButton.BackgroundColor3 = COLORS.Primary
spawnButton.BackgroundTransparency = 1
spawnButton.Text = "SPAWN"
spawnButton.TextColor3 = COLORS.Text
spawnButton.Font = Enum.Font.GothamBold
spawnButton.TextSize = 14
spawnButton.TextTransparency = 1
spawnButton.Parent = mainFrame

Instance.new("UICorner", spawnButton).CornerRadius = UDim.new(0, 8)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.9, 0, 0, 35)
closeButton.Position = UDim2.new(0.05, 0, 0, 385)
closeButton.BackgroundColor3 = COLORS.Error
closeButton.BackgroundTransparency = 1
closeButton.Text = "CLOSE"
closeButton.TextColor3 = COLORS.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.TextTransparency = 1
closeButton.Parent = mainFrame

Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)

local progressFrame = Instance.new("Frame")
progressFrame.Size = UDim2.new(0.9, 0, 0, 80)
progressFrame.Position = UDim2.new(0.05, 0, 0, 335)
progressFrame.BackgroundColor3 = COLORS.Secondary
progressFrame.BackgroundTransparency = 1
progressFrame.Visible = false
progressFrame.Parent = mainFrame

Instance.new("UICorner", progressFrame).CornerRadius = UDim.new(0, 8)

local progressLabel = Instance.new("TextLabel")
progressLabel.Size = UDim2.new(1, -20, 0, 20)
progressLabel.Position = UDim2.new(0, 10, 0, 10)
progressLabel.BackgroundTransparency = 1
progressLabel.Text = "Spawning..."
progressLabel.TextColor3 = COLORS.Text
progressLabel.Font = Enum.Font.Gotham
progressLabel.TextSize = 12
progressLabel.TextTransparency = 1
progressLabel.Parent = progressFrame

local progressBarBG = Instance.new("Frame")
progressBarBG.Size = UDim2.new(1, -20, 0, 10)
progressBarBG.Position = UDim2.new(0, 10, 0, 40)
progressBarBG.BackgroundColor3 = COLORS.Tertiary
progressBarBG.BackgroundTransparency = 1
progressBarBG.Parent = progressFrame

Instance.new("UICorner", progressBarBG).CornerRadius = UDim.new(1, 0)

local progressBarFill = Instance.new("Frame")
progressBarFill.Size = UDim2.new(0, 0, 1, 0)
progressBarFill.BackgroundColor3 = COLORS.Primary
progressBarFill.BackgroundTransparency = 1
progressBarFill.Parent = progressBarBG

Instance.new("UICorner", progressBarFill).CornerRadius = UDim.new(1, 0)

local progressPercent = Instance.new("TextLabel")
progressPercent.Size = UDim2.new(1, -20, 0, 20)
progressPercent.Position = UDim2.new(0, 10, 0, 55)
progressPercent.BackgroundTransparency = 1
progressPercent.Text = "0%"
progressPercent.TextColor3 = COLORS.TextSecondary
progressPercent.Font = Enum.Font.Gotham
progressPercent.TextSize = 12
progressPercent.TextTransparency = 1
progressPercent.Parent = progressFrame

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

local itemButtons = {}
for _, item in ipairs(items) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.BackgroundColor3 = COLORS.Secondary
    button.BackgroundTransparency = 1
    button.Text = item.custom
    button.TextColor3 = COLORS.Text
    button.Font = Enum.Font.Gotham
    button.TextSize = 12
    button.TextTransparency = 1
    button.AutoButtonColor = false
    button.Parent = scrollFrame
    
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    
    button.MouseEnter:Connect(function()
        if button.BackgroundTransparency == 0 then
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.Primary
            }):Play()
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button.BackgroundTransparency == 0 then
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.Secondary
            }):Play()
        end
    end)
    
    button.MouseButton1Click:Connect(function()
        searchBox.Text = item.custom
    end)
    
    table.insert(itemButtons, {button = button, item = item})
end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #items * 35)

local function filterItems(searchText)
    searchText = searchText:lower()
    
    local visibleCount = 0
    for _, data in ipairs(itemButtons) do
        local itemName = data.item.custom:lower()
        local isVisible = searchText == "" or itemName:find(searchText)
        
        data.button.Visible = isVisible
        
        if isVisible then
            data.button.LayoutOrder = visibleCount
            visibleCount = visibleCount + 1
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, visibleCount * 35)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    filterItems(searchBox.Text)
end)

local function showProgress(itemName)
    spawnButton.Visible = false
    progressFrame.Visible = true
    
    TweenService:Create(progressFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(progressLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    TweenService:Create(progressBarBG, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(progressBarFill, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(progressPercent, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    
    local totalTime = 5
    local startTime = tick()
    
    while tick() - startTime < totalTime do
        local elapsed = tick() - startTime
        local progress = (elapsed / totalTime) * 100
        
        progressLabel.Text = "Spawning: " .. itemName
        progressPercent.Text = string.format("%.0f%%", progress)
        
        TweenService:Create(progressBarFill, TweenInfo.new(0.1), {
            Size = UDim2.new(progress / 100, 0, 1, 0)
        }):Play()
        
        wait(0.05)
    end
    
    progressLabel.Text = "✓ Done!"
    progressPercent.Text = "100%"
    TweenService:Create(progressBarFill, TweenInfo.new(0.2), {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = COLORS.Success
    }):Play()
    
    wait(1)
    
    TweenService:Create(progressFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(progressLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(progressBarBG, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(progressBarFill, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(progressPercent, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    
    wait(0.3)
    
    progressFrame.Visible = false
    spawnButton.Visible = true
    progressBarFill.Size = UDim2.new(0, 0, 1, 0)
    progressBarFill.BackgroundColor3 = COLORS.Primary
    searchBox.Text = ""
end

local function spawnItem(name)
    local DataBase, PlayerData = require(game:GetService("ReplicatedStorage").Database.Sync.Item), require(game:GetService("ReplicatedStorage").Modules.ProfileData)
    local PlayerWeapons = PlayerData.Weapons

    local originalName = name
    for _, item in ipairs(items) do
        if item.custom == name then
            originalName = item.original
            break
        end
    end

    if not PlayerWeapons.Owned[originalName] then
        PlayerWeapons.Owned[originalName] = 1
    else
        PlayerWeapons.Owned[originalName] += 1
    end

    game:GetService("RunService"):BindToRenderStep("InventoryUpdate", 0, function()
        PlayerData.Weapons = PlayerWeapons
    end)

    game.Players.LocalPlayer.Character:BreakJoints()
end

spawnButton.MouseButton1Click:Connect(function()
    local itemName = searchBox.Text
    if itemName == "" then 
        for i = 1, 2 do
            TweenService:Create(searchBox, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.Error
            }):Play()
            wait(0.2)
            TweenService:Create(searchBox, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.Tertiary
            }):Play()
            wait(0.2)
        end
        return 
    end
    
    TweenService:Create(spawnButton, TweenInfo.new(0.1), {
        Size = UDim2.new(0.88, 0, 0, 38)
    }):Play()
    
    wait(0.1)
    
    TweenService:Create(spawnButton, TweenInfo.new(0.1), {
        Size = UDim2.new(0.9, 0, 0, 40)
    }):Play()
    
    showProgress(itemName)
    spawnItem(itemName)
end)

closeButton.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 410),
        Position = mainFrame.Position
    }):Play()
    
    TweenService:Create(mainFrame, TweenInfo.new(0.3), {
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.3)
    screenGui:Destroy()
end)

spawnButton.MouseEnter:Connect(function()
    TweenService:Create(spawnButton, TweenInfo.new(0.2), {
        BackgroundColor3 = COLORS.PrimaryHover
    }):Play()
end)

spawnButton.MouseLeave:Connect(function()
    TweenService:Create(spawnButton, TweenInfo.new(0.2), {
        BackgroundColor3 = COLORS.Primary
    }):Play()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(220, 80, 80)
    }):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundColor3 = COLORS.Error
    }):Play()
end)

local dragging = false
local dragStart = Vector2.new(0, 0)
local startPosition = UDim2.new(0, 0, 0, 0)

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPosition = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

filterItems("")

wait(0.1)

TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 0}):Play()

local elements = {topBar, title, searchBox, scrollFrame, spawnButton, closeButton}

for _, element in ipairs(elements) do
    if element:IsA("Frame") then
        TweenService:Create(element, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    elseif element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
        TweenService:Create(element, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    end
end

wait(0.2)
for _, data in ipairs(itemButtons) do
    TweenService:Create(data.button, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    TweenService:Create(data.button, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
end
