local options = {
    mkdp_page_title = "${name}",
    mkdp_theme = "light",
    mkdp_auto_start = 1,
    mkdp_preview_options = {
        sync_scroll_type = "middle"
    },
}
for key, value in pairs(options) do
    vim.g[key] = value
end

return {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end
}
