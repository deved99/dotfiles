local config = function()
    vim.opt.completeopt = {"menu", "menuone", "noselect"}
    vim.cmd("COQnow --shut-up")
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
        coq_artifacts
    },
    config = config,
}
