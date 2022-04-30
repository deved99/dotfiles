local theme_assets = require("beautiful.theme_assets")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

local cs = RC.colorscheme
local height = dpi(25)
local taglist_square_size = dpi(4)

local r = {
	menu_font = "Noto 18",
	menu_submenu_icon = themes_path.."default/submenu.png",
	-- Colors
	menu_bg_normal = cs.black_semi,
	menu_bg_focus = cs.accent_semi,
	menu_fg_normal = cs.white,
	menu_fg_focus = cs.white,
	menu_border_color = cs.accent,
	-- Geometry
	menu_height = height,
	menu_width  = dpi(200),
	taglist_squares_sel = theme_assets.taglist_squares_sel(
	    taglist_square_size, cs.accent
	),
	taglist_squares_unsel = theme_assets.taglist_squares_unsel(
	    taglist_square_size, cs.white
	),
	awesome_icon = theme_assets.awesome_icon(
	    height, cs.transparent, cs.accent
	),
}

return r
