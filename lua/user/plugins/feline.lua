local feline_ok, feline = pcall(require, "feline")
if not feline_ok then
  return
end

local one_monokai = {
  fg = "#abb2bf",
  bg = "#282c34",
  bg2 = "#1e222a",
  green = "#98c379",
  yellow = "#e5c07b",
  purple = "#c678dd",
  orange = "#d19a66",
  peanut = "#f6d5a4",
  red = "#e06c75",
  aqua = "#61afef",
  dark_red = "#f75f5f",
}

local w = {
  file_name = {
    provider = "file_info",
    hl = {
      fg = "aqua",
      bg = "bg2",
    },
  },
  navic = {
    provider = require("nvim-navic").get_location,
    enabled = require("nvim-navic").is_available,
    hl = {
      bg = "bg2",
    },
  },
  separator = {
    provider = " ",
    hl = {
      bg = "bg2",
    },
    enabled = require("nvim-navic").is_available,
    right_sep = {
      str = "slant_right_thin",
      hl = {
        bg = "bg2",
      },
    },
  },
  space = {
    provider = " ",
    hl = {
      bg = "bg2",
    },
  },
}

local s = {
  end_pts = {
    provider = " ",
    hl = {
      fg = "aqua",
      bg = "aqua",
    },
  },
  separator = {
    provider = " ",
  },
  gitBranch = {
    provider = "git_branch",
    hl = {
      fg = "purple",
      style = "bold",
    },
    left_sep = "block",
    right_sep = "block",
  },
  gitDiffAdded = {
    provider = "git_diff_added",
    hl = {
      fg = "green",
    },
  },
  gitDiffRemoved = {
    provider = "git_diff_removed",
    hl = {
      fg = "red",
    },
  },
  gitDiffChanged = {
    provider = "git_diff_changed",
    hl = {
      fg = "fg",
    },
  },
  diagnostic_errors = {
    provider = "diagnostic_errors",
    hl = {
      fg = "dark_red",
    },
  },
  diagnostic_warnings = {
    provider = "diagnostic_warnings",
    hl = {
      fg = "yellow",
    },
  },
  diagnostic_hints = {
    provider = "diagnostic_hints",
    hl = {
      fg = "aqua",
    },
  },
  diagnostic_info = {
    provider = "diagnostic_info",
  },
  lsp_client_names = {
    provider = "lsp_client_names",
    hl = {
      fg = "peanut",
    },
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
    left_sep = "block",
    right_sep = "block",
  },
  position = {
    provider = "position",
    hl = {
      fg = "green",
    },
    left_sep = "block",
    right_sep = "block",
  },
  line_percentage = {
    provider = "line_percentage",
    hl = {
      fg = "orange",
    },
    left_sep = "block",
    right_sep = "block",
  },
}

local left = {
  s.end_pts,
  s.gitBranch,
  s.file_type,
  s.separator,
  s.gitDiffAdded,
  s.gitDiffRemoved,
  s.gitDiffChanged,
  s.separator,
  s.separator,
  s.diagnostic_errors,
  s.diagnostic_warnings,
  s.diagnostic_info,
  s.diagnostic_hints,
}

local right = {
  s.lsp_client_names,
  s.position,
  s.line_percentage,
  s.end_pts,
}

local left_inactive = {
  s.end_pts,
  s.file_type,
}

local right_inactive = {
  s.position,
  s.line_percentage,
  s.end_pts,
}

local components = {
  active = {
    left,
    right,
  },
  inactive = {
    left_inactive,
    right_inactive,
  },
}

local components_winbar = {
  active = {
    {
      w.file_name,
      w.separator,
      w.space,
      w.navic,
    },
  },
  inactive = {
    {
      w.file_name,
    },
  },
}

feline.setup {
  components = components,
  theme = one_monokai,
}

feline.winbar.setup { components = components_winbar }
