if (vim.bo.filetype ~= 'javascript') then
  return
end

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':w<CR>:!node %<CR>' , { noremap = true })
