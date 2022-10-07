local fzf_ok, fzf_lua = pcall(require, "fzf-lua")
if not fzf_ok then
  return
end

fzf_lua.register_ui_select()

local opts = {
  previewer = false,
  git_icons = false,
  file_icons = false,
}

fzf_lua.setup {
  winopts = {
    height = 0.55,
    width = 0.50,
    row = 0.45,
    col = 0.50,
  },
  files = opts,
  git = {
    files = opts,
  },
  oldfiles = opts,
  buffers = opts,
  grep = {
    git_icons = false,
    file_icons = false,
    winopts = {
      height = 0.85, -- window height
      width = 0.80, -- window width
      row = 0.35, -- window row position (0=top, 1=bottom)
      col = 0.50,
    },
  },
}