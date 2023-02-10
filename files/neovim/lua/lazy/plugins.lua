plugins = {
  'nvim-lualine/lualine.nvim',
  {'williamboman/mason.nvim', lazy = false},
}

require("lazy").setup(plugins)
