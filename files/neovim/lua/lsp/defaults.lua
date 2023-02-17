local keybindings = function(_, bufnr)
    local keybindings = {
        -- goto
        gd = vim.lsp.buf.definition,
        gD = vim.lsp.buf.declaration,
        K = vim.lsp.buf.hover,
        ["<leader>lr"] = vim.lsp.buf.rename,
        ["<leader>lf"] = vim.lsp.buf.format,
    }

    for keys, func in pairs(keybindings) do
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end
end

local options = function()
    return {
        on_attach = function(_, bufnr)
            keybindings(_, bufnr)
        end
    }
end

-- Could this be merged in the function above?
local add_coq_capabilities = function(lsp_options)
    local coq = require('coq')
    return coq.lsp_ensure_capabilities(lsp_options)
end

local handler = function (server_name)
    local lspconfig = require("lspconfig")

    local lsp_options = options()
    lsp_options = add_coq_capabilities(lsp_options)
    lspconfig[server_name].setup(lsp_options)
end

return {
    handler = handler,
    options = options
}
