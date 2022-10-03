vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ':w<CR>:TermExec cmd="python3 %"<CR>', { noremap = true })

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
