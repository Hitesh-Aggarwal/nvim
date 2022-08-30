local fn = vim.fn

local sep = ''
local tool = ''
if (jit.os == 'Windows') then
  sep = '\\'
  tool = 'mingw32-make'
else
  sep = '/'
  tool = 'make'
end

-- Automatically install packer
local install_path = fn.stdpath('data') .. sep .. 'site' .. sep .. 'pack' .. sep .. 'packer' .. sep .. 'start' .. sep .. 'packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd [[ packadd packer.nvim ]]
  print "Installing packer"
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim'
  use 'LunarVim/colorschemes'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'yuezk/vim-js'
  use "windwp/nvim-autopairs"
  use 'numToStr/Comment.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use "ahmedkhalf/project.nvim"
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  use "williamboman/mason.nvim"
  use "ray-x/lsp_signature.nvim"
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'jose-elias-alvarez/null-ls.nvim'

  use {"akinsho/toggleterm.nvim", tag = 'v2.*'}

  use {'nvim-telescope/telescope-fzf-native.nvim', run = tool}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  if PACKER_BOOTSTRAP then
    print("Installing plugins")
    require('packer').sync()
  end
end)