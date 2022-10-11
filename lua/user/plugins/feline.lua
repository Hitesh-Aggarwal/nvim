local feline_ok, feline = pcall(require, "feline")
if not feline_ok then
  return
end

local one_monokai = {
  fg = "#c8d3f5",
  bg = "#1e2030",
  bg_dark = "#222436",
  green = "#c3e88d",
  yellow = "#ffc777",
  purple = "#fca7ea",
  orange = "#d19a66",
  fg_dark = "#a9b1d6",
  red = "#ff757f",
  teal = "#4fd6be",
  dark_red = "#c53b53",
}

local w = {
  file_name = {
    provider = "file_info",
    hl = {
      fg = "teal",
      bg = "bg_dark",
    },
  },
  navic = {
    provider = require("nvim-navic").get_location,
    enabled = require("nvim-navic").is_available,
    hl = {
      bg = "bg_dark",
    },
    left_sep = {
      str = "block",
      hl = {
        fg = "bg_dark",
        bg = "bg_dark",
      },
    },
  },
  separator = {
    provider = " ",
    hl = {
      bg = "bg_dark",
    },
    enabled = require("nvim-navic").is_available,
    right_sep = {
      str = "slant_left_thin",
      hl = {
        bg = "bg_dark",
      },
    },
  },
}

local s = {
  component = function(name, color, separator)
    separator = separator or ""
    return {
      provider = name,
      hl = {
        fg = color,
      },
      left_sep = separator,
      right_sep =  separator,
    }
  end,
  end_pts = {
    provider = " ",
    hl = {
      fg = "teal",
      bg = "teal",
    },
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
}

local left = {
  s.end_pts,
  s.gitBranch,
  s.file_type,
  s.component(" ", "fg"),
  s.component("git_diff_added", "green"),
  s.component("git_diff_removed", "red"),
  s.component("git_diff_changed", "fg"),
  s.component(" ", "fg", "block"),
  s.component("diagnostic_errors", "dark_red"),
  s.component("diagnostic_warnings", "yellow"),
  s.component("diagnostic_hints", "teal"),
  s.component("diagnostic_info", "fg"),
}

local right = {
  s.component("lsp_client_names", "fg_dark", "block"),
  s.component("position", "green", "block"),
  s.component("line_percentage", "orange", "block"),
  s.end_pts,
}

local left_inactive = {
  s.end_pts,
  s.file_type,
}

local right_inactive = {
  s.component("position", "green", "block"),
  s.component("line_percentage", "orange", "block"),
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
