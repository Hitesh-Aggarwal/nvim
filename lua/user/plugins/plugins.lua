local fn = vim.fn

local sep = ""
if jit.os == "Windows" then
  sep = "\\"
else
  sep = "/"
end

-- Automatically install packer
local install_path = fn.stdpath "data"
  .. sep
  .. "site"
  .. sep
  .. "pack"
  .. sep
  .. "packer"
  .. sep
  .. "start"
  .. sep
  .. "packer.nvim"
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

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "lewis6991/impatient.nvim"
  use "wbthomason/packer.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "neovim/nvim-lspconfig"

  use "L3MON4D3/LuaSnip"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"

  use "rafamadriz/friendly-snippets"
  use "williamboman/mason.nvim"
  use "ray-x/lsp_signature.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "jose-elias-alvarez/null-ls.nvim"
  use "nvim-lua/plenary.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "WhoIsSethDaniel/mason-tool-installer.nvim"
  use "onsails/lspkind.nvim"
  use "cpea2506/one_monokai.nvim"
  use "Shatur/neovim-session-manager"
  use "lewis6991/gitsigns.nvim"
  use "j-hui/fidget.nvim"
  use "folke/lua-dev.nvim"
  use "ibhagwan/fzf-lua"
  use "feline-nvim/feline.nvim"
  use "Hitesh-Aggarwal/feline_one_monokai.nvim"

  use { "akinsho/toggleterm.nvim", tag = "v2.*" }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  }

  if PACKER_BOOTSTRAP then
    print "Installing plugins"
    require("packer").sync()
  end
end)
