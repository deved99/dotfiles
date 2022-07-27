local terminal = "kitty"
local editor = "nvim"
return {
   terminal = "emacsclient -ce '(multi-vterm)'",
   terminal_fb = "kitty",
   browser = "{{ BROWSER }}",
   browser_fb = "{{ BROWSER_FALLBACK }}",
   editor = editor,
   editor_cmd = "emacsclient -c",
   modkey = "Mod4",
}
