return {
  -- "lewis6991/impatient.nvim",
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/neodev.nvim",
    ft = "lua",
    config = true,
  },

  { "SmiteshP/nvim-navic", opts = { highlight = true } },
  "folke/tokyonight.nvim",
}
