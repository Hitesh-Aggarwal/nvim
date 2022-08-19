if (vim.bo.filetype ~= 'c') then
  return
end

if (jit.os == 'Windows') then
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':wall<CR>:!mingw32-make<CR>' , { noremap = true })
else
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':wall<CR>:!make<CR>' , { noremap = true })
end

local lo = vim.opt_local
lo.foldmethod = "expr"
lo.foldexpr = "nvim_treesitter#foldexpr()"
