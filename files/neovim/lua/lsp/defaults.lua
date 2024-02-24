local format = function()
    vim.lsp.buf.format({ timeout_ms = 5000 })
end

local keybindings = function(_, bufnr)
    local keybindings = {
        -- goto
        gd = vim.lsp.buf.definition,
        gD = vim.lsp.buf.declaration,
        K = vim.lsp.buf.hover,
        ["<leader>lr"] = vim.lsp.buf.rename,
        ["<leader>lf"] = format,
    }

    for keys, func in pairs(keybindings) do
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end
end

local options = function()
    return {}
end

-- Could this be merged in the function above?
local add_coq_capabilities = function(lsp_options)
    return require('cmp_nvim_lsp').default_capabilities(lsp_options)
end

local handler = function (server_name)
    local lspconfig = require("lspconfig")
    local lsp_options = add_coq_capabilities({})
    lspconfig[server_name].setup(lsp_options)
    -- keybindings()
end

return {
    handler = handler,
    options = options
}
