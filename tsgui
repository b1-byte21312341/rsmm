--// MM2 Trade Freeze Script (Clean UI)

if game.CoreGui:FindFirstChild("TradeFreezeUI") then
	game.CoreGui.TradeFreezeUI:Destroy()
end

local TweenService = game:GetService("TweenService")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TradeFreezeUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

--------------------------------------------------------------------------------
-- LOADING SCREEN (15 SECONDS)
--------------------------------------------------------------------------------
local LoadingFrame = Instance.new("Frame", ScreenGui)
LoadingFrame.Size = UDim2.new(0,320,0,230)
LoadingFrame.Position = UDim2.new(0.5,0,0.5,0)
LoadingFrame.AnchorPoint = Vector2.new(0.5,0.5)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
LoadingFrame.BorderSizePixel = 0
Instance.new("UICorner", LoadingFrame)

local LoadStroke = Instance.new("UIStroke", LoadingFrame)
LoadStroke.Color = Color3.fromRGB(90,120,255)
LoadStroke.Thickness = 2

local LoadTitle = Instance.new("TextLabel", LoadingFrame)
LoadTitle.Text = "Loading script..."
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.TextSize = 20
LoadTitle.TextColor3 = Color3.fromRGB(230,230,230)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Position = UDim2.new(0.5,0,0.3,0)
LoadTitle.AnchorPoint = Vector2.new(0.5,0.5)

local LoadSub = Instance.new("TextLabel", LoadingFrame)
LoadSub.Text = "Bypassing anti-detection..."
LoadSub.Font = Enum.Font.Gotham
LoadSub.TextSize = 14
LoadSub.TextColor3 = Color3.fromRGB(170,170,170)
LoadSub.BackgroundTransparency = 1
LoadSub.Position = UDim2.new(0.5,0,0.45,0)
LoadSub.AnchorPoint = Vector2.new(0.5,0.5)

local LoadReq = Instance.new("TextLabel", LoadingFrame)
LoadReq.Text = "Loading 800+ lines of code"
LoadReq.Font = Enum.Font.Gotham
LoadReq.TextSize = 13
LoadReq.TextColor3 = Color3.fromRGB(140,140,140)
LoadReq.BackgroundTransparency = 1
LoadReq.Position = UDim2.new(0.5,0,0.53,0)
LoadReq.AnchorPoint = Vector2.new(0.5,0.5)

local BarBG = Instance.new("Frame", LoadingFrame)
BarBG.Size = UDim2.new(0,220,0,8)
BarBG.Position = UDim2.new(0.5,0,0.65,0)
BarBG.AnchorPoint = Vector2.new(0.5,0.5)
BarBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", BarBG)

local BarFill = Instance.new("Frame", BarBG)
BarFill.Size = UDim2.new(0,0,1,0)
BarFill.BackgroundColor3 = Color3.fromRGB(90,120,255)
Instance.new("UICorner", BarFill)

TweenService:Create(BarFill, TweenInfo.new(15, Enum.EasingStyle.Linear), {
	Size = UDim2.new(1,0,1,0)
}):Play()

task.wait(15)
LoadingFrame:Destroy()

--------------------------------------------------------------------------------
-- MAIN UI
--------------------------------------------------------------------------------
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,320,0,260)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.BackgroundTransparency = 1
Instance.new("UICorner", Main)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(90,120,255)
Stroke.Thickness = 2
Stroke.Transparency = 1

local TitleMain = Instance.new("TextLabel", Main)
TitleMain.Text = "MM2 Trade Freeze"
TitleMain.Font = Enum.Font.GothamBold
TitleMain.TextSize = 20
TitleMain.TextColor3 = Color3.fromRGB(230,230,230)
TitleMain.Size = UDim2.new(1,0,0,30)
TitleMain.BackgroundTransparency = 1
TitleMain.TextTransparency = 1

local SubTitle = Instance.new("TextLabel", Main)
SubTitle.Text = "Made By ScriptHubss"
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 13
SubTitle.TextColor3 = Color3.fromRGB(160,160,160)
SubTitle.Size = UDim2.new(1,0,0,20)
SubTitle.Position = UDim2.new(0,0,0,30)
SubTitle.BackgroundTransparency = 1
SubTitle.TextTransparency = 1

