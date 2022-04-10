local terminal = "kitty"
local editor = "nvim"

local r = {
	terminal = terminal,
	terminal_fb = "gnome-terminal",
	browser = "firefox",
	browser_fb = "qutebrowser",
	editor = editor,
	editor_cmd = terminal .. " -e " .. editor,
	modkey = "Mod4",
	accent = "4"
}

return r
