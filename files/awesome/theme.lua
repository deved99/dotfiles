local cs = RC.colorscheme
local function merge(v)
    local r = {}
    for _,t in pairs(v) do
        for k,v in pairs(t) do
            r[k] = v
        end
    end
    return r
end
local function get_general()
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

  return r
end
function get_menu()
  local theme_assets = require("beautiful.theme_assets")
  local xresources = require("beautiful.xresources")
  local dpi = xresources.apply_dpi

  local gfs = require("gears.filesystem")
  local themes_path = gfs.get_themes_dir()

  local height = dpi(25)
  local taglist_square_size = dpi(4)

  local r = {
          menu_font = "noto 18",
          menu_submenu_icon = themes_path.."default/submenu.png",
          -- colors
          menu_bg_normal = cs.black_semi,
          menu_bg_focus = cs.accent_semi,
          menu_fg_normal = cs.white,
          menu_fg_focus = cs.white,
          menu_border_color = cs.accent,
          -- geometry
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
end
local function get_notifications()  
  local r = {
          notification_font = "Noto Sans 18",
          notification_bg = cs.black,
          notification_fg = cs.accent,
          notification_border_color = cs.accent,
          --notification_border_width = 10
  }

  return r
end
local function get_bar()
  local r = {
          taglist_fg_focus = cs.black,
          taglist_bg_focus = cs.accent,
          tasklist_fg_normal = cs.grey,
          tasklist_fg_focus = cs.white,
          tasklist_bg_minimize = cs.black_semi,
          tasklist_fg_minimize = cs.grey,
  }

  return r
end
local function get_layouts()
  local r = {
          taglist_fg_focus = cs.black,
          taglist_bg_focus = cs.accent,
          tasklist_fg_normal = cs.grey,
          tasklist_fg_focus = cs.white,
          tasklist_bg_minimize = cs.black_semi,
          tasklist_fg_minimize = cs.grey,
  }

  return r
end

v = {
  general = get_general(),
  menu = get_menu(),
  notifications = get_notifications(),
  bar = get_bar(),
  layouts = get_layouts(),
}
return merge(v)
