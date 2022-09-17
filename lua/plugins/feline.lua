local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local one_monokai = {
	fg = "#abb2bf",
	bg = "#1e2024",
	green = "#98c379",
	yellow = "#e5c07b",
	purple = "#c678dd",
	orange = "#d19a66",
	peanut = "#f6d5a4",
	red = "#e06c75",
	aqua = "#61afef",
	darkblue = "#26292f",
	dark_red = "#f75f5f",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local neovimModeHighlight = function()
	return {
		fg = "darkblue",
		bg = require("feline.providers.vi_mode").get_mode_color(),
		style = "bold",
		name = "NeovimModeHLColor",
	}
end

local components = {
	active = {
		{
			-- left side components
			{
				provider = {
					name = "vi_mode",
					opts = {
						show_mode_name = true,
						-- padding = "center", -- Uncomment for extra padding.
					},
				},
				hl = neovimModeHighlight,
				left_sep = "block",
				right_sep = "right_filled",
			},
			{
				provider = "git_branch",
				hl = {
					fg = "darkblue",
					bg = "peanut",
					style = "bold",
				},
				left_sep = "left_filled",
				right_sep = "right_filled",
			},
			{
				provider = "git_diff_added",
				hl = {
					fg = "darkblue",
					bg = "green",
				},
				left_sep = "left_rounded",
				right_sep = "right_rounded",
			},
			{
				provider = "git_diff_removed",
				hl = {
					fg = "darkblue",
					bg = "red",
				},
				left_sep = "left_rounded",
				right_sep = "right_rounded",
			},
			{
				provider = "git_diff_changed",
				hl = {
					fg = "darkblue",
					bg = "fg",
				},
				left_sep = "left_rounded",
				right_sep = "right_rounded",
			},
			{
				provider = "",
			},
		},
		{
			-- middle components
			{
				provider = {
					name = "file_info",
					opts = {
						type = "relative-short",
					},
				},
				hl = {
					style = "bold",
				},
				left_sep = " ",
				right_sep = " ",
			},
			{
				provider = "diagnostic_errors",
			},
			{
				provider = "diagnostic_warnings",
			},
			{
				provider = "diagnostic_hints",
			},
			{
				provider = "diagnostic_info",
			},
		},
		{
			-- right side components
			{
				provider = "lsp_client_names",
				hl = {
					fg = "darkblue",
					bg = "purple",
					style = "bold",
				},
				left_sep = "left_filled",
				right_sep = "block",
			},
			{
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = true,
						case = "titlecase",
					},
				},
				hl = {
					fg = "darkblue",
					bg = "dark_red",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			{
				provider = "file_encoding",
				hl = {
					fg = "darkblue",
					bg = "peanut",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			{
				provider = "position",
				hl = neovimModeHighlight,
				-- hl = {
				-- 	fg = "darkblue",
				-- 	bg = "dark_red",
				-- 	style = "bold",
				-- },
				left_sep = "block",
				right_sep = "block",
			},
			{
				provider = "line_percentage",
				hl = {
					fg = "darkblue",
					bg = "aqua",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			{
				provider = "scroll_bar",
				hl = {
          fg = "yellow",
					style = "bold",
				},
			},
		},
	},
	inactive = {
		{
			-- left side components
		},
		{
			-- middle components
			FileName,
		},
		{
			-- right side components
			{},
		},
	},
}

feline.setup({
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
})
