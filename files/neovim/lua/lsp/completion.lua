local config = function()
    vim.opt.completeopt = {"menu", "menuone", "noselect"}
    vim.cmd("COQnow --shut-up")
end

return {
    "ms-jpq/coq_nvim",
    build = ":COQdeps",
    branch = "coq",
    config = config,
}
