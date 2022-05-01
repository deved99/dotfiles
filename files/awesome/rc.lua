-- [[file:rc.org::*Summary][Summary:1]]
-- [[[[file:~/.dotfiles/files/awesome/rc.org::prepare/libraries][prepare/libraries]]][prepare/libraries]]
local naughty = require("naughty")
local fs = require("gears.filesystem")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
-- prepare/libraries ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::prepare/errors][prepare/errors]]][prepare/errors]]
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
                   title = "Oops, there were errors during startup!",
                   text = awesome.startup_errors })
end
do
  local in_error = false
  local notify_error = function (err)
    if in_error then return end
    in_error = true
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, an error happened!",
                     text = tostring(err) })
    in_error = false
  end
  awesome.connect_signal("debug::error", notify_error)
end
-- prepare/errors ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::prepare/variables][prepare/variables]]][prepare/variables]]
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
  }
end
function get_colorscheme()
    return require("colors")
end
function get_theme()
  local beautiful = require("beautiful")
  beautiful.init(RC.awesome_dir .. "theme.lua")
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
RC.vars = get_variables()
RC.colorscheme = get_colorscheme()
RC.beautiful = get_theme()
RC.tags = get_tags()
RC.binds = {}
-- prepare/variables ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::decorations/menu][decorations/menu]]][decorations/menu]]
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
-- decorations/menu ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::*Summary][Summary]]][]]
function set_global_keys()
  local modkey = RC.vars.modkey
  local N = #RC.tags
  local browser = RC.vars.browser
  local browser_fallback = RC.vars.browser_fb
  local mymainmenu = RC.menu
  local terminal = RC.vars.terminal
  local terminal_fallback = RC.vars.terminal_fb
  local function exec(s)
    return function () awful.spawn(s) end
  end
  
  local misc = gears.table.join(
      awful.key({ modkey,           }, "Escape",      hotkeys_popup.show_help,
                {description="show help", group="awesome"}),
      awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
                {description = "show main menu", group = "awesome"})
  )
  
  local layout = gears.table.join(
      awful.key({ modkey,           }, "j",
          function ()
              awful.client.focus.byidx( 1)
          end,
          {description = "focus next by index", group = "client"}
      ),
      awful.key({ modkey,           }, "k",
          function ()
              awful.client.focus.byidx(-1)
          end,
          {description = "focus previous by index", group = "client"}
      ),
      awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
                {description = "swap with next client by index", group = "client"}),
      awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
                {description = "swap with previous client by index", group = "client"}),
      awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
                {description = "focus the next screen", group = "screen"}),
      awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
                {description = "focus the previous screen", group = "screen"}),
      awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
                {description = "focus urgent", group = "client"}),
      awful.key({ modkey,           }, "Tab",
          function ()
              awful.client.focus.history.previous()
              if client.focus then
                  client.focus:raise()
              end
          end,
          {description = "focus previous", group = "client"}),
      awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
                {description = "increase master width factor", group = "layout"}),
      awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
                {description = "decrease master width factor", group = "layout"}),
      awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
                {description = "increase the number of master clients", group = "layout"}),
      awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
                {description = "decrease the number of master clients", group = "layout"}),
      awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
                {description = "increase the number of columns", group = "layout"}),
      awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
                {description = "decrease the number of columns", group = "layout"}),
      awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
                {description = "select next", group = "layout"}),
      awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
                {description = "select previous", group = "layout"}),
      awful.key({ modkey, "Control" }, "n",
                function ()
                    local c = awful.client.restore()
                    -- Focus restored client
                    if c then
                      c:emit_signal(
                          "request::activate", "key.unminimize", {raise = true}
                      )
                    end
                end,
                {description = "restore minimized", group = "client"})
  )
  
  local programs = gears.table.join(
      -- Standard program
      awful.key({ modkey,           }, "s", exec(terminal),
                {description = "open a terminal", group = "launcher"}),
      awful.key({ modkey, "Shift"   }, "s", exec(terminal_fallback),
                {description = "open a terminal", group = "launcher"}),
      awful.key({ modkey,           }, "b", exec(browser),
                {description = "open a browser", group = "launcher"}),
      awful.key({ modkey, "Shift"   }, "b", exec(browser_fallback),
                {description = "open a browser", group = "launcher"}),
      awful.key({ modkey,           }, "Return", function () awful.spawn("emojis") end,
                {description = "open a browser", group = "launcher"}),
      awful.key({ modkey,           }, "e", exec("emacsclient -c"),
                {description = "open emacs", group = "launcher"}),
      -- Menus
      awful.key({ modkey }, "Tab", function() awful.spawn("menu") end,
                {description = "run menu", group = "launcher"}),
      awful.key({ modkey }, "p", function() awful.spawn("passmenu") end,
                {description = "copy pwd", group = "launcher"})
  )
  
  local notifications = gears.table.join(
      awful.key({ modkey }, "t", exec("timebat"),
                {description = "Show time/battery", group = "notifications"})
  )
  
  local media = gears.table.join(
      -- Brightness
      awful.key({}, "XF86MonBrightnessUp", exec("light -A 10"),
                {description = "Increase brightness", group = "media"}),
      awful.key({}, "XF86MonBrightnessDown", exec("light -U 10"),
                {description = "Decrease brightness", group = "media"}),
      -- Volume
      awful.key({}, "XF86AudioMute", exec("pactl set-sink-mute @DEFAULT_SINK@ toggle "),
                {description = "Toggle volume", group = "media"}),
      awful.key({}, "XF86AudioRaiseVolume", exec("pactl set-sink-volume @DEFAULT_SINK@ +10%"),
                {description = "Raise volume", group = "media"}),
      awful.key({}, "XF86AudioLowerVolume", exec("pactl set-sink-volume @DEFAULT_SINK@ -10%"),
                {description = "Decrease volume", group = "media"}),
      awful.key({ modkey }, "m", exec("btmic"),
                {description = "Toggle mic", group = "media"}),
      -- MPD
      awful.key({}, "XF86AudioPlay", exec("song toggle"),
                {description = "Pause/play music", group = "media"}),
      awful.key({}, "XF86AudioNext", exec("song next"),
                {description = "Next song", group = "media"}),
      awful.key({}, "XF86AudioPrev", exec("song prev"),
                {description = "Prev song", group = "media"}),
      -- Screenshot
      awful.key({}, "Print", exec("flameshot gui"),
                {description = "Screenshot", group = "media"})
  )
  
  -- Bind all key numbers to tags.
  -- Be careful: we use keycodes to make it work on any keyboard layout.
  -- This should map on the top row of your keyboard, usually 1 to 9.
  ws = gears.table.join()
  for i = 1, N do
      ws = gears.table.join(ws,
          -- View tag only.
          awful.key({ modkey }, "#" .. i + 9,
                    function ()
                          local screen = awful.screen.focused()
                          local tag = screen.tags[i]
                          if tag then
                             tag:view_only()
                          end
                    end,
                    {description = "view tag #"..i, group = "tag"}),
          -- Toggle tag display.
          awful.key({ modkey, "Shift" }, "#" .. i + 9,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:move_to_tag(tag)
                            end
                       end
                    end,
                    {description = "move focused client to tag #"..i, group = "tag"})
      )
  end
  
  local global_keys = gears.table.join(misc,layout,programs,media,notifications,ws)
  root.keys(global_keys)
