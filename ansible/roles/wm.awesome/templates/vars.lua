local terminal = "alacritty"
local editor = "nvim"
return {
   terminal = terminal,
   terminal_fb = "gnome-terminal",
   browser = "{{ BROWSER }}",
   browser_fb = "{{ BROWSER_FALLBACK }}",
   editor = editor,
   editor_cmd = terminal .. '-e' .. editor,
   modkey = "Mod4",
}
