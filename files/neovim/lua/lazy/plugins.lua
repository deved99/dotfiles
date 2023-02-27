local plugins = {
    -- Visual plugins
    require("visual.lualine"),
    -- require("visual.which-key"),
    -- General editing
    require("editing.surround"),
    require("editing.comment"),
    require("editing.vim-cool"),
    require("editing.autopairs"),
    -- require("editing.indentline"),
    -- Programming
    require("lsp.treesitter"),
    require("lsp.mason"),
    require("lsp.telescope"),
    require("lsp.fugitive"),
}

local status, colorscheme = pcall(require, 'visual.theme')
if status then
    len = #plugins
    plugins[len + 1] = colorscheme
end

require("lazy").setup(plugins)
