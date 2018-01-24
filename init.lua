function reload_config(files)
   hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

function screenOneLayout()
   local windowLayout = {
      {"Terminal", "Terminal", hs.screen.allScreens()[1]:name(), nil, nil, hs.geometry.rect(0,-48, 400, 48)}
   }
   hs.layout.apply(windowLayout)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
   local win = hs.window.focusedWindow()
   local f = win:frame()

   f.x = f.x - 10
   win:setFrame(f)
   
   hs.alert.show("Window moved 10 px to the left.")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x
   f.y = max.y
   f.w = max.w / 2
   f.h = max.h
   win:setFrame(f)
end)

local computerScreen = "U28D590"
local windowLayout = {
   {"iTunes", "iTunes", computerScreen, hs.layout.left50, nil, nil}
}

screenOneLayout()