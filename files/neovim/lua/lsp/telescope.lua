local telescope_fzf_native = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = "make"
}

local config = function()
    local builtin = require("telescope.builtin")
    local keybindings = {
        -- find file
        ["<leader>ff"] = builtin.find_files,
        ["<leader>fb"] = builtin.buffers,
        ["<leader>fg"] = builtin.live_grep,
        ["<leader>fh"] = builtin.oldfiles,
        -- help
        ["<leader>h"] = builtin.help_tags,
        -- code navigation
        ["<leader>lu"] = builtin.lsp_references,
        -- ["<leader>ld"] = builtin.diagnostics,
        ["<leader>i"] = builtin.treesitter,
        --  Resume
        ["<leader> "] = builtin.resume,
    }

    for keys, func in pairs(keybindings) do
        vim.keymap.set('n', keys, func)
    end

    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    }
    require("telescope").load_extension("fzf")
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        telescope_fzf_native
    },
    config = config
}
