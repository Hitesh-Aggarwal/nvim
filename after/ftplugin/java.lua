vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ':wall<CR>:TermExec cmd="javac % && java %:r"<CR>', { noremap = true, silent = true })
