local line_ok, lualine = pcall(require, "lualine")
if not line_ok then
  return
end

lualine.setup({
	options = {
		theme = "one_monokai",
	},
})
