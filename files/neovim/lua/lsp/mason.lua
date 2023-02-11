local config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "rust_analyzer", "pyright" }
    }
    -- see `help mason-lspconfig-automatic-server-setup`.
    require("mason-lspconfig").setup_handlers {
        function (server_name)
            require("lspconfig")[server_name].setup {}
        end
    }
end

local dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}

return {
    'williamboman/mason.nvim',
    lazy = false,
    dependencies = dependencies,
    config = config
}
