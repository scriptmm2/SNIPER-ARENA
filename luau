local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

local SCRIPT_URL = "https://raw.githubusercontent.com/scriptmm2/arena/refs/heads/main/logic"
local DISCORD_INVITE = "https://discord.gg/2D3atd73y"

local function getGuiParent()
    if type(gethui) == "function" then
        local ok, result = pcall(gethui)
        if ok and result then
            return result
        end
    end

    return CoreGui
end

local gui = Instance.new("ScreenGui")
gui.Name = "AdvancedESP_DiscordGate"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = getGuiParent()

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.fromScale(0.5, 0.5)
shadow.Size = UDim2.fromOffset(374, 224)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.45
shadow.BorderSizePixel = 0
shadow.Parent = gui

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 10)
shadowCorner.Parent = shadow

local main = Instance.new("Frame")
main.Name = "Main"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.fromScale(0.5, 0.5)
main.Size = UDim2.fromOffset(360, 210)
main.BackgroundColor3 = Color3.fromRGB(17, 19, 24)
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 9)
mainCorner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(43, 49, 64)
stroke.Thickness = 1
stroke.Transparency = 0.15
stroke.Parent = main

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 48)
topBar.BackgroundColor3 = Color3.fromRGB(20, 23, 29)
topBar.BorderSizePixel = 0
topBar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 9)
topCorner.Parent = topBar

local topMask = Instance.new("Frame")
topMask.AnchorPoint = Vector2.new(0, 1)
topMask.Position = UDim2.new(0, 0, 1, 0)
topMask.Size = UDim2.new(1, 0, 0, 10)
topMask.BackgroundColor3 = topBar.BackgroundColor3
topMask.BorderSizePixel = 0
topMask.Parent = topBar

local accent = Instance.new("Frame")
accent.Name = "Accent"
accent.Position = UDim2.fromOffset(0, 47)
accent.Size = UDim2.new(1, 0, 0, 1)
accent.BackgroundColor3 = Color3.fromRGB(84, 108, 255)
accent.BorderSizePixel = 0
accent.Parent = main

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(18, 8)
title.Size = UDim2.new(1, -36, 0, 20)
title.Font = Enum.Font.GothamBold
title.Text = "Discord Access"
title.TextColor3 = Color3.fromRGB(235, 238, 245)
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.fromOffset(18, 27)
subtitle.Size = UDim2.new(1, -36, 0, 15)
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "Join our Discord to continue"
subtitle.TextColor3 = Color3.fromRGB(132, 139, 154)
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = topBar

local bodyText = Instance.new("TextLabel")
bodyText.BackgroundTransparency = 1
bodyText.Position = UDim2.fromOffset(20, 67)
bodyText.Size = UDim2.new(1, -40, 0, 36)
bodyText.Font = Enum.Font.Gotham
bodyText.Text = "Copy the invite below, then the script will load automatically."
bodyText.TextWrapped = true
bodyText.TextColor3 = Color3.fromRGB(178, 184, 197)
bodyText.TextSize = 12
bodyText.TextXAlignment = Enum.TextXAlignment.Left
bodyText.TextYAlignment = Enum.TextYAlignment.Top
bodyText.Parent = main

local inviteBox = Instance.new("Frame")
inviteBox.Position = UDim2.fromOffset(20, 112)
inviteBox.Size = UDim2.new(1, -40, 0, 34)
inviteBox.BackgroundColor3 = Color3.fromRGB(23, 26, 33)
inviteBox.BorderSizePixel = 0
inviteBox.Parent = main

local inviteCorner = Instance.new("UICorner")
inviteCorner.CornerRadius = UDim.new(0, 6)
inviteCorner.Parent = inviteBox

local inviteStroke = Instance.new("UIStroke")
inviteStroke.Color = Color3.fromRGB(39, 44, 56)
inviteStroke.Thickness = 1
inviteStroke.Parent = inviteBox

local inviteLabel = Instance.new("TextLabel")
inviteLabel.BackgroundTransparency = 1
inviteLabel.Position = UDim2.fromOffset(11, 0)
inviteLabel.Size = UDim2.new(1, -22, 1, 0)
inviteLabel.Font = Enum.Font.Code
inviteLabel.Text = DISCORD_INVITE
inviteLabel.TextColor3 = Color3.fromRGB(196, 201, 213)
inviteLabel.TextSize = 11
inviteLabel.TextXAlignment = Enum.TextXAlignment.Left
inviteLabel.TextTruncate = Enum.TextTruncate.AtEnd
inviteLabel.Parent = inviteBox

local button = Instance.new("TextButton")
button.Name = "ContinueButton"
button.Position = UDim2.fromOffset(20, 158)
button.Size = UDim2.new(1, -40, 0, 34)
button.BackgroundColor3 = Color3.fromRGB(70, 91, 224)
button.AutoButtonColor = false
button.BorderSizePixel = 0
button.Font = Enum.Font.GothamBold
button.Text = "COPY INVITE & CONTINUE"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 12
button.Parent = main

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = button

do
    local dragging = false
    local dragStart
    local startPosition

    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPosition = main.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
            shadow.Position = UDim2.new(
                main.Position.X.Scale,
                main.Position.X.Offset + 7,
                main.Position.Y.Scale,
                main.Position.Y.Offset + 7
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

button.MouseEnter:Connect(function()
    TweenService:Create(
        button,
        TweenInfo.new(0.12),
        {BackgroundColor3 = Color3.fromRGB(82, 104, 245)}
    ):Play()
end)

button.MouseLeave:Connect(function()
    TweenService:Create(
        button,
        TweenInfo.new(0.12),
        {BackgroundColor3 = Color3.fromRGB(70, 91, 224)}
    ):Play()
end)

local busy = false

button.MouseButton1Click:Connect(function()
    if busy then
        return
    end

    busy = true
    button.Text = "COPYING..."

    local copied = pcall(function()
        if type(setclipboard) == "function" then
            setclipboard(DISCORD_INVITE)
        elseif type(toclipboard) == "function" then
            toclipboard(DISCORD_INVITE)
        else
            error("Clipboard API is not available")
        end
    end)

    if not copied then
        button.Text = "CLIPBOARD API NOT AVAILABLE"
        task.wait(1.5)
        button.Text = "COPY INVITE & CONTINUE"
        busy = false
        return
    end

    button.Text = "LOADING..."

    gui:Destroy()

    task.defer(function()
        local ok, err = pcall(function()
            local source = game:HttpGet(SCRIPT_URL)
            local chunk = loadstring(source)

            if not chunk then
                error("Failed to compile main script")
            end

            chunk()
        end)

        if not ok then
            warn("[Advanced ESP Loader] Failed to load main script:", err)
        end
    end)
end)
