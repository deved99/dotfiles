local config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "lua", "python", "rust", "yaml", "gitcommit" },
      highlight = { 
          enable = true,
          disable = {"vim"},
      },
    }
end

return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = config,
}
