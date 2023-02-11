plugins = {
  require("visual.lualine"),
  require("lsp.treesitter"),
  -- general editing
  require("editing.surround"),
  require("editing.comment"),
  require("editing.indentline"),
}

require("lazy").setup(plugins)
