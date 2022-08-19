local sep = ''
if (jit.os == 'Windows') then
  sep = '\\'
else
  sep = '/'
end

-- Helper function
function read_file(filetype)
  local path = vim.fn.stdpath('config') .. sep .. 'skel'.. sep .. filetype .. '.skel'
  vim.cmd("0r " .. path)
end

-- Augroups
local write_skeleton = vim.api.nvim_create_augroup("WriteSkeleton" , { clear = true })
local basics = vim.api.nvim_create_augroup("basics", { clear = true })
local packer_user_config = vim.api.nvim_create_augroup("PackerUserConfig", {clear = true})

-- autocommands
vim.api.nvim_create_autocmd("BufNewFile", {
  group = write_skeleton,
  pattern = "*.c",
  callback = function(args) read_file('c') end,
  desc = "Skeleton code for c files"
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = write_skeleton,
  pattern = "*.cpp",
  callback = function(args) read_file('cpp') end,
  desc = "Skeleton code for cpp files"
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = write_skeleton,
  pattern = "*.html",
  callback = function(args) read_file('html') end,
  desc = "Skeleton code for html files"
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = basics,
  pattern = "*",
  command = "%s/\\s\\+$//e",
  desc = "Removes trailing whitespace before writing file"
})

vim.api.nvim_create_autocmd("FileType", {
  group = basics,
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
  desc = "Disables automatic commenting on newline"
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = packer_user_config,
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
  desc = "Run packersync when plugins.lua is written"
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
