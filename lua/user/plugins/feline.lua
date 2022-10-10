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
    left_sep = {
      str = "block",
      hl = {
        fg = "bg2",
        bg = "bg2",
      },
    },
  },
  separator = {
    provider = " ",
    hl = {
      bg = "bg2",
    },
    enabled = require("nvim-navic").is_available,
    right_sep = {
      str = "slant_left_thin",
      hl = {
        bg = "bg2",
      },
    },
  },
}

local s = {
  provider_and_fg = function(name, color)
    return {
      provider = name,
      hl = {
        fg = color,
      },
    }
  end,
  provider_and_fg_space = function(name, color)
    return {
      provider = name,
      hl = {
        fg = color,
      },
      left_sep = "block",
      right_sep = "block",
    }
  end,
  end_pts = {
    provider = " ",
    hl = {
      fg = "aqua",
      bg = "aqua",
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
  s.provider_and_fg(" ", "fg"),
  s.provider_and_fg("git_diff_added", "green"),
  s.provider_and_fg("git_diff_removed", "red"),
  s.provider_and_fg("git_diff_changed", "fg"),
  s.provider_and_fg_space(" ", "fg"),
  s.provider_and_fg("diagnostic_errors", "dark_red"),
  s.provider_and_fg("diagnostic_warnings", "yellow"),
  s.provider_and_fg("diagnostic_hints", "aqua"),
  s.provider_and_fg("diagnostic_info", "fg"),
}

local right = {
  s.provider_and_fg_space("lsp_client_names", "peanut"),
  s.provider_and_fg_space("position","green"),
  s.provider_and_fg_space("line_percentage", "orange"),
  s.end_pts,
}

local left_inactive = {
  s.end_pts,
  s.file_type,
}

local right_inactive = {
  s.provider_and_fg_space("position", "green"),
  s.provider_and_fg_space("line_percentage", "orange"),
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
