local config = function()
    local git_status = function()
        vim.cmd("Git")
    end
    vim.keymap.set('n', "<leader>gg", git_status)
end

local gitsigns = {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup{
          signcolumn = false,
          numhl = true,
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Normal mode
            map('n', '<leader>gs', gs.stage_hunk)
            map('n', '<leader>gS', gs.stage_buffer)
            map('n', '<leader>gR', gs.reset_buffer)
            map('n', '<leader>gp', gs.preview_hunk)
            map('n', '<leader>gb', gs.toggle_current_line_blame)
            map('n', '<leader>gd', gs.toggle_deleted)
            map('n', '<leader>gD', gs.diffthis)
            -- Visual mode
            map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            -- Text object, i.e. operator mode
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end
        }
    end
}

return {
    "tpope/vim-fugitive",
    config = config,
    dependencies = {
        gitsigns
    }
}
