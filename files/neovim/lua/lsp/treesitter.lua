local ensure_installed = {
    "bash",
    "gitcommit",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
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
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,

                keymaps = {
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = "@class.inner",
                  ["al"] = "@loop.outer",
                  ["il"] = "@loop.inner",
                  ["ia"] = "@parameter.inner",
                  ["aa"] = "@parameter.outer",
                  ["iA"] = "@call.inner",
                  ["aA"] = "@call.outer",
                },

                selection_modes = {
                  ["@function.outer"] = "V",
                  ["@function.inner"] = "V",
                  ["@class.outer"] = "V",
                  ["@class.inner"] = "V",
                  ["@loop.outer"] = "V",
                  ["@loop.inner"] = "V",
                },
            },
        },
    }

    require("treesitter-context").setup {
        enable = true,
        separator = '-',
        max_lines = 5,
        multiline_threshold = 1,
        trim_scope = 'inner',
    }

    vim.cmd([[
        hi! link TreesitterContext NONE
    ]])
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    }
}
