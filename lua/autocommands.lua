-- Augroups
local basics = vim.api.nvim_create_augroup("basics", { clear = true })
local packer_user_config = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })
local betterfold = vim.api.nvim_create_augroup("Better Folding", { clear = true })

-- autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
	group = basics,
	pattern = "*",
	command = "%s/\\s\\+$//e",
	desc = "Removes trailing whitespace before writing file",
})

vim.api.nvim_create_autocmd("FileType", {
	group = basics,
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	desc = "Disables automatic commenting on newline",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = packer_user_config,
	pattern = "plugin.lua",
	command = "source <afile> | PackerCompile",
	desc = "Run :PackerCompile when plugin.lua is written",
})

vim.api.nvim_create_autocmd("FileType", {
	group = betterfold,
	pattern = "*",
	callback = function()
		local status_ok, ntp = pcall(require, "nvim-treesitter.parsers")
		if not status_ok then
			return
		end
		if ntp.has_parser() then
			vim.opt_local.foldmethod = "expr"
			vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
		end
	end,
	desc = "Switch to treesitter folding if parser is available",
})

vim.cmd([[
  function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
  endfunction

  augroup insert_header
  au!
  autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
  augroup END
]])

local attatch_to_buffer = function(output_bufnr, pattern, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("magic", { clear = true }),
		pattern = pattern,
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end

			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "Outputs:" })
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

vim.api.nvim_create_user_command("AutoRun", function()
	local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command: "), " ")
	attatch_to_buffer(tonumber(bufnr), pattern, command)
end, {})
