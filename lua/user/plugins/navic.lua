local navic_ok, navic = pcall(require, "nvim-navic")
if not navic_ok then
  return
end

navic.setup {
  highlight = true,
}
