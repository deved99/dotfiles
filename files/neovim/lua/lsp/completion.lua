local cmp_format = function()
    local lspkind = require("lspkind")
    return lspkind.cmp_format()
end

local config = function()
    local cmp = require("cmp")
    local sources = {
        {name = "nvim_lsp"}
    }
    vim.opt.completeopt = {"menu", "menuone", "noselect"}
    cmp.setup({
        format = cmp_format(),
        sources = cmp.config.sources(sources, {{ name = "buffer" }}),
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
    })
end

return {
    "hrsh7th/nvim-cmp",
    config = config,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- custom formatting
        "onsails/lspkind.nvim",
    }
}
