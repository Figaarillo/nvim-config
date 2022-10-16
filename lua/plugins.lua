--[[ local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
]]

-- =============================================================
--					                   PLUGINS
-- =============================================================

-- =========================== Packer ==========================
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'Shatur/neovim-ayu'
  use 'Mofiqul/dracula.nvim'
  use "olimorris/onedarkpro.nvim"
  use {
    'feline-nvim/feline.nvim',
      requires = {
        'lewis6991/gitsigns.nvim',
        'kyazdani42/nvim-web-devicons'
    },
  }
end)
