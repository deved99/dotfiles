local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local beautiful = RC.beautiful
local terminal = RC.vars.terminal
local browser = RC.vars.browser
local editor_cmd = RC.vars.editor_cmd

-- Create a launcher widget and a main menu
local awesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local menu_items = {
	{ "open terminal", terminal },
	{ "open browser", browser },
	{ "awesome", awesomemenu, beautiful.awesome_icon },
}

local mymenu = awful.menu({ items = menu_items } )

return mymenu
