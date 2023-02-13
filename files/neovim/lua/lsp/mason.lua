local defaults = require("lsp.defaults")

local lua_handler = function()
    local lsp_options = defaults.options()
    lsp_options.settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
    }
    require'lspconfig'.lua_ls.setup(lsp_options)
end

local config = function()
    -- setup mason
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "rust_analyzer", "pyright", "lua_ls" }
    }

    -- see `help mason-lspconfig-automatic-server-setup`.
    require("mason-lspconfig").setup_handlers {
        defaults.handler,
        lua_ls = lua_handler
    }
end

local dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    require("lsp.completion"),
}

return {
    'williamboman/mason.nvim',
    lazy = false,
    dependencies = dependencies,
    config = config
}