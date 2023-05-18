local coq_startup = "COQnow --shut-up"

local config = function()
    vim.opt.completeopt = {"menu", "menuone", "noselect"}
    -- Putting the string directly here breaks Treesitter ¯\_(ツ)_/¯
    vim.cmd(coq_startup)
end

local coq_artifacts = {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
}

return {
    "ms-jpq/coq_nvim",
    build = ":COQdeps",
    branch = "coq",
    dependencies = {
        coq_artifacts,
        "ms-jpq/coq.thirdparty"
    },
    config = config,
}
