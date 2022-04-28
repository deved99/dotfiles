local naughty = require("naughty")
local fs = require("gears.filesystem")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    local notify_error = function (e)
        if in_error then return end
        in_error = true
        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end
    awesome.connect_signal("debug::error", notify_error)
end

function set_bar()
  local taglist_buttons = RC.binds.tags
  local tasklist_buttons = RC.binds.task
  local beautiful = RC.beautiful
  local mymainmenu = RC.menu
end
set_bar()
