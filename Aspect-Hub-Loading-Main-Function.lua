local AspectHubLoading = {}

local AspectHubLoadingGui = loadstring(game:HttpGet(("https://raw.githubusercontent.com/DesyncDeveloper/Aspect-Hub/main/Aspect-Hub-Loading-GUI.lua")))().LoadingGui()

local frame = AspectHubLoadingGui.Frame
local tofill = frame.Loadframe
local fill = frame.Fill
local status = frame.Status
local currentad = frame.Advertise.Image
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local DesyncBlur = Instance.new("BlurEffect", Lighting)
DesyncBlur.Size = 0

function AspectHubLoading:StartLoading()
	
	TweenService:Create(DesyncBlur, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = 24}):Play()
	AspectHubLoadingGui.Enabled = true

	local Speed = 2

	task.spawn(function()
		while wait(0.1) do
			if not _G.Loaded and fill.Size ~= UDim2.new(0, 28, 0, 15) then
				Speed = 8
				status.Text = "Loading."
				status.Text = "Loading.."
				status.Text = "Loading..."
				task.wait(0.1)
			else
				Speed = 2
				break
			end
		end
	end)

	task.wait(2)
	fill.BackgroundTransparency = 0
	fill:TweenSize(UDim2.new(0, 28, 0, 15),"Out","Sine",Speed)
	repeat wait(0.1) until fill.Size == UDim2.new(0, 28, 0, 15)
	task.wait(2)
	status.Text = "Initiating response..."
	fill:TweenSize(UDim2.new(0, 55, 0, 15),"Out","Sine",2)
	task.wait(2)
	status.Text = "Creating UI..."
	fill:TweenSize(UDim2.new(0, 93, 0, 15),"Out","Sine",2)
	task.wait(2)
	status.Text = "Completing response..."
	fill:TweenSize(UDim2.new(0, 110, 0, 15),"Out","Sine",2)
	task.wait(2)
	status.Text = "Loaded"
	task.wait(0.01)
	TweenService:Create(DesyncBlur, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = 0}):Play()
	wait(0.01)
	if AspectHubLoadingGui then
		AspectHubLoadingGui:Destroy()
	end
end

local updateLog = loadstring(game:HttpGet(("https://raw.githubusercontent.com/DesyncDeveloper/Aspect-Hub/main/Aspect-Hub-Loading-Updates.lua")))()

function AspectHubLoading:AddUpdateLog(update)
	local Template = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Item = Instance.new("TextLabel")
	local Info = Instance.new("TextLabel")
	local Verify = Instance.new("ImageLabel")

	Template.Name = "Template"
	Template.Parent = AspectHubLoadingGui.Frame.Advertise.UpdateLog.ScrollingFrame
	Template.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Template.Size = UDim2.new(0, 308, 0, 68)

	UICorner.Parent = Template

	Item.Name = update.updateName
	Item.Parent = Template
	Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Item.BackgroundTransparency = 1.000
	Item.Position = UDim2.new(0.0376321375, 0, 0.0200599227, 0)
	Item.Size = UDim2.new(0, 132, 0, 19)
	Item.Font = Enum.Font.Unknown
	Item.Text = update.updateName
	Item.TextColor3 = Color3.fromRGB(255, 255, 255)
	Item.TextScaled = true
	Item.TextSize = 14.000
	Item.TextWrapped = true
	Item.TextXAlignment = Enum.TextXAlignment.Left

	Info.Name = "Info"
	Info.Parent = Template
	Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Info.BackgroundTransparency = 1.000
	Info.Position = UDim2.new(0.0376321375, 0, 0.299471676, 0)
	Info.Size = UDim2.new(0, 284, 0, 41)
	Info.Font = Enum.Font.Unknown
	Info.Text = update.description
	Info.TextColor3 = Color3.fromRGB(255, 255, 255)
	Info.TextScaled = true
	Info.TextSize = 14.000
	Info.TextWrapped = true
	Info.TextXAlignment = Enum.TextXAlignment.Left

	Verify.Name = "Verify"
	Verify.Parent = Template
	Verify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Verify.BackgroundTransparency = 1.000
	Verify.Position = UDim2.new(0.925324678, 0, 0.647058785, 0)
	Verify.Size = UDim2.new(0, 34, 0, 33)
	Verify.Image = "http://www.roblox.com/asset/?id=12625903994"
end

function AspectHubLoading:Start()
	task.spawn(function()
		for i, update in ipairs(updateLog) do
			AspectHubLoading:AddUpdateLog(update)
		end
	end)

	AspectHubLoading:StartLoading()

	task.wait(25)
	if AspectHubLoadingGui then
		AspectHubLoadingGui:Destroy()
	end
end

return AspectHubLoading
