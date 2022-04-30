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
function get_variables()
  local terminal = "kitty"
  local editor = "nvim"
  return {
    terminal = terminal,
    terminal_fb = "gnome-terminal",
    browser = "firefox",
    browser_fb = "qutebrowser",
    editor = editor,
    editor_cmd = terminal .. " -e " .. editor,
    modkey = "Mod4",
    accent = "4"
  }
end
function get_colorscheme()
    return require("colors")
end
function get_theme()
  local beautiful = require("beautiful")
  beautiful.init(RC.awesome_dir .. "theme/init.lua")
  return beautiful
end
function get_tags()
  local awful = require("awful")

  local tags = { "1", "2", "3", "4" }
  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag(tags, s, awful.layout.layouts[1])
  end)

  return tags
end
RC = {
  awesome_dir = fs.get_configuration_dir(),
  config_dir = fs.get_dir("config")
}
RC.vars = get_variables(),
RC.colorscheme = get_colorscheme(),
RC.beautiful = get_theme(),
RC.tags = get_tags()
function get_menu()
local beautiful = RC.beautiful
local terminal = RC.vars.terminal
local browser = RC.vars.browser
local editor_cmd = RC.vars.editor_cmd
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

return awful.menu({ items = menu_items } )
end
RC.menu = get_menu()
function set_bar()
  local taglist_buttons = RC.binds.tags
  local tasklist_buttons = RC.binds.task
  local beautiful = RC.beautiful
  local mymainmenu = RC.menu
  -- Keyboard map indicator and switcher
  mykeyboardlayout = awful.widget.keyboardlayout()
  -- Create a textclock widget
  mytextclock = wibox.widget.textclock()
  
  awful.screen.connect_for_each_screen(function(s)
      -- Create a promptbox for each screen
      s.mypromptbox = awful.widget.prompt()
      -- Create an imagebox widget which will contain an icon indicating which layout we're using.
      -- We need one layoutbox per screen.
      s.mylayoutbox = awful.widget.layoutbox(s)
      s.mylayoutbox:buttons(gears.table.join(
                             awful.button({ }, 1, function () awful.layout.inc( 1) end),
                             awful.button({ }, 3, function () awful.layout.inc(-1) end),
                             awful.button({ }, 4, function () awful.layout.inc( 1) end),
                             awful.button({ }, 5, function () awful.layout.inc(-1) end)))
      -- Create a taglist widget
      s.mytaglist = awful.widget.taglist {
          screen  = s,
          filter  = awful.widget.taglist.filter.all,
          buttons = taglist_buttons
      }
  
      s.mytasklist = awful.widget.tasklist {
          screen  = s,
          filter  = awful.widget.tasklist.filter.currenttags,
          buttons = tasklist_buttons
      }
      -- Create the wibox
      s.mywibox = awful.wibar({ position = "top", screen = s, bg = "transparent" })
  
      -- Add widgets to the wibox
      s.mywibox:setup {
          layout = wibox.layout.align.horizontal,
          { -- Left widgets
              layout = wibox.layout.fixed.horizontal,
              s.mytaglist,
              s.mypromptbox,
          },
          s.mytasklist, -- Middle widget
          { -- Right widgets
              layout = wibox.layout.fixed.horizontal,
  	    mpd,
              wibox.widget.systray(),
              mytextclock,
              s.mylayoutbox,
          },
      }
  end)
end
set_bar()
