local format = function()
    local format_cmd = "Neoformat"
    vim.cmd(format_cmd)
end

local config = function()
    vim.keymap.set('n', "<leader>lf", format)
end

return {
    "sbdchd/neoformat",
    config = config
}
