-- Aliased to avoid Treesitter error
local vim_cmd = vim.cmd

return {
    'rose-pine/neovim', 
    name = 'rose-pine', 
    config = function() 
        vim_cmd('colorscheme rose-pine') 
    end
}
