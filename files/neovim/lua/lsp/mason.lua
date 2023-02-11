local config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "rust_analyzer", "pyright" }
    }

    -- Connect LSP to completion
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- see `help mason-lspconfig-automatic-server-setup`.
    require("mason-lspconfig").setup_handlers {
        function (server_name)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end
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
