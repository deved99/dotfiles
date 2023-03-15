-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', "<leader>", "<Nop>")

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
    ignorecase = true,
    smartcase = true,
    -- misc
    clipboard = {"unnamedplus"},
    wrap = false,
    signcolumn = "yes",
}

for key, val in pairs(options) do
	vim.opt[key] = val
end
