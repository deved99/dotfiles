local config = function()
    local trouble = require("trouble")
    trouble.setup {}

    local keybindings = {
        ["<leader>ld"] = "<cmd>TroubleToggle<cr>",
    }

    for keys, func in pairs(keybindings) do
        vim.keymap.set('n', keys, func)
    end
end

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config
}
