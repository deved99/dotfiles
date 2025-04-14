local defaults = require("lsp.defaults")

local lua_handler = function()
    local lsp_options = defaults.options()
    lsp_options.settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    }
    require('lspconfig').lua_ls.setup(lsp_options)
end

local rust_handler = function()
    local lsp_options = defaults.options()
    lsp_options.settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
            cargo = {
                features = "all",
            },
        }
    }
    require('lspconfig').rust_analyzer.setup(lsp_options)
end

local config = function()
    -- setup mason
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "rust_analyzer", "pyright", "lua_ls", "ansiblels", "ts_ls"}
    }

    -- see `help mason-lspconfig-automatic-server-setup`.
    require("mason-lspconfig").setup_handlers {
        defaults.handler,
        lua_ls = lua_handler,
        rust_analyzer = rust_handler
    }

    require("lint").linters_by_ft = {
        python = {"flake8",}
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
end

local dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-lint",
    -- Completions
    require("lsp.completion"),
}

return {
    'williamboman/mason.nvim',
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    dependencies = dependencies,
    config = config
}
