local awful = require("awful")
local gears = require("gears")

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
