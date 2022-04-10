local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local r = {
	layout_fairh = themes_path.."default/layouts/fairhw.png",
	layout_fairv = themes_path.."default/layouts/fairvw.png",
	layout_floating  = themes_path.."default/layouts/floatingw.png",
	layout_magnifier = themes_path.."default/layouts/magnifierw.png",
	layout_max = themes_path.."default/layouts/maxw.png",
	layout_fullscreen = themes_path.."default/layouts/fullscreenw.png",
	layout_tilebottom = themes_path.."default/layouts/tilebottomw.png",
	layout_tileleft   = themes_path.."default/layouts/tileleftw.png",
	layout_tile= themes_path.."default/layouts/tilew.png",
	layout_tiletop = themes_path.."default/layouts/tiletopw.png",
	layout_spiral  = themes_path.."default/layouts/spiralw.png",
	layout_dwindle = themes_path.."default/layouts/dwindlew.png",
	layout_cornernw = themes_path.."default/layouts/cornernww.png",
	layout_cornerne = themes_path.."default/layouts/cornernew.png",
	layout_cornersw = themes_path.."default/layouts/cornersww.png",
	layout_cornerse = themes_path.."default/layouts/cornersew.png",
}

return r