end
set_global_keys()
-- ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::*Summary][Summary]]][]]
function set_global_buttons()
  local mymainmenu = RC.menu
  local modkey = RC.vars.modkey
  local r = gears.table.join(
      awful.button({ }, 3, function () mymainmenu:toggle() end)
  )
  root.buttons(r)
end
set_global_buttons()
-- ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::*Summary][Summary]]][]]
function set_client_keys()
  local modkey = RC.vars.modkey
  
  local r = gears.table.join(
      awful.key({ modkey }, "f",
          function (c)
              c.fullscreen = not c.fullscreen
              c:raise()
          end,
          {description = "toggle fullscreen", group = "client"}),
      awful.key({ modkey, "Shift" }, "q", function (c) c:kill() end,
                {description = "close", group = "client"}),
      awful.key({ modkey }, "o", function (c) c:move_to_screen() end,
                {description = "move to screen", group = "client"}),
      awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle,
                {description = "toggle floating", group = "client"}),
      awful.key({ modkey }, "n",
          function (c)
              -- The client currently has the input focus, so it cannot be
              -- minimized, since minimized clients can't have the focus.
              c.minimized = true
          end ,
          {description = "minimize", group = "client"})
  )
  
  return r
end
RC.binds.ck = set_client_keys()
-- ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::*Summary][Summary]]][]]
function set_client_buttons()
  local modkey = RC.vars.modkey
  
  local r = gears.table.join(
      awful.button({ }, 1, function (c)
          c:emit_signal("request::activate", "mouse_click", {raise = true})
      end),
      awful.button({ modkey }, 1, function (c)
          c:emit_signal("request::activate", "mouse_click", {raise = true})
          awful.mouse.client.move(c)
      end),
      awful.button({ modkey }, 3, function (c)
          c:emit_signal("request::activate", "mouse_click", {raise = true})
          awful.mouse.client.resize(c)
      end)
  )
  
  return r
