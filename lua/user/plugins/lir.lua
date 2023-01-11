return {
  "tamago324/lir.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local lir_ok, actions = pcall(require, "lir.actions")
    if not lir_ok then
      return
    end
    local mark_actions = require "lir.mark.actions"
    local clipboard_actions = require "lir.clipboard.actions"

    require("lir").setup {
      show_hidden_files = true,
      devicons_enable = true,
      mappings = {
        ["l"] = actions.edit,
        ["o"] = actions.edit,
        ["<CR>"] = actions.edit,
        ["<C-s>"] = actions.split,
        ["<C-v>"] = actions.vsplit,
        ["<C-t>"] = actions.tabedit,

        ["-"] = actions.up,
        ["h"] = actions.up,
        ["q"] = actions.quit,
        ["<ESC>"] = actions.quit,

        ["A"] = actions.mkdir,
        ["a"] = actions.newfile,
        ["R"] = actions.rename,
        ["@"] = actions.cd,
        ["Y"] = actions.yank_path,
        ["."] = actions.toggle_show_hidden,
        ["d"] = actions.delete,

        ["J"] = function()
          mark_actions.toggle_mark()
          vim.cmd "normal! j"
        end,
        ["C"] = clipboard_actions.copy,
        ["X"] = clipboard_actions.cut,
        ["P"] = clipboard_actions.paste,
      },
      float = {
        winblend = 0,
        win_opts = function()
          local width = math.floor(vim.o.columns * 0.7)
          local height = math.floor(vim.o.lines * 0.7)
          return {
            border = {
              "+",
              "─",
              "+",
              "│",
              "+",
              "─",
              "+",
              "│",
            },
            width = width,
            height = height,
            row = math.floor((vim.o.lines - height) / 2) - 2,
            col = math.floor((vim.o.columns - width) / 2),
          }
        end,
      },
      hide_cursor = false,
      on_init = function()
        -- use visual mode
        vim.api.nvim_buf_set_keymap(
          0,
          "x",
          "J",
          ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
          { noremap = true, silent = true }
        )

        -- echo cwd
        vim.api.nvim_echo({ { vim.fn.expand "%:p", "Normal" } }, false, {})
      end,
    }
  end,
}
