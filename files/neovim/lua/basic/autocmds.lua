vim.api.nvim_create_autocmd(
    { "BufEnter" },
    {
        pattern = { "*.yml", "*.yaml" },
        callback = function()
            if vim.api.nvim_buf_get_name(0):match("ansible.*playbooks.*[.]ya?ml") then
                vim.bo.filetype = "yaml.ansible"
            end
        end
    }
)
