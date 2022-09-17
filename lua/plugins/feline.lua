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

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = "darkblue",
				bg = require("feline.providers.vi_mode").get_mode_color(),
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "right_filled",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "darkblue",
			bg = "peanut",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "right_filled",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "darkblue",
			bg = "green",
		},
		left_sep = "left_rounded",
		right_sep = "right_rounded",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "darkblue",
			bg = "red",
		},
		left_sep = "left_rounded",
		right_sep = "right_rounded",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "darkblue",
			bg = "fg",
		},
		left_sep = "left_rounded",
		right_sep = "right_rounded",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
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
	diagnostic_errors = {
		provider = "diagnostic_errors",
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "darkblue",
			bg = "purple",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
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
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "darkblue",
			bg = "peanut",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "darkblue",
			bg = "green",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "darkblue",
			bg = "aqua",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffChanged,
	c.gitDiffRemoved,
	c.separator,
}

local middle = {
	c.fileinfo,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local right = {
	c.lsp_client_names,
	c.file_type,
	c.file_encoding,
	c.position,
	c.line_percentage,
	c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
})
