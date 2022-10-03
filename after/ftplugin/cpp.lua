if jit.os == "Windows" then
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>r",
    ':w<CR>:TermExec cmd="g++ -g -Wall <C-R>% -o out\\<C-R>%<BS><BS><BS>exe && .\\out\\<C-R>%<BS><BS><BS>exe"<CR>',
    { noremap = true }
  )
else
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>r",
    ':w<CR>:TermExec cmd="g++ -g -Wall % -o out/%:r && ./out/%:r"<CR>',
    { noremap = true }
  )
end
