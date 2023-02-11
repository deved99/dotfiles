plugins = {
  require("visual.lualine"),
  require("visual.which-key"),
  -- general editing
  require("editing.surround"),
  require("editing.comment"),
  require("editing.indentline"),
  -- programming
  require("lsp.treesitter"),
}

require("lazy").setup(plugins)
