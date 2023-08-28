local keybindings = {
    -- goto
    gd = vim.lsp.buf.definition,
    gD = vim.lsp.buf.declaration,
    K = vim.lsp.buf.hover,
    ["<leader>lr"] = vim.lsp.buf.rename,
}

for keys, func in pairs(keybindings) do
    vim.keymap.set('n', keys, func)
end
