require("user.plugins.plugins")
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  print "Restart neovim after plugins are installed"
  return
end
comment.setup()
require("Comment").setup()
require("nvim-autopairs").setup()
require("lsp_signature").setup()
require("mason").setup()
require("gitsigns").setup()
require("fidget").setup()
require("neodev").setup {}
require "user.plugins.session_manager"
require "user.plugins.feline"
require "user.plugins.masonlsp"
require "user.plugins.masonToolInstaller"
require "user.plugins.colorizer"
require "user.plugins.treesitter"
require "user.plugins.fzf_lua"
require "user.plugins.toggleterm"
require "user.plugins.nvimtree"
require "user.plugins.cmp"
require "user.plugins.lsp"
require "user.plugins.nullLs"
require "user.plugins.navic"
