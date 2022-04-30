local cs = RC.colorscheme

local r = {
	font          = "Noto Sans 10",
	bg_normal     = cs.transparent,
	bg_focus      = cs.transparent,
	bg_urgent     = cs.red,
	bg_minimize   = cs.grey,
	bg_systray    = cs.black,
	fg_normal     = cs.white,
	fg_focus      = cs.accent,
	fg_urgent     = cs.white,
	fg_minimize   = cs.white,
	-- Gap & border
	useless_gap   = 5,
	border_width  = 3,
	border_normal = cs.grey,
	border_focus  = cs.accent,
	border_marked = cs.red,
	wallpaper = "~/bg.jpg",
	icon_theme = nil
}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"


return r
