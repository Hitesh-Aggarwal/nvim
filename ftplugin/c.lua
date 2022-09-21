if vim.bo.filetype ~= "c" then
  return
end

if jit.os == "Windows" then
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ':wall<CR>:TermExec cmd="mingw32-make"<CR>', { noremap = true })
else
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ':wall<CR>:TermExec cmd="make"<CR>', { noremap = true })
end
