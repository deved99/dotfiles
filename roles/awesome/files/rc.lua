local naughty = require("naughty")
local fs = require("gears.filesystem")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

function get_tags()
    local awful = require("awful")

    local tags = { "1", "2", "3", "4" }
    awful.screen.connect_for_each_screen(function(s)
        -- Each screen has its own tag table.
        awful.tag(tags, s, awful.layout.layouts[1])
    end)

    return tags
end
RC.tags = get_tags()

function set_bar()
  local taglist_buttons = RC.binds.tags
  local tasklist_buttons = RC.binds.task
  local beautiful = RC.beautiful
  local mymainmenu = RC.menu
end
set_bar()
