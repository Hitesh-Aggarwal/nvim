return {
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      {"gcc", mode = "n"},
      {"gbc", mode = "n"},
      {"gc", mode = "v"},
      {"gb", mode = "v"},
    },
    config = true,
  },
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
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
