-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
    number = true,
    relativenumber = true,
    -- no timeout for leader, please
    timeout = false,
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
    signcolumn = "yes",
}

for key, val in pairs(options) do
	vim.opt[key] = val
end
