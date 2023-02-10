plugins = {
  require("visual.lualine"),
  -- {'williamboman/mason.nvim', lazy = false},
  require("lsp.treesitter"),
}

require("lazy").setup(plugins)
