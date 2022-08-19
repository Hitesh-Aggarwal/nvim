local fn = vim.fn

local sep = ''
if (jit.os == 'Windows') then
  sep = '\\'
else
  sep = '/'
end

-- Automatically install packer
local install_path = fn.stdpath'data' .. sep .. 'site' .. sep .. 'pack' .. sep .. 'packer' .. sep .. 'start' .. sep .. 'packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim'
  use 'LunarVim/colorschemes'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'yuezk/vim-js'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    run = function() require('nvim-treesitter.install').compilers = { "clang" } end,
    config = function() require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
      },
    } end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup {
        css = { css = true };
        html = { css = true };
        javascript = { css = true };
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup {
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
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
    end
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'mingw32-make' }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
