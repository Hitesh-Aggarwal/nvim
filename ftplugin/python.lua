vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':w<CR>:TermExec cmd="python3 %"<CR>' , { noremap = true })

local lo = vim.opt_local
lo.tabstop = 4
lo.shiftwidth = 4
