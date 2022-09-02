require("plugins.plugin")
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	print("Restart neovim after plugins are installed")
	return
end
comment.setup()
require("nvim-autopairs").setup()
require("project_nvim").setup()
require("lsp_signature").setup()
require("mason").setup()
require("plugins.masonlsp")
require("plugins.masonToolInstaller")
require("plugins.colorizer")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.nvimtree")
require("plugins.cmp")
require("plugins.lsp")
require("plugins.nullLs")
