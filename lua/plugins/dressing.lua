local dressing_ok, dressing = pcall(require, "dressing")
if not dressing_ok then
  return
end

dressing.setup {
  input = {
    enabled = false,
  },
  select = {
    backend = { "fzf_lua", "builtin" },
  },
}