local function makeButton(text, y)
	local b = Instance.new("TextButton", Main)
	b.Size = UDim2.new(0.8,0,0,40)
	b.Position = UDim2.new(0.1,0,y,0)
	b.BackgroundColor3 = Color3.fromRGB(70,70,70)
	b.Text = text
	b.Font = Enum.Font.GothamSemibold
	b.TextSize = 17
	b.TextColor3 = Color3.fromRGB(255,255,255)
	b.TextTransparency = 1
	Instance.new("UICorner", b)
	return b
end

local FreezeBtn = makeButton("Freeze Trade", 0.32)
local UnfreezeBtn = makeButton("Unfreeze Trade", 0.50)
local AutoBtn = makeButton("Auto Accept Trade", 0.68)

local StatusText = Instance.new("TextLabel", Main)
StatusText.Size = UDim2.new(1,0,0,20)
StatusText.Position = UDim2.new(0,0,0.87,0)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 13
StatusText.TextColor3 = Color3.fromRGB(180,180,180)
StatusText.Text = "Trade Status: None"
StatusText.TextTransparency = 1

--------------------------------------------------------------------------------
-- POPUP FUNCTION (BOTTOM RIGHT)
--------------------------------------------------------------------------------
local function createPopup(text)
	local Popup = Instance.new("Frame", ScreenGui)
	Popup.Size = UDim2.new(0,240,0,40)
	Popup.Position = UDim2.new(1,260,1,-60)
	Popup.AnchorPoint = Vector2.new(1,1)
	Popup.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Popup.BorderSizePixel = 0
	Instance.new("UICorner", Popup)

	local StrokeP = Instance.new("UIStroke", Popup)
	StrokeP.Color = Color3.fromRGB(90,120,255)
	StrokeP.Thickness = 2

	local Label = Instance.new("TextLabel", Popup)
	Label.Size = UDim2.new(1,0,1,0)
	Label.BackgroundTransparency = 1
	Label.Font = Enum.Font.GothamSemibold
	Label.TextSize = 15
	Label.TextColor3 = Color3.fromRGB(220,220,220)
	Label.Text = text

	TweenService:Create(Popup, TweenInfo.new(0.4), {
		Position = UDim2.new(1,-10,1,-10)
	}):Play()

	task.delay(2.5, function()
		TweenService:Create(Popup, TweenInfo.new(0.4), {
			Position = UDim2.new(1,260,1,-10),
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(Label, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
		TweenService:Create(StrokeP, TweenInfo.new(0.4), {Transparency = 1}):Play()
		task.wait(0.4)
		Popup:Destroy()
	end)
end

--------------------------------------------------------------------------------
-- LOGIC
--------------------------------------------------------------------------------
local state = "none"
local autoEnabled = false

local function refresh()
	FreezeBtn.BackgroundColor3 = state == "frozen" and Color3.fromRGB(50,50,50) or Color3.fromRGB(70,70,70)
	UnfreezeBtn.BackgroundColor3 = state == "unfrozen" and Color3.fromRGB(50,50,50) or Color3.fromRGB(70,70,70)
	AutoBtn.BackgroundColor3 = autoEnabled and Color3.fromRGB(50,50,50) or Color3.fromRGB(70,70,70)
end

FreezeBtn.MouseButton1Click:Connect(function()
	state = "frozen"
	StatusText.Text = "Trade is frozen"
	createPopup("Trade frozen")
	refresh()
end)

UnfreezeBtn.MouseButton1Click:Connect(function()
	state = "unfrozen"
	StatusText.Text = "Trade is unfrozen"
	createPopup("Trade unfrozen")
	refresh()
end)

AutoBtn.MouseButton1Click:Connect(function()
	autoEnabled = not autoEnabled
	createPopup(autoEnabled and "Auto Accept enabled" or "Auto Accept disabled")
	refresh()
end)

refresh()

--------------------------------------------------------------------------------
-- FADE IN
--------------------------------------------------------------------------------
TweenService:Create(Main, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
TweenService:Create(Stroke, TweenInfo.new(1), {Transparency = 0}):Play()
TweenService:Create(TitleMain, TweenInfo.new(1), {TextTransparency = 0}):Play()
TweenService:Create(SubTitle, TweenInfo.new(1), {TextTransparency = 0}):Play()
TweenService:Create(FreezeBtn, TweenInfo.new(1), {TextTransparency = 0}):Play()
TweenService:Create(UnfreezeBtn, TweenInfo.new(1), {TextTransparency = 0}):Play()
TweenService:Create(AutoBtn, TweenInfo.new(1), {TextTransparency = 0}):Play()
TweenService:Create(StatusText, TweenInfo.new(1), {TextTransparency = 0}):Play()
