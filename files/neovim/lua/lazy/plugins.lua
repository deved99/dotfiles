plugins = {
    -- Visual plugins
    require("visual.lualine"),
    -- require("visual.which-key"),
    -- General editing
    require("editing.surround"),
    require("editing.comment"),
    -- require("editing.indentline"),
    -- Programming
    require("lsp.treesitter"),
    require("lsp.mason"),
    require("lsp.telescope"),
}

local status, colorscheme = pcall(require, 'visual.theme')
if status then
    len = #plugins
    plugins[len + 1] = colorscheme
end

require("lazy").setup(plugins)
