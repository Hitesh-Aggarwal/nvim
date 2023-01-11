local fn = vim.fn

local sep = ""
if jit.os == "Windows" then
  sep = "\\"
else
  sep = "/"
end

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. sep .. "lazy" .. sep .. "lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

return lazy.setup{
  "lewis6991/impatient.nvim",
  "wbthomason/packer.nvim",
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  "norcalli/nvim-colorizer.lua",
  "neovim/nvim-lspconfig",

  "L3MON4D3/LuaSnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",

  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "ray-x/lsp_signature.nvim",
  "kyazdani42/nvim-web-devicons",
  "jose-elias-alvarez/null-ls.nvim",
  "nvim-lua/plenary.nvim",
  "williamboman/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  "onsails/lspkind.nvim",
  "Shatur/neovim-session-manager",
  "lewis6991/gitsigns.nvim",
  "j-hui/fidget.nvim",
  "folke/neodev.nvim",
  "ibhagwan/fzf-lua",
  "feline-nvim/feline.nvim",
  "SmiteshP/nvim-navic",
  "folke/tokyonight.nvim",
  "tamago324/lir.nvim",

  { "akinsho/toggleterm.nvim", version = "v2.*" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  },
}
