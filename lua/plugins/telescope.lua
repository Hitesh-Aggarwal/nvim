local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        previewer = false,
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
telescope.load_extension "fzf"
telescope.load_extension "ui-select"

local M = {}

local builtin = require "telescope.builtin"
local opts = require("telescope.themes").get_dropdown { previewer = false } -- define here if you want to define something

M.project_files = function()
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

M.live_grep = function()
  builtin.live_grep()
end
M.buffers = function()
  builtin.buffers(opts)
end
M.oldFiles = function()
  builtin.oldfiles(opts)
end

return M
