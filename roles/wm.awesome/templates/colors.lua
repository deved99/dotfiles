-- Colorscheme
local c = {
    "{{ CS_TERM[0] }}",
    "{{ CS_TERM[1] }}",
    "{{ CS_TERM[2] }}",
    "{{ CS_TERM[3] }}",
    "{{ CS_TERM[4] }}",
    "{{ CS_TERM[5] }}",
    "{{ CS_TERM[6] }}",
    "{{ CS_TERM[7] }}",
    "{{ CS_TERM[8] }}",
    "{{ CS_TERM[9] }}",
    "{{ CS_TERM[10] }}",
    "{{ CS_TERM[11] }}",
    "{{ CS_TERM[12] }}",
    "{{ CS_TERM[13] }}",
    "{{ CS_TERM[14] }}",
    "{{ CS_TERM[15] }}"
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
r.white_semi = r.white .. alpha
r.white_semi = r.grey .. alpha
r.accent_semi = r.accent .. alpha

return r
