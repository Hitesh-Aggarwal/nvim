local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  print('Restart neovim after plugins are installed')
  return
else
  comment.setup()
end

require('nvim-autopairs').setup{}

require'colorizer'.setup {
  css = { css = true };
  html = { css = true };
  javascript = { css = true };
}

if (jit.os == 'Windows') then
  require('nvim-treesitter.install').compilers = { "clang" }
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'cpp' , 'python','lua', 'vim' },
  sync_install = false,
  highlight = {
    enable = true,
  },
}

local telescope = require('telescope')
telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
telescope.load_extension('fzf')
