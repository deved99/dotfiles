local plugins = {
    -- Visual plugins
    require("visual.lualine"),
    require("visual.markdown"),
    -- require("visual.which-key"),
    -- General editing
    require("editing.surround"),
    require("editing.comment"),
    require("editing.vim-cool"),
    require("editing.autopairs"),
    require("editing.autopairs"),
    -- require("editing.indentline"),
    require("filetypes.sxhkd"),
    require("filetypes.yuck"),
    -- Programming
    require("lsp.fugitive"),
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
