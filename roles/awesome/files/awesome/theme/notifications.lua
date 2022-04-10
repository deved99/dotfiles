-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

local cs = RC.colorscheme

local r = {
	notification_font = "Noto Sans 18",
	notification_bg = cs.black,
	notification_fg = cs.accent,
	notification_border_color = cs.accent,
	--notification_border_width = 10
}

return r
