local config = function()
    -- requires
    local lsp = require("lsp-zero")
    local cmp = require("cmp")

    -- preset
    lsp.preset({
      name = "recommended",
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })

    -- nvim-cmp configuration
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    })
    cmp_mappings['<Tab>'] = nil
    cmp_mappings['<S-Tab>'] = nil
    lsp.setup_nvim_cmp({
        mapping = cmp_mappings
    })

    -- ensure installed
    lsp.ensure_installed({
        "pyright",
        "rust_analyzer",
        "sumneko_lua"
    })

    -- setup
    lsp.setup()
end

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  config = config,
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  }
}
