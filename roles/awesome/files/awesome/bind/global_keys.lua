-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

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

return gears.table.join(misc,layout,programs,media,notifications,ws)
