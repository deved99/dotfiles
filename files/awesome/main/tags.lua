local awful = require("awful")

local tags = { "1", "2", "3", "4" }
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag(tags, s, awful.layout.layouts[1])
end)

return tags
