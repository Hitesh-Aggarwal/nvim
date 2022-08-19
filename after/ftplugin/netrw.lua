local m = vim.api.nvim_buf_set_keymap
m(0, '', 'r', '<C-L>' , { noremap = true })
m(0, '', '<C-L>', '<C-W>l' , { noremap = true })
