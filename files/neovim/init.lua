require("basic.options")
require("basic.keybindings")
require("basic.autocmds")

-- Bootstrap the package manager.
require("lazy.bootstrap")
require("lazy.plugins")

-- Set gui options
if vim.g.neovide then
    require("basic.gui")
end
