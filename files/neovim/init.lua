-- [[file:init.org::*Summary][Summary:1]]
-- [[[[file:~/.dotfiles/files/neovim/init.org::*Summary][Summary]]][]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- ends here
-- [[[[file:~/.dotfiles/files/neovim/init.org::*Summary][Summary]]][]]
require('packer').startup(function(use)
  -- [[[[file:~/.dotfiles/files/neovim/init.org::*Summary][Summary]]][]]
  use 'wbthomason/packer.nvim'
  -- ends here
  -- [[[[file:~/.dotfiles/files/neovim/init.org::*Summary][Summary]]][]]
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- ends here
  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- ends here
-- [[[[file:~/.dotfiles/files/neovim/init.org::*Summary][Summary]]][]]
require('nvim-treesitter.configs').setup {
  -- Ensure these are installed:
  ensure_installed = { "c", "lua", "rust" },
  sync_install = false,
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
-- ends here
-- Summary:1 ends here
