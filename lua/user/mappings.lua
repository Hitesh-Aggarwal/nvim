-- Functional wrapper for mapping custom keybindings
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Easy window switching
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Easy window resizing
map("n", "<C-Up>", ":vertical resize +2<CR>")
map("n", "<C-Down>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":resize +2<CR>")
map("n", "<C-Left>", ":resize -2<CR>")

-- Easy window moving
map("n", "<m-left>", "<C-w>H")
map("n", "<m-down>", "<C-w>J")
map("n", "<m-up>", "<C-w>K")
map("n", "<m-right>", "<C-w>L")

-- Move lines up and down with ALT-k and ALT-j
map("v", "<m-j>", ":m '>+1<CR>gv=gv")
map("v", "<m-k>", ":m '<-2<CR>gv=gv")
map("i", "<m-j>", "<esc>:m .+1<CR>==i")
map("i", "<m-k>", "<esc>:m .-2<CR>==i")
map("n", "<m-j>", ":m .+1<CR>==")
map("n", "<m-k>", ":m .-2<CR>==")

-- Quickly open config file
map("n", "<leader>c", ":e <C-R>=stdpath('config') . '/init.lua'<CR><CR>")

-- Open FileExplorer
map("n", "<leader>e", '<cmd>lua require("lir.float").toggle()<CR>')

-- Change directory to current file
map("n", "<leader>d", ":lcd %:p:h<CR>")

-- Session manager
map("n", "<leader>sl", "<cmd>SessionManager load_session<CR>")
map("n", "<leader>sd", "<cmd>SessionManager delete_session<CR>")

-- Fzf-lua
map("n", "<leader>ff", '<cmd>lua require("fzf-lua").files()<CR>')
map("n", "<leader>fr", '<cmd>lua require("fzf-lua").live_grep()<CR>')
map("n", "<leader>b", '<cmd>lua require("fzf-lua").buffers()<CR>')
map("n", "<leader>o", '<cmd>lua require("fzf-lua").oldfiles()<CR>')

