-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("main.error_handling")

local fs = require("gears.filesystem")
RC = {
	vars = require("vars"),
	colorscheme = require("colors"),
	awesome_dir = fs.get_configuration_dir(),
	config_dir = fs.get_dir("config")
}
-- Theme
local beautiful = require("beautiful")
beautiful.init(RC.awesome_dir .. "theme/init.lua")
RC.beautiful = beautiful
require("main.layouts")
RC.tags = require("main.tags")
RC.menu = require("main.menu")
RC.binds = {
	gb = require("bind.global_buttons"),
	gk = require("bind.global_keys"),
	cb = require("bind.client_buttons"),
	ck = require("bind.client_keys"),
	tags = require("bind.taglist_buttons"),
	task = require("bind.tasklist_buttons")
}

-- require("deco.titlebar")
require("deco.bar")

root.buttons(RC.binds.gb)
root.keys(RC.binds.gk)

require("main.rules")
require("main.signals")
require("awful.util").spawn(RC.config_dir .. "autostart")
