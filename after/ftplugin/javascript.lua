vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ':w<CR>:TermExec cmd="node %"<CR>', { noremap = true })
