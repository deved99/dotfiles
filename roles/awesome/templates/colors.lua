-- Colorscheme
local c = {
    "{{ CS[0] }}",
    "{{ CS[1] }}",
    "{{ CS[2] }}",
    "{{ CS[3] }}",
    "{{ CS[4] }}",
    "{{ CS[5] }}",
    "{{ CS[6] }}",
    "{{ CS[7] }}",
    "{{ CS[8] }}",
    "{{ CS[9] }}",
    "{{ CS[10] }}",
    "{{ CS[11] }}",
    "{{ CS[12] }}",
    "{{ CS[13] }}",
    "{{ CS[14] }}",
    "{{ CS[15] }}"
}

-- Return
local r = {
	black = "{{ CS_BG }}",
	white = "{{ CS_FG }}",
	grey = c[9],
	red = c[2],
	accent = "{{ CS_ACC }}",
	transparent = "#00000000",
	cs = c
}
alpha = "80"
r.black_semi = r.black .. alpha
r.accent_semi = r.accent .. alpha

return r
