require("awful.util")
theme = dofile("/usr/share/awesome/themes/default/theme.lua")
theme.wallpaper_cmd = { "awsetbg -T " .. awful.util.getdir("config") .. "/wallpaper.png" }
theme.font = "sans 8"
return theme
