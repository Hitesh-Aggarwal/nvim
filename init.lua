local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  print('Restart neovim after installing plugins')
end
require('plugins')
require('settings')
require('mappings')
require('autocommands')
require('colorscheme')
