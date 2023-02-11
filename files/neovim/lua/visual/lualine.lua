vim.opt.showmode = false

local config = function()
    require("lualine").setup { 
        options = {
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        },
        sections = {
            lualine_x = {'filetype'},
        },
    }
end

return {
    "nvim-lualine/lualine.nvim",
    config = config
}
