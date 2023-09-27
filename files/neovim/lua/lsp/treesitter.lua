local ensure_installed = {
    "bash",
    "gitcommit",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "sql",
    "yaml",
}

local config = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = ensure_installed,
        highlight = {
            enable = true,
            disable = { "vim" },
        },
        indent = {
            enable = true,
        }
    }
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config,
}
