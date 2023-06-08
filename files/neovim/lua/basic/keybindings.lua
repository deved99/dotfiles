local format = function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
end


local keybindings = {
    -- goto
    gd = vim.lsp.buf.definition,
    gD = vim.lsp.buf.declaration,
    K = vim.lsp.buf.hover,
    ["<leader>lr"] = vim.lsp.buf.rename,
    ["<leader>lf"] = format,
}

for keys, func in pairs(keybindings) do
    vim.keymap.set('n', keys, func)
end
