local copilot_lua = {
        "zbirenbaum/copilot.lua",
        opts = {
            panel = {
                enabled = true,
                auto_refresh = true,
                keymap = {
                    accept = "<C-CR>",
                    jump_prev = "[[",
                    jump_next = "]]",
                    refresh = "gr",
                    open = "<M-CR>",
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<C-CR>",
                    dismiss = "<C-c>",
                    accept_word = "<C-Right>",
                    accept_line = "<C-Down>",
                },
            },
        },
        -- dependencies = { "zbirenbaum/copilot-cmp" }
    }

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        copilot_lua,
        "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    config = function()
        local copilot_chat = require("CopilotChat")
        copilot_chat.setup({
            window = {
                layout = "float",
            }
        })

        vim.keymap.set('n', "<leader>cc", copilot_chat.toggle)
        vim.keymap.set('v', "<leader>cc", copilot_chat.toggle)
    end
}
