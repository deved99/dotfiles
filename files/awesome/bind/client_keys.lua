local awful = require("awful")
local gears = require("gears")

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
