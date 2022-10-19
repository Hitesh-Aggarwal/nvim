local o = vim.o
local g = vim.g

o.number = true
o.relativenumber = true
o.lazyredraw = true
o.wrap = false
o.foldmethod = "syntax"
vim.opt.path:append "**"
o.confirm = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1
o.expandtab = true
o.laststatus = 3
o.termguicolors = true
o.cursorline = true
o.undofile = true
o.backup = false
o.swapfile = false
o.scrolloff = 8
o.sidescrolloff = 16
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.history = 50
o.signcolumn = "yes"
o.hlsearch = false

g.mapleader = ";"
g.maplocalleader = ";"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
