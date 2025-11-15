local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "H|X",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "H|X Interface Suite",
   LoadingSubtitle = "by XLVY up 1",
   ShowText = "H|X", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "H|X settings"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠Home", nill) -- Title, Image
local Section = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "H|X Notification",
   Content = "Hello",
   Duration = 5,
   Image = nill,
})

local Button = MainTab:CreateButton({
   Name = "inf jump",
   Callback = function()
_G.infinjump = not _G.infinjump

if not _G.infinJumpStarted then
    _G.infinJumpStarted = true

    game.StarterGui:SetCore("SendNotification", {
        Title = "Youtube Hub",
        Text = "Infinite Jump Activated!",
        Duration = 5
    })

    local plr = game:GetService("Players").LocalPlayer
    local UIS = game:GetService("UserInputService")

    UIS.JumpRequest:Connect(function()
        if _G.infinjump then
            local char = plr.Character
            local humanoid = char and char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       local char = player.Character
       local humanoid = char and char:FindFirstChildOfClass("Humanoid")

       if humanoid then
           humanoid.WalkSpeed = Value
       end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 50,
   Flag = "Sliderjp",
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})
