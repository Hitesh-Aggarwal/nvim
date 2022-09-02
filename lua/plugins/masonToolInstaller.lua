local status_ok, masonTI = pcall(require, "mason-tool-installer")
if not status_ok then
	return
end

masonTI.setup({
	ensure_installed = {
		"stylua",
		-- "prettierd",
	},
})
