local colorscheme = "one_monokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local one_ok, onemonokai = pcall(require, "one_monokai")
if not one_ok then
	return
end

onemonokai.setup({
	themes = function()
		return {
			Normal = { bg = "#1e222a" , fg = "#abb2bf"},
		}
	end,
})
