if (jit.os == "Windows") then
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':w<CR>:!g++ -g -Wall <C-R>% -o out\\<C-R>%<BS><BS><BS>exe && .\\out\\<C-R>%<BS><BS><BS>exe<CR>' , { noremap = true })
else
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':w<CR>:!g++ -g -Wall % -o out/%:r && ./out/%:r<CR>' , { noremap = true })
end

local lo = vim.opt_local
lo.foldmethod = "expr"
lo.foldexpr = "nvim_treesitter#foldexpr()"
