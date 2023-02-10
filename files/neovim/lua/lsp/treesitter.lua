config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "lua", "python", "rust" },
      auto_install = true,
      highlight = { enable = true },
    }
end

return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = config,
}
