local status_ok, nullls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = nullls.builtins.formatting

nullls.setup({
	sources = {
		formatting.stylua,
	},
})
