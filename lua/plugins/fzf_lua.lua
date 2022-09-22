local fzf_ok, fzf_lua = pcall(require, "fzf-lua")
if not fzf_ok then
  return
end

local opts = {
  previewer = false,
  winopts = {
    height = 0.55,
    width = 0.50,
    row = 0.45,
    col = 0.50,
  },
}

fzf_lua.setup {
  files = opts,
  git = {
    files = opts,
  },
  oldfiles = opts,
  buffers = opts,
}

local M = {}

M.project_files = function()
  local _ = vim.fn.system "git rev-parse --is-inside-work-tree"
  if vim.fn.eval "v:shell_error" == 0 then
    fzf_lua.git_files()
  else
    fzf_lua.files()
  end
end

M.live_grep = function()
  fzf_lua.live_grep()
end
M.buffers = function()
  fzf_lua.buffers()
end
M.oldFiles = function()
  fzf_lua.oldfiles()
end

return M
