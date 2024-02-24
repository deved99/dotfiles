local plugins = {
    -- Visual plugins
    require("visual.lualine"),
    require("visual.markdown"),
    require("visual.colorizer"),
    -- General editing
    require("editing.surround"),
    require("editing.comment"),
    require("editing.vim-cool"),
    require("editing.autopairs"),
    require("filetypes.sxhkd"),
    require("filetypes.yuck"),
    -- Programming
    require("lsp.formatter"),
    require("lsp.git"),
    require("lsp.mason"),
    require("lsp.telescope"),
    require("lsp.treesitter"),
    require("lsp.trouble"),
}

local status, colorscheme = pcall(require, 'visual.theme')
if status then
    local len = #plugins
    plugins[len + 1] = colorscheme
end

require("lazy").setup(plugins)