end
RC.binds.cb = set_client_buttons()
-- ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::*Summary][Summary]]][]]
function set_taglist_buttons()
  local modkey = RC.vars.modkey
  
  -- Create a wibox for each screen and add it
  local r = gears.table.join(
                      awful.button({ }, 1, function(t) t:view_only() end),
                      awful.button({ modkey }, 1, function(t)
                                                if client.focus then
                                                    client.focus:move_to_tag(t)
                                                end
                                            end),
                      awful.button({ }, 3, awful.tag.viewtoggle),
                      awful.button({ modkey }, 3, function(t)
                                                if client.focus then
                                                    client.focus:toggle_tag(t)
                                                end
                                            end),
                      awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                      awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                  )
  
  return r
end
RC.binds.tags = set_taglist_buttons()
-- ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::*Summary][Summary]]][]]
function set_tasklist_buttons()
  local r = gears.table.join(
                       awful.button({ }, 1, function (c)
                                                if c == client.focus then
                                                    c.minimized = true
                                                else
                                                    c:emit_signal(
                                                        "request::activate",
                                                        "tasklist",
                                                        {raise = true}
                                                    )
                                                end
                                            end),
                       awful.button({ }, 3, function()
                                                awful.menu.client_list({ theme = { width = 250 } })
                                            end),
                       awful.button({ }, 4, function ()
                                                awful.client.focus.byidx(1)
                                            end),
                       awful.button({ }, 5, function ()
                                                awful.client.focus.byidx(-1)
                                            end))
  
  return r
end
RC.binds.task = set_tasklist_buttons()
-- ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::workflow/layouts][workflow/layouts]]][workflow/layouts]]
function set_layouts()
  awful.layout.layouts = {
      awful.layout.suit.tile,
      awful.layout.suit.floating,
  }
end
set_layouts()
-- workflow/layouts ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::workflow/rules][workflow/rules]]][workflow/rules]]
local beautiful = RC.beautiful
local clientbuttons = RC.binds.cb
local clientkeys = RC.binds.ck

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    -- Popups -> floating
    { rule_any = {
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        },
        class = { "Gcr-prompter" },
      }, properties = { floating = true, placement = awful.placement.centered }},

    ---- Program -> tags
    -- Tag 1
    { rule = { class = "kitty" },
      properties = { tag = "1" } },
    -- Tag 2
    { rule = { role = "browser" },
      properties = { tag = "2" } },
    { rule = { class = "qutebrowser" },
      properties = { tag = "2" } },
    -- Tag 3
    { rule = { class = "Thunderbird" },
      properties = { tag = "3" } },
    { rule = { class = "Pavucontrol" },
      properties = { tag = "3" } },
}

-- workflow/rules ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::workflow/signals][workflow/signals]]][workflow/signals]]
local beautiful = RC.beautiful

require("awful.autofocus")
require("awful.remote")

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    -- c.shape = gears.shape.rounded_rect
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

------ WALLPAPER

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, false)
    end
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
        set_wallpaper(s)
end)
-- workflow/signals ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::decorations/bar][decorations/bar]]][decorations/bar]]
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
-- decorations/bar ends here
-- [[[[file:~/.dotfiles/files/awesome/rc.org::workflow/autostart][workflow/autostart]]][workflow/autostart]]
RC.autostart = RC.config_dir .. "autostart"
require("awful.util").spawn("chmod +x " .. RC.autostart)
require("awful.util").spawn(RC.autostart)
-- workflow/autostart ends here
-- Summary:1 ends here
