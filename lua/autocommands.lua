-- Augroups
local basics = vim.api.nvim_create_augroup("basics", { clear = true })
local packer_user_config = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })

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
	pattern = "plugin.lua",
	command = "source <afile> | PackerCompile",
	desc = "Run :PackerCompile when plugin.lua is written",
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
