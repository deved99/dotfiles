-- Accent index
local N = 5

-- Colorscheme
local c = {
    "#1d1f21",
    "#cc342b",
    "#198844",
    "#fba922",
    "#3971ed",
    "#a36ac7",
    "#3971ed",
    "#c5c8c6",
    "#969896",
    "#cc342b",
    "#198844",
    "#fba922",
    "#3971ed",
    "#a36ac7",
    "#3971ed",
    "#ffffff"
}

-- Return
local r = {
	black = c[1],
	white = c[16],
	grey = c[9],
	red = c[2],
	accent = c[N],
	transparent = "#00000000",
	n = N,
	cs = c
}
alpha = "80"
r.black_semi = r.black .. alpha
r.accent_semi = r.accent .. alpha

return r
