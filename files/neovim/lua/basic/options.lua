local options = {
	number = true,
	relativenumber = true,
    -- tab related options
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
    smartindent = true,
    -- search related
    hlsearch = true,
    incsearch = true,
    -- misc
    wrap = false,
    autochdir = true,
}

for key, val in pairs(options) do
	vim.opt[key] = val
end
