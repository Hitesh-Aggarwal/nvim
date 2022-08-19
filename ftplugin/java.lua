local lo = vim.opt_local
lo.foldmethod = "expr"
lo.foldexpr = "nvim_treesitter#foldexpr()"
