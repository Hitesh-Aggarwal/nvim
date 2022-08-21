local sep = ''
if (jit.os == 'Windows') then
  sep = '\\'
else
  sep = '/'
end

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true , silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Easy window switching
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Easy window resizing
map('n', '<C-Up>'   , ':vertical resize +2<CR>')
map('n', '<C-Down>' , ':vertical resize -2<CR>')
map('n', '<C-Right>', ':resize +2<CR>')
map('n', '<C-Left>' , ':resize -2<CR>')

-- Easy window moving
map('n', '<m-left>' , '<C-w>H')
map('n', '<m-down>' , '<C-w>J')
map('n', '<m-up>'   , '<C-w>K')
map('n', '<m-right>', '<C-w>L')

-- Move lines up and down with ALT-k and ALT-j
map('v', "<m-j>", ":m '>+1<CR>gv=gv")
map('v', "<m-k>", ":m '<-2<CR>gv=gv")
map('i', "<m-j>", "<esc>:m .+1<CR>==i")
map('i', "<m-k>", "<esc>:m .-2<CR>==i")
map('n', '<m-j>', ':m .+1<CR>==')
map('n', '<m-k>', ':m .-2<CR>==')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Go to next and previous buffers easily
map('n', '<C-n>', ':bnext<CR>')
map('n', '<C-p>', ':bprevious<CR>')
map('n', '<leader>b', "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")

-- Quickly open config file
map('n', '<leader>c', ":e <C-R>=stdpath('config') . '" .. sep .. "init.lua'<CR><CR>")

-- browse old files
map('n', '<leader>o', "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")

-- Escape key goes to normal mode in terminal
map('t', '<Esc>' , '<C-\\><C-n>')

-- Telescope
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")
map('n', '<leader>fr', "<cmd>lua require'telescope.builtin'.live_grep()<CR>")

-- Change directory to current file
map('n', '<leader>d', ':lcd %:p:h<CR>')

-- Completion with the tab key
vim.cmd([[
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction
]])

map('i', '<Tab>', 'CleverTab()', { expr = true })
