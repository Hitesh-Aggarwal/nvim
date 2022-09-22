require "plugins.plugin"
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  print "Restart neovim after plugins are installed"
  return
end
comment.setup()
require("nvim-autopairs").setup()
require("lsp_signature").setup()
require("mason").setup()
require("gitsigns").setup()
require("fidget").setup()
require("lua-dev").setup()
require "plugins.masonlsp"
require "plugins.masonToolInstaller"
require "plugins.colorizer"
require "plugins.treesitter"
require "plugins.fzf_lua"
require "plugins.toggleterm"
require "plugins.nvimtree"
require "plugins.cmp"
require "plugins.lsp"
require "plugins.nullLs"
