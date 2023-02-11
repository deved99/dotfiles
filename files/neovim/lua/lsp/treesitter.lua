local config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "lua", "python", "rust" },
      auto_install = true,
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
