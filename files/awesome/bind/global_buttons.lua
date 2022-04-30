local awful = require("awful")
local gears = require("gears")

local mymainmenu = RC.menu
local modkey = RC.vars.modkey

local r = gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
)

return r
