local set_lsp_keybindings = function(_, bufnr)
    local keybindings = {
        gd = vim.lsp.buf.definition,
        ["<leader>lr"] = vim.lsp.buf.rename,
    }
    -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    -- nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    -- -- See `:help K` for why this keymap
    -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    --
    -- -- Lesser used LSP functionality
    -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    for keys, func in pairs(keybindings) do
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end
end

local lsp_default_handler = function (server_name)
    local coq = require('coq')
    local lspconfig = require("lspconfig")


    local lsp_options = {
        on_attach = function(_, bufnr)
            set_lsp_keybindings(_, bufnr)
        end
    }
    lsp_options = coq.lsp_ensure_capabilities(lsp_options)
    lspconfig[server_name].setup(lsp_options)
end

local config = function()
    -- setup mason
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = { "rust_analyzer", "pyright" }
    }

    -- see `help mason-lspconfig-automatic-server-setup`.
    require("mason-lspconfig").setup_handlers {
        lsp_default_handler
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
