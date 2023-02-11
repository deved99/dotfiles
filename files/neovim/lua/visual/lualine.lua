vim.opt.showmode = false

local config = function()
    require("lualine").setup { 
        options = {
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch'},
            lualine_c = {'filename'},
            lualine_x = {'diagnostics'},
            lualine_y = {'filetype'},
            lualine_z = {'location'}
        },
    }
end

return {
    "nvim-lualine/lualine.nvim",
    config = config
}
