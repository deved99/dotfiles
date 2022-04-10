local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local r = {
	-- closed
	titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png",
	titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png",
	-- minimize
	titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png",
	titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png",
	-- ontop
	titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png",
	titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png",
	titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png",
	titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png",
	-- stick
	titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png",
	titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png",
	titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png",
	titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png",
	-- floating
	titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png",
	titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png",
	titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png",
	titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png",
	-- maximized
	titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png",
	titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png",
	titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png",
	titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png",
}

return r
