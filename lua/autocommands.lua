-- Augroups
local basics = vim.api.nvim_create_augroup("basics", { clear = true })
local packer_user_config = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })
local betterfold = vim.api.nvim_create_augroup("Better Folding", { clear = true })

-- autocommands

vim.api.nvim_create_autocmd("BufWritePre", {
	group = basics,
	pattern = "*",
	command = "%s/\\s\\+$//e",
	desc = "Removes trailing whitespace before writing file",
})

vim.api.nvim_create_autocmd("FileType", {
	group = basics,
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	desc = "Disables automatic commenting on newline",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = packer_user_config,
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
	desc = "Run :PackerCompile when plugins.lua is written",
})


vim.api.nvim_create_autocmd("FileType", {
  group = betterfold,
  pattern = "*",
  callback = function()
    local status_ok, ntp = pcall(require, "nvim-treesitter.parsers")
    if not status_ok then
      return
    end
    if ntp.has_parser() then
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    end
  end,
  desc = "Switch to treesitter folding if parser is available",
})


vim.cmd([[
  function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
  endfunction

  augroup insert_header
  au!
  autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
  augroup END
]])
