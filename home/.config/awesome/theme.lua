require("awful.util")
theme = dofile("/usr/share/awesome/themes/default/theme.lua")
theme.wallpaper_cmd = { "awsetbg -T " .. awful.util.getdir("config") .. "/wallpapers/almostblack.png" }
--theme.wallpaper_cmd = { "awsetbg -T " .. awful.util.getdir("config") .. "/wallpapers/black-Linen.png" }
theme.font = "sans 9"
return theme
