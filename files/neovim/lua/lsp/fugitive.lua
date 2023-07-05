local config = function()
    local git = function()
        local git_cmd = "Git"
        vim.cmd(git_cmd)
    end
    vim.keymap.set('n', "<leader>g", git)
end

return {
    "tpope/vim-fugitive",
    config = config
}
